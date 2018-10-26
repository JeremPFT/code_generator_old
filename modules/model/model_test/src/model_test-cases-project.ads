with AUnit;
with AUnit.Test_Cases;

with Model.Root_Project;
with Model.Project;

package Model_Test.Cases.Project
is

  type Test_Case is new AUnit.Test_Cases.Test_Case with private;

  overriding
  function Name
    (Test : Test_Case)
    return AUnit.Message_String
    is ( AUnit.Format ( "Project" ) ) ;

  overriding
  procedure Register_Tests
    ( T: in out Test_Case );

  overriding
  procedure Set_Up
    ( Test : in out Test_Case );

  procedure Test_Create_With_Parent_Has_Parent
    ( T : in out aunit.Test_Cases.Test_Case'Class );

  procedure Test_Create_No_Parent_Has_No_Parent
    ( T : in out aunit.Test_Cases.Test_Case'Class );

  procedure Test_Has_Given_Name
    ( T : in out aunit.Test_Cases.Test_Case'Class );

  --  procedure Test_has

private

  type Test_Case is new AUnit.Test_Cases.Test_Case with
    null record;

end Model_Test.Cases.Project;
