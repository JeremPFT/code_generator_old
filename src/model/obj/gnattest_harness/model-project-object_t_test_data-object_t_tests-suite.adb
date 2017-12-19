--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Model.Project.Object_T_Test_Data.Object_T_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Model.Project.Object_T_Test_Data.Object_T_Tests.Test_Object_T);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Has_Parent_1f06cb : aliased Runner_1.Test_Case;
   Case_2_1_Test_Get_Parent_b2919c : aliased Runner_1.Test_Case;
   Case_3_1_Test_Get_Kind_f18206 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Get_Elements_3e1c24 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Number_Of_Elements_cc0933 : aliased Runner_1.Test_Case;
   Case_6_1_Test_Get_Element_8b0402 : aliased Runner_1.Test_Case;
   Case_7_1_Test_Add_Package_b75bf4 : aliased Runner_1.Test_Case;
   Case_8_1_Test_Add_Class_84b527 : aliased Runner_1.Test_Case;
   Case_9_1_Test_Add_Operation_a168ce : aliased Runner_1.Test_Case;
   Case_10_1_Test_Visit_aa2478 : aliased Runner_1.Test_Case;
   Case_11_1_Test_Add_Element_0dfb6e : aliased Runner_1.Test_Case;
   Case_1i_1_Test_Add_Comment_e58dfe : aliased Runner_1.Test_Case;
   Case_2i_1_Test_Number_Of_Comments_e75ee0 : aliased Runner_1.Test_Case;
   Case_3i_1_Test_Get_Comment_6d199b : aliased Runner_1.Test_Case;
   Case_4i_1_Test_Is_Equivalent_eced7f : aliased Runner_1.Test_Case;
   Case_5i_1_Test_Get_Owner_Namespace_a43e22 : aliased Runner_1.Test_Case;
   Case_6i_1_Test_Get_Name_ba8460 : aliased Runner_1.Test_Case;
   Case_7i_1_Test_Get_Visibility_a97d3a : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Has_Parent_1f06cb,
         "model-project.ads:37:3:",
         Test_Has_Parent_1f06cb'Access);
      Runner_1.Create
        (Case_2_1_Test_Get_Parent_b2919c,
         "model-project.ads:42:3:",
         Test_Get_Parent_b2919c'Access);
      Runner_1.Create
        (Case_3_1_Test_Get_Kind_f18206,
         "model-project.ads:47:3:",
         Test_Get_Kind_f18206'Access);
      Runner_1.Create
        (Case_4_1_Test_Get_Elements_3e1c24,
         "model-project.ads:52:3:",
         Test_Get_Elements_3e1c24'Access);
      Runner_1.Create
        (Case_5_1_Test_Number_Of_Elements_cc0933,
         "model-project.ads:57:3:",
         Test_Number_Of_Elements_cc0933'Access);
      Runner_1.Create
        (Case_6_1_Test_Get_Element_8b0402,
         "model-project.ads:62:3:",
         Test_Get_Element_8b0402'Access);
      Runner_1.Create
        (Case_7_1_Test_Add_Package_b75bf4,
         "model-project.ads:68:3:",
         Test_Add_Package_b75bf4'Access);
      Runner_1.Create
        (Case_8_1_Test_Add_Class_84b527,
         "model-project.ads:73:3:",
         Test_Add_Class_84b527'Access);
      Runner_1.Create
        (Case_9_1_Test_Add_Operation_a168ce,
         "model-project.ads:78:3:",
         Test_Add_Operation_a168ce'Access);
      Runner_1.Create
        (Case_10_1_Test_Visit_aa2478,
         "model-project.ads:83:3:",
         Test_Visit_aa2478'Access);
      Runner_1.Create
        (Case_11_1_Test_Add_Element_0dfb6e,
         "model-project.ads:97:3:",
         Test_Add_Element_0dfb6e'Access);
      Runner_1.Create
        (Case_1i_1_Test_Add_Comment_e58dfe,
         "model-element.ads:29:3: inherited at model-project.ads:90:3:",
         Test_Add_Comment_e58dfe'Access);
      Runner_1.Create
        (Case_2i_1_Test_Number_Of_Comments_e75ee0,
         "model-element.ads:36:3: inherited at model-project.ads:90:3:",
         Test_Number_Of_Comments_e75ee0'Access);
      Runner_1.Create
        (Case_3i_1_Test_Get_Comment_6d199b,
         "model-element.ads:43:3: inherited at model-project.ads:90:3:",
         Test_Get_Comment_6d199b'Access);
      Runner_1.Create
        (Case_4i_1_Test_Is_Equivalent_eced7f,
         "model-element.ads:51:3: inherited at model-project.ads:90:3:",
         Test_Is_Equivalent_eced7f'Access);
      Runner_1.Create
        (Case_5i_1_Test_Get_Owner_Namespace_a43e22,
         "model-named_element.ads:40:3: inherited at model-project.ads:90:3:",
         Test_Get_Owner_Namespace_a43e22'Access);
      Runner_1.Create
        (Case_6i_1_Test_Get_Name_ba8460,
         "model-named_element.ads:45:3: inherited at model-project.ads:90:3:",
         Test_Get_Name_ba8460'Access);
      Runner_1.Create
        (Case_7i_1_Test_Get_Visibility_a97d3a,
         "model-named_element.ads:50:3: inherited at model-project.ads:90:3:",
         Test_Get_Visibility_a97d3a'Access);

      Result.Add_Test (Case_1_1_Test_Has_Parent_1f06cb'Access);
      Result.Add_Test (Case_2_1_Test_Get_Parent_b2919c'Access);
      Result.Add_Test (Case_3_1_Test_Get_Kind_f18206'Access);
      Result.Add_Test (Case_4_1_Test_Get_Elements_3e1c24'Access);
      Result.Add_Test (Case_5_1_Test_Number_Of_Elements_cc0933'Access);
      Result.Add_Test (Case_6_1_Test_Get_Element_8b0402'Access);
      Result.Add_Test (Case_7_1_Test_Add_Package_b75bf4'Access);
      Result.Add_Test (Case_8_1_Test_Add_Class_84b527'Access);
      Result.Add_Test (Case_9_1_Test_Add_Operation_a168ce'Access);
      Result.Add_Test (Case_10_1_Test_Visit_aa2478'Access);
      Result.Add_Test (Case_11_1_Test_Add_Element_0dfb6e'Access);
      Result.Add_Test (Case_1i_1_Test_Add_Comment_e58dfe'Access);
      Result.Add_Test (Case_2i_1_Test_Number_Of_Comments_e75ee0'Access);
      Result.Add_Test (Case_3i_1_Test_Get_Comment_6d199b'Access);
      Result.Add_Test (Case_4i_1_Test_Is_Equivalent_eced7f'Access);
      Result.Add_Test (Case_5i_1_Test_Get_Owner_Namespace_a43e22'Access);
      Result.Add_Test (Case_6i_1_Test_Get_Name_ba8460'Access);
      Result.Add_Test (Case_7i_1_Test_Get_Visibility_a97d3a'Access);

      return Result'Access;

   end Suite;

end Model.Project.Object_T_Test_Data.Object_T_Tests.Suite;
--  end read only
