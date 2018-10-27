with AUnit.Assertions;

with Project_Loader;
with Model.Project;
with Expected;

package body Model_Test.Cases.Parent_Project
is
  package Load renames Project_Loader;

  procedure Set_Up
    ( Test : in out Test_Case )
  is
  begin
    Load.Parent_Project ( Path => "path", Project_Name => Expected.Default_Project_Name );
    Load.Project ( Expected.Default_Module_Name );
  end Set_Up;

  procedure Register_Tests ( T: in out Test_Case ) is
    use AUnit.Test_Cases.Registration;
  begin
    Register_Routine (T,
                      Test_Has_Valid_Path'Access,
                      "Test_Has_Valid_Path");
    Register_Routine (T,
                      Test_Has_Valid_Name'Access,
                      "Test_Has_Valid_Name");
    Register_Routine (T,
                      Test_Subprojects_Length_Incremented'Access,
                      "Test_Subprojects_Length_Incremented");
    Register_Routine (T,
                      Test_Subproject_By_Name'Access,
                      "Test_Subproject_By_Name");
    Register_Routine (T,
                      Test_Subproject_By_Index'Access,
                      "Test_Subproject_By_Index");
    Register_Routine (T,
                      Test_Invalid_Name'Access,
                      "Test_Invalid_Name");
  end Register_Tests;


  use AUnit.Assertions;

  procedure Test_Has_Valid_Path
    ( T : in out aunit.Test_Cases.Test_Case'Class )
  is
    Name : constant String := "Has_Valid_Path";
  begin
    Assert
      ( Parent_Project.all.Get_Directory = Expected.Parent_Project.Get_Directory,
       "chemin du projet" );
  end Test_Has_Valid_Path;

  procedure Test_Has_Valid_Name
    ( T : in out aunit.Test_Cases.Test_Case'Class )
  is
    Got     : constant String := Parent_Project.all.Get_Name;
    Expect  : constant String := Expected.Default_Project_Name;
    Message : constant String := "unexpected module name: " &
      "expected '" & Expect & "', got '" & Got & "'";
  begin
    Assert
      ( Got = expect, Message );
  end Test_Has_Valid_Name;

  procedure Test_Subprojects_Length_Incremented
    ( T : in out aunit.Test_Cases.Test_Case'Class )
  is
  begin
    Assert
      ( Integer ( Parent_Project.all.Get_Subprojects.Length ) = 1,
       "test nombre de sous projets" );
  end Test_Subprojects_Length_Incremented;

  procedure Test_Subproject_By_Name
    ( T : in out aunit.Test_Cases.Test_Case'Class )
  is
  begin
    Assert ( Parent_Project.all.Get_Subproject( Expected.Default_Module_Name ) /= null,
            "test get subproject by name" );
  end Test_Subproject_By_Name;

  procedure Test_Subproject_By_Index
    ( T : in out aunit.Test_Cases.Test_Case'Class )
  is
  begin
    Assert ( Parent_Project.all.Get_Subproject( 1 ) /= null,
            "test get subproject by index" );
  end Test_Subproject_By_Index;

  procedure Test_Invalid_Name_Impl
  is
    Project : access Model.Project.Object_T'Class :=
      Parent_Project.all.Get_Subproject( Expected.Default_Module_Name );
    --  Project : access Model.Project.Object_T'Class :=
    --  Parent_Project.all.Get_Subproject( "$^%*" );
  begin
    null;
  end test_invalid_name_impl;

  procedure Test_Invalid_Name
    ( T : in out aunit.Test_Cases.Test_Case'Class )
  is
  begin
    Assert_Exception ( Test_Invalid_Name_Impl'Access,
                      "exception expected when unknown module name" );
  end Test_Invalid_Name;

end Model_Test.Cases.Parent_Project;
