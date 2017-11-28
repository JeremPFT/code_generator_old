--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

with Model.Element.Object_T_Test_Data.Object_T_Tests;

with Gnattest_Generated;
--  with Model.Named_Element;
with Fixtures;

package Model.Comment.Object_T_Test_Data is

  --  begin read only
  type Test_Object_T is new
    Gnattest_Generated.Gnattest_Standard.Model.Element.Object_T_Test_Data.Object_T_Tests.Test_Object_T
    --  end read only
    with null record;

  procedure Set_Up (Gnattest_T : in out Test_Object_T);
  procedure Tear_Down (Gnattest_T : in out Test_Object_T);

end Model.Comment.Object_T_Test_Data;
