--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Model.Operation.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Model.Operation.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Initialize_d03124 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Create_15481f : aliased Runner_1.Test_Case;
   Case_3_1_Test_Create_As_Unit_7c8299 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Create_In_Package_cb8498 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Create_In_Class_69048a : aliased Runner_1.Test_Case;
   Case_6_1_Test_Only_One_Namespace_8ef432 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Initialize_d03124,
         "model-operation.ads:47:3:",
         Test_Initialize_d03124'Access);
      Runner_1.Create
        (Case_2_1_Test_Create_15481f,
         "model-operation.ads:59:3:",
         Test_Create_15481f'Access);
      Runner_1.Create
        (Case_3_1_Test_Create_As_Unit_7c8299,
         "model-operation.ads:75:3:",
         Test_Create_As_Unit_7c8299'Access);
      Runner_1.Create
        (Case_4_1_Test_Create_In_Package_cb8498,
         "model-operation.ads:83:3:",
         Test_Create_In_Package_cb8498'Access);
      Runner_1.Create
        (Case_5_1_Test_Create_In_Class_69048a,
         "model-operation.ads:91:3:",
         Test_Create_In_Class_69048a'Access);
      Runner_1.Create
        (Case_6_1_Test_Only_One_Namespace_8ef432,
         "model-operation.ads:156:3:",
         Test_Only_One_Namespace_8ef432'Access);

      Result.Add_Test (Case_1_1_Test_Initialize_d03124'Access);
      Result.Add_Test (Case_2_1_Test_Create_15481f'Access);
      Result.Add_Test (Case_3_1_Test_Create_As_Unit_7c8299'Access);
      Result.Add_Test (Case_4_1_Test_Create_In_Package_cb8498'Access);
      Result.Add_Test (Case_5_1_Test_Create_In_Class_69048a'Access);
      Result.Add_Test (Case_6_1_Test_Only_One_Namespace_8ef432'Access);

      return Result'Access;

   end Suite;

end Model.Operation.Test_Data.Tests.Suite;
--  end read only
