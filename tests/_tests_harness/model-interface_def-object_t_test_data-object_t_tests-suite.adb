--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Model.Interface_Def.Object_T_Test_Data.Object_T_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Model.Interface_Def.Object_T_Test_Data.Object_T_Tests.Test_Object_T);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Has_Parent_Interfaces_fba38f : aliased Runner_1.Test_Case;
   Case_2_1_Test_Number_Of_Parent_Interfaces_3df96d : aliased Runner_1.Test_Case;
   Case_3_1_Test_Get_Parent_Interface_0be903 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Add_Parent_Interface_08d577 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Has_Public_Subprograms_1bd5a1 : aliased Runner_1.Test_Case;
   Case_6_1_Test_Number_Of_Public_Subprograms_f74f81 : aliased Runner_1.Test_Case;
   Case_7_1_Test_Get_Public_Subprogram_9dba15 : aliased Runner_1.Test_Case;
   Case_8_1_Test_Add_Public_Subprogram_b30524 : aliased Runner_1.Test_Case;
   Case_1i_1_Test_Add_Comment_e58dfe : aliased Runner_1.Test_Case;
   Case_2i_1_Test_Number_Of_Comments_e75ee0 : aliased Runner_1.Test_Case;
   Case_3i_1_Test_Get_Comment_6d199b : aliased Runner_1.Test_Case;
   Case_4i_1_Test_Set_Name_f456f1 : aliased Runner_1.Test_Case;
   Case_5i_1_Test_Get_Name_ba8460 : aliased Runner_1.Test_Case;
   Case_6i_1_Test_To_String_4f6cb9 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Has_Parent_Interfaces_fba38f,
         "model-interface_def.ads:31:3:",
         Test_Has_Parent_Interfaces_fba38f'Access);
      Runner_1.Create
        (Case_2_1_Test_Number_Of_Parent_Interfaces_3df96d,
         "model-interface_def.ads:36:3:",
         Test_Number_Of_Parent_Interfaces_3df96d'Access);
      Runner_1.Create
        (Case_3_1_Test_Get_Parent_Interface_0be903,
         "model-interface_def.ads:41:3:",
         Test_Get_Parent_Interface_0be903'Access);
      Runner_1.Create
        (Case_4_1_Test_Add_Parent_Interface_08d577,
         "model-interface_def.ads:47:3:",
         Test_Add_Parent_Interface_08d577'Access);
      Runner_1.Create
        (Case_5_1_Test_Has_Public_Subprograms_1bd5a1,
         "model-interface_def.ads:52:3:",
         Test_Has_Public_Subprograms_1bd5a1'Access);
      Runner_1.Create
        (Case_6_1_Test_Number_Of_Public_Subprograms_f74f81,
         "model-interface_def.ads:57:3:",
         Test_Number_Of_Public_Subprograms_f74f81'Access);
      Runner_1.Create
        (Case_7_1_Test_Get_Public_Subprogram_9dba15,
         "model-interface_def.ads:62:3:",
         Test_Get_Public_Subprogram_9dba15'Access);
      Runner_1.Create
        (Case_8_1_Test_Add_Public_Subprogram_b30524,
         "model-interface_def.ads:68:3:",
         Test_Add_Public_Subprogram_b30524'Access);
      Runner_1.Create
        (Case_1i_1_Test_Add_Comment_e58dfe,
         "model-element.ads:17:3: inherited at model-interface_def.ads:75:3:",
         Test_Add_Comment_e58dfe'Access);
      Runner_1.Create
        (Case_2i_1_Test_Number_Of_Comments_e75ee0,
         "model-element.ads:22:3: inherited at model-interface_def.ads:75:3:",
         Test_Number_Of_Comments_e75ee0'Access);
      Runner_1.Create
        (Case_3i_1_Test_Get_Comment_6d199b,
         "model-element.ads:27:3: inherited at model-interface_def.ads:75:3:",
         Test_Get_Comment_6d199b'Access);
      Runner_1.Create
        (Case_4i_1_Test_Set_Name_f456f1,
         "model-named_element.ads:19:3: inherited at model-interface_def.ads:75:3:",
         Test_Set_Name_f456f1'Access);
      Runner_1.Create
        (Case_5i_1_Test_Get_Name_ba8460,
         "model-named_element.ads:24:3: inherited at model-interface_def.ads:75:3:",
         Test_Get_Name_ba8460'Access);
      Runner_1.Create
        (Case_6i_1_Test_To_String_4f6cb9,
         "model-named_element.ads:29:3: inherited at model-interface_def.ads:75:3:",
         Test_To_String_4f6cb9'Access);

      Result.Add_Test (Case_1_1_Test_Has_Parent_Interfaces_fba38f'Access);
      Result.Add_Test (Case_2_1_Test_Number_Of_Parent_Interfaces_3df96d'Access);
      Result.Add_Test (Case_3_1_Test_Get_Parent_Interface_0be903'Access);
      Result.Add_Test (Case_4_1_Test_Add_Parent_Interface_08d577'Access);
      Result.Add_Test (Case_5_1_Test_Has_Public_Subprograms_1bd5a1'Access);
      Result.Add_Test (Case_6_1_Test_Number_Of_Public_Subprograms_f74f81'Access);
      Result.Add_Test (Case_7_1_Test_Get_Public_Subprogram_9dba15'Access);
      Result.Add_Test (Case_8_1_Test_Add_Public_Subprogram_b30524'Access);
      Result.Add_Test (Case_1i_1_Test_Add_Comment_e58dfe'Access);
      Result.Add_Test (Case_2i_1_Test_Number_Of_Comments_e75ee0'Access);
      Result.Add_Test (Case_3i_1_Test_Get_Comment_6d199b'Access);
      Result.Add_Test (Case_4i_1_Test_Set_Name_f456f1'Access);
      Result.Add_Test (Case_5i_1_Test_Get_Name_ba8460'Access);
      Result.Add_Test (Case_6i_1_Test_To_String_4f6cb9'Access);

      return Result'Access;

   end Suite;

end Model.Interface_Def.Object_T_Test_Data.Object_T_Tests.Suite;
--  end read only
