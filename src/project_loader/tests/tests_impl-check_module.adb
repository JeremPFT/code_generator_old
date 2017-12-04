separate (Tests_Impl)

package body Check_Module is

  procedure Only_Its_Root_Package
  is
    Module : access Model.Module.Object_T'Class :=
      Model.Module.Class_T (Data.Project.Get_Subproject (1));
  begin
    Assert (Module.Number_Of_Elements = 1,
            "module should only have its root package");
  exception
    when Assertion_Error => null;
  end Only_Its_Root_Package;

  -----------------------------------------------------------------------------

  procedure Has_Valid_Module_Number
  is
  begin
    Assert
      (Integer (Data.Project.Get_Subprojects.Length) = 1,
       "nombre de modules");
  exception
    when Assertion_Error => null;
  end Has_Valid_Module_Number;

  -----------------------------------------------------------------------------

  procedure Has_Valid_Module_Name
  is
    Name : constant String :=
      Data.Project.Get_Subproject ("module_1").Get_Name;
  begin
    Assert
      (Name = "module_1",
       "get_subproject");
  exception
    when Assertion_Error => null;
  end Has_Valid_Module_Name;

  -----------------------------------------------------------------------------

  procedure Try_With_Bad_Module_Name;

  procedure Error_If_Unknown_Module_Name
  is
  begin
    Assert_Exception
      (Try_With_Bad_Module_Name'Access,
       "pas d'exception pour un nom de module non défini");
  exception
    when Assertion_Error => null;
  end Error_If_Unknown_Module_Name;

  procedure Try_With_Bad_Module_Name
  is
    Tmp  : access Model.Project.Object_T := null;
    Name : constant String               := "an inexistant name";
  begin
    Tmp := Data.Project.Get_Subproject (Name);
  end Try_With_Bad_Module_Name;

end Check_Module;
