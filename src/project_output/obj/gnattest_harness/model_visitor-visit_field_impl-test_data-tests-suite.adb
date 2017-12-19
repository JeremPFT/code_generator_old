--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Model_Visitor.Visit_Field_Impl.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Model_Visitor.Visit_Field_Impl.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Init_6597ca_78e722 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Set_Name_6bd702_78e722 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Set_Name_6bd702_8e3f1c : aliased Runner_1.Test_Case;
   Case_4_1_Test_Set_Type_b137e0_78e722 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Set_Type_b137e0_8e3f1c : aliased Runner_1.Test_Case;
   Case_6_1_Test_Set_Default_Value_4348e5_3a68d1 : aliased Runner_1.Test_Case;
   Case_7_1_Test_Set_Default_Value_4348e5_bd09c7 : aliased Runner_1.Test_Case;
   Case_8_1_Test_Set_Default_Value_4348e5_8e3f1c : aliased Runner_1.Test_Case;
   Case_9_1_Test_Set_Image_36d8f4_78e722 : aliased Runner_1.Test_Case;
   Case_10_1_Test_Set_Image_36d8f4_8e3f1c : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Init_6597ca_78e722,
         "model_visitor-visit_field_impl.ads:16:3:",
         Test_Init_6597ca_78e722'Access);
      Runner_1.Create
        (Case_2_1_Test_Set_Name_6bd702_78e722,
         "model_visitor-visit_field_impl.ads:20:3:",
         Test_Set_Name_6bd702_78e722'Access);
      Runner_1.Create
        (Case_3_1_Test_Set_Name_6bd702_8e3f1c,
         "model_visitor-visit_field_impl.ads:22:3:",
         Test_Set_Name_6bd702_8e3f1c'Access);
      Runner_1.Create
        (Case_4_1_Test_Set_Type_b137e0_78e722,
         "model_visitor-visit_field_impl.ads:26:3:",
         Test_Set_Type_b137e0_78e722'Access);
      Runner_1.Create
        (Case_5_1_Test_Set_Type_b137e0_8e3f1c,
         "model_visitor-visit_field_impl.ads:28:3:",
         Test_Set_Type_b137e0_8e3f1c'Access);
      Runner_1.Create
        (Case_6_1_Test_Set_Default_Value_4348e5_3a68d1,
         "model_visitor-visit_field_impl.ads:32:3:",
         Test_Set_Default_Value_4348e5_3a68d1'Access);
      Runner_1.Create
        (Case_7_1_Test_Set_Default_Value_4348e5_bd09c7,
         "model_visitor-visit_field_impl.ads:34:3:",
         Test_Set_Default_Value_4348e5_bd09c7'Access);
      Runner_1.Create
        (Case_8_1_Test_Set_Default_Value_4348e5_8e3f1c,
         "model_visitor-visit_field_impl.ads:36:3:",
         Test_Set_Default_Value_4348e5_8e3f1c'Access);
      Runner_1.Create
        (Case_9_1_Test_Set_Image_36d8f4_78e722,
         "model_visitor-visit_field_impl.ads:40:3:",
         Test_Set_Image_36d8f4_78e722'Access);
      Runner_1.Create
        (Case_10_1_Test_Set_Image_36d8f4_8e3f1c,
         "model_visitor-visit_field_impl.ads:42:3:",
         Test_Set_Image_36d8f4_8e3f1c'Access);

      Result.Add_Test (Case_1_1_Test_Init_6597ca_78e722'Access);
      Result.Add_Test (Case_2_1_Test_Set_Name_6bd702_78e722'Access);
      Result.Add_Test (Case_3_1_Test_Set_Name_6bd702_8e3f1c'Access);
      Result.Add_Test (Case_4_1_Test_Set_Type_b137e0_78e722'Access);
      Result.Add_Test (Case_5_1_Test_Set_Type_b137e0_8e3f1c'Access);
      Result.Add_Test (Case_6_1_Test_Set_Default_Value_4348e5_3a68d1'Access);
      Result.Add_Test (Case_7_1_Test_Set_Default_Value_4348e5_bd09c7'Access);
      Result.Add_Test (Case_8_1_Test_Set_Default_Value_4348e5_8e3f1c'Access);
      Result.Add_Test (Case_9_1_Test_Set_Image_36d8f4_78e722'Access);
      Result.Add_Test (Case_10_1_Test_Set_Image_36d8f4_8e3f1c'Access);

      return Result'Access;

   end Suite;

end Model_Visitor.Visit_Field_Impl.Test_Data.Tests.Suite;
--  end read only
