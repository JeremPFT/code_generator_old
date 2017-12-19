package body Project_Loader.Class_Impl.Options is

  -----------------------------------------------------------------------------

  overriding
  procedure Process (Self : in Abstract_Option_T)
  is
    pragma Unreferenced (Self);
  begin
    Parsed_Data.Opt_Abstract := True;
  end Process;

  -----------------------------------------------------------------------------

  overriding
  procedure Process (Self : in Create_Option_T)
  is
    pragma Unreferenced (Self);
  begin
    null;
    --  Parsed_Data.Has_Create := True;
  end Process;

  -----------------------------------------------------------------------------

  overriding
  procedure Process (Self : in Init_Option_T)
  is
    pragma Unreferenced (Self);
  begin
    null;
    --  Parsed_Data.Has_Init := True;
  end Process;

  -----------------------------------------------------------------------------

  function Option_Factory
    (Key : in String)
    return access Option_T'Class is
  begin
    if Key = "abstract" then
      return new Abstract_Option_T;
    elsif Key = "create" then
      return new Create_Option_T;
    elsif Key = "init" then
      return new Init_Option_T;
    else
      raise Unknown_Class_Option with "option """ & Key &
        """ inconnue (class """ & Parsed_Data.Class_Name.all & """)";
    end if;
  end Option_Factory;

  -----------------------------------------------------------------------------

end Project_Loader.Class_Impl.Options;
