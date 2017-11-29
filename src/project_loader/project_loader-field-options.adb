with Ada.Text_IO;

separate (Project_Loader.Field)

package body Options is

  package T_IO renames Ada.Text_IO;

  -----------------------------------------------------------------------------

  overriding
  procedure Process (Self : in Treat_As_String_Option_T)
  is
    pragma Unreferenced (Self);
  begin
    T_IO.Put_Line ("field option treat_as_string");
  end Process;

  -----------------------------------------------------------------------------

  overriding
  procedure Process (Self : in Create_Option_T)
  is
    pragma Unreferenced (Self);
  begin
    T_IO.Put_Line ("field option create");
  end Process;

  -----------------------------------------------------------------------------

  overriding
  procedure Process (Self : in Get_Option_T)
  is
    pragma Unreferenced (Self);
  begin
    T_IO.Put_Line ("field option get");
  end Process;

  -----------------------------------------------------------------------------

  overriding
  procedure Process (Self : in Get_I_Option_T)
  is
    pragma Unreferenced (Self);
  begin
    T_IO.Put_Line ("field option get_i");
  end Process;

  -----------------------------------------------------------------------------

  overriding
  procedure Process (Self : in Has_Option_T)
  is
    pragma Unreferenced (Self);
  begin
    T_IO.Put_Line ("field option has");
  end Process;

  -----------------------------------------------------------------------------

  overriding
  procedure Process (Self : in Number_Option_T)
  is
    pragma Unreferenced (Self);
  begin
    T_IO.Put_Line ("field option number");
  end Process;

  -----------------------------------------------------------------------------

  overriding
  procedure Process (Self : in Add_Option_T)
  is
    pragma Unreferenced (Self);
  begin
    T_IO.Put_Line ("field option add");
  end Process;

  -----------------------------------------------------------------------------

  function Option_Factory
    (Key : in String)
    return access Option_T'Class
  is
  begin
    if Key = "treat_as_string" then
      return new Treat_As_String_Option_T;
    elsif Key = "create" then
      return new Create_Option_T;
    elsif Key = "get" then
      return new Get_Option_T;
    elsif Key = "get_i" then
      return new Get_I_Option_T;
    elsif Key = "has" then
      return new Has_Option_T;
    elsif Key = "number" then
      return new Number_Option_T;
    elsif Key = "add" then
      return new Add_Option_T;
    else
      raise Constraint_Error with "option """ & Key &
        """ inconnue (class """ & Last_Class.Owner_Package.Get_Name & """" &
        ", field """ & Parsed_Data.Field_Name.all & """)";
    end if;
  end Option_Factory;

  -----------------------------------------------------------------------------

end Options;
