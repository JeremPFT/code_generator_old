--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Model.Subprogram.Object_T_Test_Data.Object_T_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Model.Subprogram.Object_T_Test_Data.Object_T_Tests.Test_Object_T);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Set_Type_f75e54 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Get_Type_d441e6 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Has_Return_23a7e6 : aliased Runner_1.Test_Case;
   Case_1i_1_Test_Add_Comment_e58dfe : aliased Runner_1.Test_Case;
   Case_2i_1_Test_Number_Of_Comments_e75ee0 : aliased Runner_1.Test_Case;
   Case_3i_1_Test_Get_Comment_6d199b : aliased Runner_1.Test_Case;
   Case_4i_1_Test_Set_Name_f456f1 : aliased Runner_1.Test_Case;
   Case_5i_1_Test_Get_Name_ba8460 : aliased Runner_1.Test_Case;
   Case_6i_1_Test_To_String_4f6cb9 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Set_Type_f75e54,
         "model-subprogram.ads:33:3:",
         Test_Set_Type_f75e54'Access);
      Runner_1.Create
        (Case_2_1_Test_Get_Type_d441e6,
         "model-subprogram.ads:38:3:",
         Test_Get_Type_d441e6'Access);
      Runner_1.Create
        (Case_3_1_Test_Has_Return_23a7e6,
         "model-subprogram.ads:43:3:",
         Test_Has_Return_23a7e6'Access);
      Runner_1.Create
        (Case_1i_1_Test_Add_Comment_e58dfe,
         "model-element.ads:17:3: inherited at model-subprogram.ads:50:3:",
         Test_Add_Comment_e58dfe'Access);
      Runner_1.Create
        (Case_2i_1_Test_Number_Of_Comments_e75ee0,
         "model-element.ads:22:3: inherited at model-subprogram.ads:50:3:",
         Test_Number_Of_Comments_e75ee0'Access);
      Runner_1.Create
        (Case_3i_1_Test_Get_Comment_6d199b,
         "model-element.ads:27:3: inherited at model-subprogram.ads:50:3:",
         Test_Get_Comment_6d199b'Access);
      Runner_1.Create
        (Case_4i_1_Test_Set_Name_f456f1,
         "model-named_element.ads:19:3: inherited at model-subprogram.ads:50:3:",
         Test_Set_Name_f456f1'Access);
      Runner_1.Create
        (Case_5i_1_Test_Get_Name_ba8460,
         "model-named_element.ads:24:3: inherited at model-subprogram.ads:50:3:",
         Test_Get_Name_ba8460'Access);
      Runner_1.Create
        (Case_6i_1_Test_To_String_4f6cb9,
         "model-named_element.ads:29:3: inherited at model-subprogram.ads:50:3:",
         Test_To_String_4f6cb9'Access);

      Result.Add_Test (Case_1_1_Test_Set_Type_f75e54'Access);
      Result.Add_Test (Case_2_1_Test_Get_Type_d441e6'Access);
      Result.Add_Test (Case_3_1_Test_Has_Return_23a7e6'Access);
      Result.Add_Test (Case_1i_1_Test_Add_Comment_e58dfe'Access);
      Result.Add_Test (Case_2i_1_Test_Number_Of_Comments_e75ee0'Access);
      Result.Add_Test (Case_3i_1_Test_Get_Comment_6d199b'Access);
      Result.Add_Test (Case_4i_1_Test_Set_Name_f456f1'Access);
      Result.Add_Test (Case_5i_1_Test_Get_Name_ba8460'Access);
      Result.Add_Test (Case_6i_1_Test_To_String_4f6cb9'Access);

      return Result'Access;

   end Suite;

end Model.Subprogram.Object_T_Test_Data.Object_T_Tests.Suite;
--  end read only
