--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Model.Comment.Object_T_Test_Data is

  Local_Object_T : aliased Gnattest_Generated.Gnattest_Standard.Model.Comment.Object_T;

  procedure Set_Up (Gnattest_T : in out Test_Object_T) is

    --  Local_Comment : access Model.Comment.Object_T :=
    --    Model.Comment.Create (Text => Fixtures.Comment_1_Body);

  begin
    Model.Element.Object_T_Test_Data.Object_T_Tests.
      Test_Object_T(Gnattest_T).Set_Up;

    Local_Object_T.Initialize (Text => Fixtures.Comment_1_Body);

    Gnattest_T.Fixture := Local_Object_T'Access;

    --  Gnattest_T.Fixture := Model.Element.Object_T_Test_Data.
    --    Object_T_Access (Local_Comment);
  end Set_Up;

  procedure Tear_Down (Gnattest_T : in out Test_Object_T) is
  begin
    Gnattest_Generated.Gnattest_Standard.Model.Element.Object_T_Test_Data.Object_T_Tests.Test_Object_T(Gnattest_T).Tear_Down;
  end Tear_Down;

end Model.Comment.Object_T_Test_Data;
