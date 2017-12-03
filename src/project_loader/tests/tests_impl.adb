with Expected;
with AUnit.Assertions;

with Model.Project;

package body Tests_Impl is

  -----------------------------------------------------------------------------

  Data : Project_Loader.Data_T;

  -----------------------------------------------------------------------------

  procedure Initialize
    (Data : in Project_Loader.Data_T)
  is
  begin
    Tests_Impl.Data := Data;
  end Initialize;

  -----------------------------------------------------------------------------

  procedure Check_Project_Has_Valid_Path
  is
  begin
    AUnit.Assertions.Assert
      (Data.Path.all = Expected.Path,
       "chemin du projet");
  exception
    when AUnit.Assertions.Assertion_Error => null;
  end Check_Project_Has_Valid_Path;

  -----------------------------------------------------------------------------

  procedure Check_Project_Has_Valid_Name
  is
  begin
    AUnit.Assertions.Assert
      (Data.Project.Get_Name = Expected.Project.Get_Name,
       "nom du projet");
  exception
    when AUnit.Assertions.Assertion_Error => null;
  end Check_Project_Has_Valid_Name;

  -----------------------------------------------------------------------------

  procedure Check_Module_Has_Valid_Module_Number
  is
  begin
    AUnit.Assertions.Assert
      (Integer (Data.Project.Get_Subprojects.Length) = 2,
       "nombre de modules");
  exception
    when AUnit.Assertions.Assertion_Error => null;
  end Check_Module_Has_Valid_Module_Number;

  -----------------------------------------------------------------------------

  procedure Check_Module_Has_Valid_Module_Name
  is
    Name : constant String :=
      Data.Project.Get_Subproject ("module_1").Get_Name;
  begin
    AUnit.Assertions.Assert
      (Name = "module_1",
       "get_subproject");
  exception
    when AUnit.Assertions.Assertion_Error => null;
  end Check_Module_Has_Valid_Module_Name;

  -----------------------------------------------------------------------------

  procedure Try_With_Bad_Module_Name;

  procedure Check_Module_Error_If_Unknown_Module_Name
  is
  begin
    AUnit.Assertions.Assert_Exception
      (Try_With_Bad_Module_Name'Access,
       "pas d'exception pour un nom de module non défini");
  exception
    when AUnit.Assertions.Assertion_Error => null;
  end Check_Module_Error_If_Unknown_Module_Name;

  procedure Try_With_Bad_Module_Name
  is
    Tmp  : access Model.Project.Object_T := null;
    Name : constant String               := "an inexistant name";
  begin
    Tmp := Data.Project.Get_Subproject (Name);
  end Try_With_Bad_Module_Name;


  -----------------------------------------------------------------------------
end Tests_Impl;
