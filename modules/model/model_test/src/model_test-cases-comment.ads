with AUnit;
with AUnit.Test_Cases;

with Model.Comment;

package Model_Test.Cases.Comment
is

  type Test_Case is new AUnit.Test_Cases.Test_Case with private;

  overriding
  function Name
    (Test : Test_Case)
    return AUnit.Message_String
    is ( AUnit.Format ( "Comment" ) ) ;

  overriding
  procedure Register_Tests
    ( T: in out Test_Case );

  overriding
  procedure Set_Up
    ( Test : in out Test_Case );

  procedure Test_Create
    ( T : in out AUnit.Test_Cases.Test_Case'Class );

private

  type Test_Case is new AUnit.Test_Cases.Test_Case with
    null record;

end Model_Test.Cases.Comment;
