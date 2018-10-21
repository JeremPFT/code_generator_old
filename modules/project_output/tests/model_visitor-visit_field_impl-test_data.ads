--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

with AUnit.Test_Fixtures;

with Model.Named_Element;

package Model_Visitor.Visit_Field_Impl.Test_Data is

  --  begin read only
  type Test is new AUnit.Test_Fixtures.Test_Fixture
    --  end read only
    with record
      Field_With_Default    : access Model.Field.Object_T'Class := null;
      Field_Without_Default : access Model.Field.Object_T'Class := null;

      Visitor : Object_T;
    end record;

  procedure Set_Up (Gnattest_T : in out Test);
  procedure Tear_Down (Gnattest_T : in out Test);

end Model_Visitor.Visit_Field_Impl.Test_Data;
