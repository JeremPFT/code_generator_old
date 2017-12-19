--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Model_Visitor.Object_T_Test_Data.Object_T_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Model_Visitor.Object_T_Test_Data.Object_T_Tests.Test_Object_T);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Set_Root_Directory_8e53ec : aliased Runner_1.Test_Case;
   Case_2_1_Test_Get_Root_Directory_585e7b : aliased Runner_1.Test_Case;
   Case_3_1_Test_Visit_Class_e1be25 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Visit_Comment_43158c : aliased Runner_1.Test_Case;
   Case_5_1_Test_Visit_Dependency_858ce6 : aliased Runner_1.Test_Case;
   Case_6_1_Test_Visit_Element_99a399 : aliased Runner_1.Test_Case;
   Case_7_1_Test_Visit_Field_900167 : aliased Runner_1.Test_Case;
   Case_8_1_Test_Visit_Interface_646d59 : aliased Runner_1.Test_Case;
   Case_9_1_Test_Visit_Namespace_d63233 : aliased Runner_1.Test_Case;
   Case_10_1_Test_Visit_Operation_b1498f : aliased Runner_1.Test_Case;
   Case_11_1_Test_Visit_Package_3d7822 : aliased Runner_1.Test_Case;
   Case_12_1_Test_Visit_Parameter_b3c795 : aliased Runner_1.Test_Case;
   Case_13_1_Test_Visit_Project_fd1cfb : aliased Runner_1.Test_Case;
   Case_14_1_Test_Visit_Root_Project_53f1f1 : aliased Runner_1.Test_Case;
   Case_15_1_Test_To_String_f3f623 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Set_Root_Directory_8e53ec,
         "model_visitor.ads:47:3:",
         Test_Set_Root_Directory_8e53ec'Access);
      Runner_1.Create
        (Case_2_1_Test_Get_Root_Directory_585e7b,
         "model_visitor.ads:51:3:",
         Test_Get_Root_Directory_585e7b'Access);
      Runner_1.Create
        (Case_3_1_Test_Visit_Class_e1be25,
         "model_visitor.ads:57:3:",
         Test_Visit_Class_e1be25'Access);
      Runner_1.Create
        (Case_4_1_Test_Visit_Comment_43158c,
         "model_visitor.ads:62:3:",
         Test_Visit_Comment_43158c'Access);
      Runner_1.Create
        (Case_5_1_Test_Visit_Dependency_858ce6,
         "model_visitor.ads:67:3:",
         Test_Visit_Dependency_858ce6'Access);
      Runner_1.Create
        (Case_6_1_Test_Visit_Element_99a399,
         "model_visitor.ads:72:3:",
         Test_Visit_Element_99a399'Access);
      Runner_1.Create
        (Case_7_1_Test_Visit_Field_900167,
         "model_visitor.ads:77:3:",
         Test_Visit_Field_900167'Access);
      Runner_1.Create
        (Case_8_1_Test_Visit_Interface_646d59,
         "model_visitor.ads:82:3:",
         Test_Visit_Interface_646d59'Access);
      Runner_1.Create
        (Case_9_1_Test_Visit_Namespace_d63233,
         "model_visitor.ads:87:3:",
         Test_Visit_Namespace_d63233'Access);
      Runner_1.Create
        (Case_10_1_Test_Visit_Operation_b1498f,
         "model_visitor.ads:92:3:",
         Test_Visit_Operation_b1498f'Access);
      Runner_1.Create
        (Case_11_1_Test_Visit_Package_3d7822,
         "model_visitor.ads:97:3:",
         Test_Visit_Package_3d7822'Access);
      Runner_1.Create
        (Case_12_1_Test_Visit_Parameter_b3c795,
         "model_visitor.ads:102:3:",
         Test_Visit_Parameter_b3c795'Access);
      Runner_1.Create
        (Case_13_1_Test_Visit_Project_fd1cfb,
         "model_visitor.ads:107:3:",
         Test_Visit_Project_fd1cfb'Access);
      Runner_1.Create
        (Case_14_1_Test_Visit_Root_Project_53f1f1,
         "model_visitor.ads:112:3:",
         Test_Visit_Root_Project_53f1f1'Access);
      Runner_1.Create
        (Case_15_1_Test_To_String_f3f623,
         "model_visitor.ads:119:3:",
         Test_To_String_f3f623'Access);

      Result.Add_Test (Case_1_1_Test_Set_Root_Directory_8e53ec'Access);
      Result.Add_Test (Case_2_1_Test_Get_Root_Directory_585e7b'Access);
      Result.Add_Test (Case_3_1_Test_Visit_Class_e1be25'Access);
      Result.Add_Test (Case_4_1_Test_Visit_Comment_43158c'Access);
      Result.Add_Test (Case_5_1_Test_Visit_Dependency_858ce6'Access);
      Result.Add_Test (Case_6_1_Test_Visit_Element_99a399'Access);
      Result.Add_Test (Case_7_1_Test_Visit_Field_900167'Access);
      Result.Add_Test (Case_8_1_Test_Visit_Interface_646d59'Access);
      Result.Add_Test (Case_9_1_Test_Visit_Namespace_d63233'Access);
      Result.Add_Test (Case_10_1_Test_Visit_Operation_b1498f'Access);
      Result.Add_Test (Case_11_1_Test_Visit_Package_3d7822'Access);
      Result.Add_Test (Case_12_1_Test_Visit_Parameter_b3c795'Access);
      Result.Add_Test (Case_13_1_Test_Visit_Project_fd1cfb'Access);
      Result.Add_Test (Case_14_1_Test_Visit_Root_Project_53f1f1'Access);
      Result.Add_Test (Case_15_1_Test_To_String_f3f623'Access);

      return Result'Access;

   end Suite;

end Model_Visitor.Object_T_Test_Data.Object_T_Tests.Suite;
--  end read only
