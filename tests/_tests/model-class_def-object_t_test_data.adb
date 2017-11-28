--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Model.Class_Def.Object_T_Test_Data is

  --  Local_Object_T : aliased GNATtest_Generated.GNATtest_Standard.Model.Class_Def.Object_T;

  procedure Set_Up (Gnattest_T : in out Test_Object_T) is

    Local_Package : access Model.Package_Def.Object_T :=
      Model.Package_Def.Create (Name => Fixtures.Package_1_Name);

    Local_Class : access Model.Class_Def.Object_T'Class :=
      Model.Class_Def.Create
        (Owner_Package => Local_Package,
         Name          => Fixtures.Class_1_Name);

  begin
    Model.Interface_Def.Object_T_Test_Data.Object_T_Tests.
      Test_Object_T (Gnattest_T).Set_Up;
    Gnattest_T.Fixture := Model.Element.Object_T_Test_Data.
      Object_T_Access (Local_Class);
  end Set_Up;

  procedure Tear_Down (Gnattest_T : in out Test_Object_T) is
  begin
    Gnattest_Generated.Gnattest_Standard.Model.Interface_Def.Object_T_Test_Data.Object_T_Tests.Test_Object_T(Gnattest_T).Tear_Down;
  end Tear_Down;

end Model.Class_Def.Object_T_Test_Data;
