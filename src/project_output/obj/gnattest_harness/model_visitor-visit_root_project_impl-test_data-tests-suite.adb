--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Model_Visitor.Visit_Root_Project_Impl.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Model_Visitor.Visit_Root_Project_Impl.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Init_Impl_c66eb3 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Create_Directories_29d048 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Create_Files_2a6d9d : aliased Runner_1.Test_Case;
   Case_4_1_Test_Debug_Flag_Begin_34d8df : aliased Runner_1.Test_Case;
   Case_5_1_Test_Debug_Flag_End_84c8e6 : aliased Runner_1.Test_Case;
   Case_6_1_Test_Process_Modules_ef248f : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Init_Impl_c66eb3,
         "model_visitor-visit_root_project_impl.ads:3:3:",
         Test_Init_Impl_c66eb3'Access);
      Runner_1.Create
        (Case_2_1_Test_Create_Directories_29d048,
         "model_visitor-visit_root_project_impl.ads:6:3:",
         Test_Create_Directories_29d048'Access);
      Runner_1.Create
        (Case_3_1_Test_Create_Files_2a6d9d,
         "model_visitor-visit_root_project_impl.ads:7:3:",
         Test_Create_Files_2a6d9d'Access);
      Runner_1.Create
        (Case_4_1_Test_Debug_Flag_Begin_34d8df,
         "model_visitor-visit_root_project_impl.ads:8:3:",
         Test_Debug_Flag_Begin_34d8df'Access);
      Runner_1.Create
        (Case_5_1_Test_Debug_Flag_End_84c8e6,
         "model_visitor-visit_root_project_impl.ads:9:3:",
         Test_Debug_Flag_End_84c8e6'Access);
      Runner_1.Create
        (Case_6_1_Test_Process_Modules_ef248f,
         "model_visitor-visit_root_project_impl.ads:10:3:",
         Test_Process_Modules_ef248f'Access);

      Result.Add_Test (Case_1_1_Test_Init_Impl_c66eb3'Access);
      Result.Add_Test (Case_2_1_Test_Create_Directories_29d048'Access);
      Result.Add_Test (Case_3_1_Test_Create_Files_2a6d9d'Access);
      Result.Add_Test (Case_4_1_Test_Debug_Flag_Begin_34d8df'Access);
      Result.Add_Test (Case_5_1_Test_Debug_Flag_End_84c8e6'Access);
      Result.Add_Test (Case_6_1_Test_Process_Modules_ef248f'Access);

      return Result'Access;

   end Suite;

end Model_Visitor.Visit_Root_Project_Impl.Test_Data.Tests.Suite;
--  end read only
