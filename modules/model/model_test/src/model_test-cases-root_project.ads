with AUnit;
with AUnit.Test_Cases;

with Model.Parent_Project;
with Project_Loader;

package Test_cases.Parent_Project
is

  type Test_Case is new AUnit.Test_Cases.Test_Case with private;

  overriding
  function Name
    (Test : Test_Case)
    return AUnit.Message_String
    is ( AUnit.Format ( "Parent_Project" ) ) ;

  overriding
  procedure Register_Tests
    ( T: in out Test_Case );

  overriding
  procedure Set_Up
    ( Test : in out Test_Case );

  procedure Test_Has_Valid_Path
    ( T : in out aunit.Test_Cases.Test_Case'Class );

  procedure Test_Has_Valid_Name
    ( T : in out aunit.Test_Cases.Test_Case'Class );

  procedure Test_Subprojects_Length_Incremented
    ( T : in out aunit.Test_Cases.Test_Case'Class );

  procedure Test_Subproject_By_Name
    ( T : in out aunit.Test_Cases.Test_Case'Class );

  procedure Test_Subproject_By_Index
    ( T : in out aunit.Test_Cases.Test_Case'Class );

  procedure Test_Invalid_Name
    ( T : in out aunit.Test_Cases.Test_Case'Class );

private

  type Test_Case is new AUnit.Test_Cases.Test_Case with
    null record;

  function Parent_Project return not null access Model.Parent_Project.Object_T'Class
    renames Project_Loader.Get_Parent_Project;

end Test_Cases.Parent_Project;
