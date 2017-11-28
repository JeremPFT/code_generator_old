--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.


with AUnit.Test_Fixtures;
with Model.Comment;

with Gnattest_Generated;

package Model.Element.Object_T_Test_Data is

  type Object_T_Access is access all Gnattest_Generated.Gnattest_Standard.Model.Element.Object_T'Class;

  --  begin read only
  type Test_Object_T is abstract new AUnit.Test_Fixtures.Test_Fixture
    --  end read only
    with record
      Fixture : Object_T_Access;
    end record;

end Model.Element.Object_T_Test_Data;
