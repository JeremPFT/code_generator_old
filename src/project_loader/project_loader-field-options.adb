with Ada.Strings.Fixed;
--  with Ada.Text_IO;

separate (Project_Loader.Field)

package body Options is

  --  package T_IO renames Ada.Text_IO;

  -----------------------------------------------------------------------------

  overriding
  procedure Process (Self : in Treat_As_Type_Option_T)
  is
  begin
    --  T_IO.Put_Line ("field option treat_as : """ &
    --                   Self.The_Type.all & """");
    Parsed_Data.Opt_Treat_As := True;
    Parsed_Data.Treat_As     := Self.The_Type;
  end Process;

  -----------------------------------------------------------------------------

  overriding
  procedure Process (Self : in Create_Option_T)
  is
    pragma Unreferenced (Self);
  begin
    --  T_IO.Put_Line ("field option create");
    null;
  end Process;

  -----------------------------------------------------------------------------

  overriding
  procedure Process (Self : in Get_Option_T)
  is
    pragma Unreferenced (Self);
  begin
    Parsed_Data.Opt_Get := True;
    --  T_IO.Put_Line ("field option get");
  end Process;

  -----------------------------------------------------------------------------

  overriding
  procedure Process (Self : in Set_Option_T)
  is
    pragma Unreferenced (Self);
  begin
    Parsed_Data.Opt_Set := True;
    --  T_IO.Put_Line ("field option set");
  end Process;

  -----------------------------------------------------------------------------

  overriding
  procedure Process (Self : in Get_I_Option_T)
  is
    pragma Unreferenced (Self);
  begin
    null;
    --  T_IO.Put_Line ("field option get_i");
  end Process;

  -----------------------------------------------------------------------------

  overriding
  procedure Process (Self : in Has_Option_T)
  is
    pragma Unreferenced (Self);
  begin
    null;
    --  T_IO.Put_Line ("field option has");
  end Process;

  -----------------------------------------------------------------------------

  overriding
  procedure Process (Self : in Number_Option_T)
  is
    pragma Unreferenced (Self);
  begin
    null;
    --  T_IO.Put_Line ("field option number");
  end Process;

  -----------------------------------------------------------------------------

  overriding
  procedure Process (Self : in Add_Option_T)
  is
    pragma Unreferenced (Self);
  begin
    --  T_IO.Put_Line ("field option add");
    Parsed_Data.Opt_Add := True;
  end Process;

  -----------------------------------------------------------------------------

  Treat_As_Sufix : constant String := "treat_as_";

  function Option_Factory
    (Key : in String)
    return access Option_T'Class
  is
    package F_Str renames Ada.Strings.Fixed;
    Result : access Option_T'Class := null;
  begin
    if Key'Length >= Treat_As_Sufix'Length and then
      F_Str.Head (Source => Key,
                  Count  => Treat_As_Sufix'Length) =
      Treat_As_Sufix
    then
      Result := new Treat_As_Type_Option_T;

      Treat_As_Type_Option_T (Result.all).The_Type :=
        new String'(F_Str.Tail
                      (Source => Key,
                       Count  => Key'Length - Treat_As_Sufix'Length));

    elsif Key = "create" then
      Result := new Create_Option_T;
    elsif Key = "get" then
      Result := new Get_Option_T;
    elsif Key = "set" then
      Result := new Set_Option_T;
    elsif Key = "get_i" then
      Result := new Get_I_Option_T;
    elsif Key = "has" then
      Result := new Has_Option_T;
    elsif Key = "number" then
      Result := new Number_Option_T;
    elsif Key = "add" then
      Result := new Add_Option_T;
    else
      raise Unknown_Field_Option with "option """ & Key &
        """ inconnue (class """ & Current_Class.Get_Owner_Namespace.Get_Name
        & """" &
        ", field """ & Parsed_Data.Field_Name.all & """)";
    end if;

    return Result;
  end Option_Factory;

  -----------------------------------------------------------------------------

end Options;
