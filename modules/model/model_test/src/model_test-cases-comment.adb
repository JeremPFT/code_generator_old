with AUnit.Assertions;

with Model.Comment;
with Expected;

package body Model_Test.Cases.Comment
is

  Comment : access Model.Comment.Object_T;

  procedure Set_Up
    ( Test : in out Test_Case )
  is
  begin
    Comment := Model.Comment.Create ( Text => Expected.Comment_1 );
  end Set_Up;

  procedure Register_Tests ( T: in out Test_Case ) is
    use AUnit.Test_Cases.Registration;
  begin

    Register_Routine (T,
                      Test_Create'Access,
                      "Test_Create");
  end Register_Tests;

  use AUnit.Assertions;

  procedure Assert_Expected
    ( Got : in String;
     Expected : in String )
  is
    Message : constant String := "unexpected value: " &
      "expected '" & Expected & "', got '" & Got & "'";
  begin
    Assert ( Got = Expected, Message );
  end Assert_Expected;

  procedure Assert_Expected
    ( Got : in Boolean;
     Expected : in Boolean )
  is
    Message : constant String := "unexpected value: " &
      "expected '" & Expected'Img & "', got '" & Got'Img & "'";
  begin
    Assert ( Got = Expected, Message );
  end Assert_Expected;

  procedure Test_Create
    ( T : in out AUnit.Test_Cases.Test_Case'Class )
  is
  begin
    -- tests are done with pre and post conditions in Model.Comment
    Assert ( True, "" );
  end Test_Create;

end Model_Test.Cases.Comment;
