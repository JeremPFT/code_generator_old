--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Model.Class_Def.Object_T_Test_Data.Object_T_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Model.Class_Def.Object_T_Test_Data.Object_T_Tests.Test_Object_T);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Has_Protected_Subprograms_435a35 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Number_Of_Protected_Subprograms_ec9966 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Get_Protected_Subprogram_2e7090 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Add_Protected_Subprogram_3a0e37 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Has_Private_Subprograms_68d4b5 : aliased Runner_1.Test_Case;
   Case_6_1_Test_Number_Of_Private_Subprograms_cfe126 : aliased Runner_1.Test_Case;
   Case_7_1_Test_Get_Private_Subprogram_409fed : aliased Runner_1.Test_Case;
   Case_8_1_Test_Add_Private_Subprogram_8398da : aliased Runner_1.Test_Case;
   Case_9_1_Test_To_String_4f6cb9 : aliased Runner_1.Test_Case;
   Case_1i_1_Test_Add_Comment_e58dfe : aliased Runner_1.Test_Case;
   Case_2i_1_Test_Number_Of_Comments_e75ee0 : aliased Runner_1.Test_Case;
   Case_3i_1_Test_Get_Comment_6d199b : aliased Runner_1.Test_Case;
   Case_4i_1_Test_Clear_Memory_973cfd : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Has_Protected_Subprograms_435a35,
         "model-class_def.ads:26:3:",
         Test_Has_Protected_Subprograms_435a35'Access);
      Runner_1.Create
        (Case_2_1_Test_Number_Of_Protected_Subprograms_ec9966,
         "model-class_def.ads:31:3:",
         Test_Number_Of_Protected_Subprograms_ec9966'Access);
      Runner_1.Create
        (Case_3_1_Test_Get_Protected_Subprogram_2e7090,
         "model-class_def.ads:36:3:",
         Test_Get_Protected_Subprogram_2e7090'Access);
      Runner_1.Create
        (Case_4_1_Test_Add_Protected_Subprogram_3a0e37,
         "model-class_def.ads:42:3:",
         Test_Add_Protected_Subprogram_3a0e37'Access);
      Runner_1.Create
        (Case_5_1_Test_Has_Private_Subprograms_68d4b5,
         "model-class_def.ads:47:3:",
         Test_Has_Private_Subprograms_68d4b5'Access);
      Runner_1.Create
        (Case_6_1_Test_Number_Of_Private_Subprograms_cfe126,
         "model-class_def.ads:52:3:",
         Test_Number_Of_Private_Subprograms_cfe126'Access);
      Runner_1.Create
        (Case_7_1_Test_Get_Private_Subprogram_409fed,
         "model-class_def.ads:57:3:",
         Test_Get_Private_Subprogram_409fed'Access);
      Runner_1.Create
        (Case_8_1_Test_Add_Private_Subprogram_8398da,
         "model-class_def.ads:63:3:",
         Test_Add_Private_Subprogram_8398da'Access);
      Runner_1.Create
        (Case_9_1_Test_To_String_4f6cb9,
         "model-class_def.ads:68:3:",
         Test_To_String_4f6cb9'Access);
      Runner_1.Create
        (Case_1i_1_Test_Add_Comment_e58dfe,
         "model-element.ads:28:3: inherited at model-class_def.ads:75:3:",
         Test_Add_Comment_e58dfe'Access);
      Runner_1.Create
        (Case_2i_1_Test_Number_Of_Comments_e75ee0,
         "model-element.ads:35:3: inherited at model-class_def.ads:75:3:",
         Test_Number_Of_Comments_e75ee0'Access);
      Runner_1.Create
        (Case_3i_1_Test_Get_Comment_6d199b,
         "model-element.ads:42:3: inherited at model-class_def.ads:75:3:",
         Test_Get_Comment_6d199b'Access);
      Runner_1.Create
        (Case_4i_1_Test_Clear_Memory_973cfd,
         "model-element.ads:50:3: inherited at model-class_def.ads:75:3:",
         Test_Clear_Memory_973cfd'Access);

      Result.Add_Test (Case_1_1_Test_Has_Protected_Subprograms_435a35'Access);
      Result.Add_Test (Case_2_1_Test_Number_Of_Protected_Subprograms_ec9966'Access);
      Result.Add_Test (Case_3_1_Test_Get_Protected_Subprogram_2e7090'Access);
      Result.Add_Test (Case_4_1_Test_Add_Protected_Subprogram_3a0e37'Access);
      Result.Add_Test (Case_5_1_Test_Has_Private_Subprograms_68d4b5'Access);
      Result.Add_Test (Case_6_1_Test_Number_Of_Private_Subprograms_cfe126'Access);
      Result.Add_Test (Case_7_1_Test_Get_Private_Subprogram_409fed'Access);
      Result.Add_Test (Case_8_1_Test_Add_Private_Subprogram_8398da'Access);
      Result.Add_Test (Case_9_1_Test_To_String_4f6cb9'Access);
      Result.Add_Test (Case_1i_1_Test_Add_Comment_e58dfe'Access);
      Result.Add_Test (Case_2i_1_Test_Number_Of_Comments_e75ee0'Access);
      Result.Add_Test (Case_3i_1_Test_Get_Comment_6d199b'Access);
      Result.Add_Test (Case_4i_1_Test_Clear_Memory_973cfd'Access);

      return Result'Access;

   end Suite;

end Model.Class_Def.Object_T_Test_Data.Object_T_Tests.Suite;
--  end read only
