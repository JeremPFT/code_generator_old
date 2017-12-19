--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Project_Loader.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Project_Loader.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Root_Project_e22c5f : aliased Runner_1.Test_Case;
   Case_2_1_Test_Project_fc3287 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Class_6fc34a : aliased Runner_1.Test_Case;
   Case_4_1_Test_Field_078360 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Fields_186588 : aliased Runner_1.Test_Case;
   Case_6_1_Test_Operation_c64c68 : aliased Runner_1.Test_Case;
   Case_7_1_Test_Operations_e79d44 : aliased Runner_1.Test_Case;
   Case_8_1_Test_Close_e0b8a0 : aliased Runner_1.Test_Case;
   Case_9_1_Test_Constante_8b89d0 : aliased Runner_1.Test_Case;
   Case_10_1_Test_Get_Root_Project_8f996e : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Root_Project_e22c5f,
         "project_loader.ads:18:3:",
         Test_Root_Project_e22c5f'Access);
      Runner_1.Create
        (Case_2_1_Test_Project_fc3287,
         "project_loader.ads:27:3:",
         Test_Project_fc3287'Access);
      Runner_1.Create
        (Case_3_1_Test_Class_6fc34a,
         "project_loader.ads:31:3:",
         Test_Class_6fc34a'Access);
      Runner_1.Create
        (Case_4_1_Test_Field_078360,
         "project_loader.ads:51:3:",
         Test_Field_078360'Access);
      Runner_1.Create
        (Case_5_1_Test_Fields_186588,
         "project_loader.ads:54:3:",
         Test_Fields_186588'Access);
      Runner_1.Create
        (Case_6_1_Test_Operation_c64c68,
         "project_loader.ads:72:3:",
         Test_Operation_c64c68'Access);
      Runner_1.Create
        (Case_7_1_Test_Operations_e79d44,
         "project_loader.ads:75:3:",
         Test_Operations_e79d44'Access);
      Runner_1.Create
        (Case_8_1_Test_Close_e0b8a0,
         "project_loader.ads:78:3:",
         Test_Close_e0b8a0'Access);
      Runner_1.Create
        (Case_9_1_Test_Constante_8b89d0,
         "project_loader.ads:80:3:",
         Test_Constante_8b89d0'Access);
      Runner_1.Create
        (Case_10_1_Test_Get_Root_Project_8f996e,
         "project_loader.ads:82:3:",
         Test_Get_Root_Project_8f996e'Access);

      Result.Add_Test (Case_1_1_Test_Root_Project_e22c5f'Access);
      Result.Add_Test (Case_2_1_Test_Project_fc3287'Access);
      Result.Add_Test (Case_3_1_Test_Class_6fc34a'Access);
      Result.Add_Test (Case_4_1_Test_Field_078360'Access);
      Result.Add_Test (Case_5_1_Test_Fields_186588'Access);
      Result.Add_Test (Case_6_1_Test_Operation_c64c68'Access);
      Result.Add_Test (Case_7_1_Test_Operations_e79d44'Access);
      Result.Add_Test (Case_8_1_Test_Close_e0b8a0'Access);
      Result.Add_Test (Case_9_1_Test_Constante_8b89d0'Access);
      Result.Add_Test (Case_10_1_Test_Get_Root_Project_8f996e'Access);

      return Result'Access;

   end Suite;

end Project_Loader.Test_Data.Tests.Suite;
--  end read only
