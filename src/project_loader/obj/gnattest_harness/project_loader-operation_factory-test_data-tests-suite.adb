--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Project_Loader.Operation_Factory.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Project_Loader.Operation_Factory.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Self_In_dbd1f8 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Self_In_Out_60e8eb : aliased Runner_1.Test_Case;
   Case_3_1_Test_Create_Operation_And_Add_To_Namespace_6c1486 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Self_In_dbd1f8,
         "project_loader-operation_factory.ads:7:3:",
         Test_Self_In_dbd1f8'Access);
      Runner_1.Create
        (Case_2_1_Test_Self_In_Out_60e8eb,
         "project_loader-operation_factory.ads:10:3:",
         Test_Self_In_Out_60e8eb'Access);
      Runner_1.Create
        (Case_3_1_Test_Create_Operation_And_Add_To_Namespace_6c1486,
         "project_loader-operation_factory.ads:13:3:",
         Test_Create_Operation_And_Add_To_Namespace_6c1486'Access);

      Result.Add_Test (Case_1_1_Test_Self_In_dbd1f8'Access);
      Result.Add_Test (Case_2_1_Test_Self_In_Out_60e8eb'Access);
      Result.Add_Test (Case_3_1_Test_Create_Operation_And_Add_To_Namespace_6c1486'Access);

      return Result'Access;

   end Suite;

end Project_Loader.Operation_Factory.Test_Data.Tests.Suite;
--  end read only
