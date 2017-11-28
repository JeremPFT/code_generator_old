--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Model.Array_Def.Object_T_Test_Data is

  --  Local_Package  : aliased Gnattest_Generated.Gnattest_Standard.Model.Package_Def.Object_T;
  --  Local_Object_T : aliased Gnattest_Generated.Gnattest_Standard.Model.Array_Def.Object_T (Owner_Package => Local_Package'Access);

  procedure Set_Up (Gnattest_T : in out Test_Object_T) is

    Local_Package : access Model.Package_Def.Object_T :=
      Model.Package_Def.Create (Name => Fixtures.Package_1_Name);

    Local_Array : access Gnattest_Generated.Gnattest_Standard.Model.Array_Def.Object_T'Class :=
      Model.Array_Def.Create
        (Owner_Package  => Local_Package,
         Name           => Fixtures.Array_1_Name,
         Contained_Type => Fixtures.Array_1_Contained_Type,
         Index_Type     => Fixtures.Array_1_Index_Type,
         Defined_Range  => Fixtures.Array_1_Range);

  begin
    Model.Type_Def.Object_T_Test_Data.Object_T_Tests.
      Test_Object_T (Gnattest_T).Set_Up;
    Gnattest_T.Fixture := Model.Element.Object_T_Test_Data.
      Object_T_Access (Local_Array);
  end Set_Up;

  procedure Tear_Down (Gnattest_T : in out Test_Object_T) is
  begin
    Model.Type_Def.Object_T_Test_Data.Object_T_Tests.Test_Object_T(Gnattest_T).Tear_Down;
  end Tear_Down;

end Model.Array_Def.Object_T_Test_Data;
