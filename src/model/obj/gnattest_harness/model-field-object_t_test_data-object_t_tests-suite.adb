--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Model.Field.Object_T_Test_Data.Object_T_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Model.Field.Object_T_Test_Data.Object_T_Tests.Test_Object_T);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Get_Owner_Class_415f19 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Get_Type_d441e6 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Has_Default_Value_40e05f : aliased Runner_1.Test_Case;
   Case_4_1_Test_Get_Default_Value_3dfcf7 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Visit_aa2478 : aliased Runner_1.Test_Case;
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
        (Case_1_1_Test_Get_Owner_Class_415f19,
         "model-field.ads:41:3:",
         Test_Get_Owner_Class_415f19'Access);
      Runner_1.Create
        (Case_2_1_Test_Get_Type_d441e6,
         "model-field.ads:46:3:",
         Test_Get_Type_d441e6'Access);
      Runner_1.Create
        (Case_3_1_Test_Has_Default_Value_40e05f,
         "model-field.ads:51:3:",
         Test_Has_Default_Value_40e05f'Access);
      Runner_1.Create
        (Case_4_1_Test_Get_Default_Value_3dfcf7,
         "model-field.ads:56:3:",
         Test_Get_Default_Value_3dfcf7'Access);
      Runner_1.Create
        (Case_5_1_Test_Visit_aa2478,
         "model-field.ads:61:3:",
         Test_Visit_aa2478'Access);
      Runner_1.Create
        (Case_1i_1_Test_Add_Comment_e58dfe,
         "model-element.ads:29:3: inherited at model-field.ads:68:3:",
         Test_Add_Comment_e58dfe'Access);
      Runner_1.Create
        (Case_2i_1_Test_Number_Of_Comments_e75ee0,
         "model-element.ads:36:3: inherited at model-field.ads:68:3:",
         Test_Number_Of_Comments_e75ee0'Access);
      Runner_1.Create
        (Case_3i_1_Test_Get_Comment_6d199b,
         "model-element.ads:43:3: inherited at model-field.ads:68:3:",
         Test_Get_Comment_6d199b'Access);
      Runner_1.Create
        (Case_4i_1_Test_Is_Equivalent_eced7f,
         "model-element.ads:51:3: inherited at model-field.ads:68:3:",
         Test_Is_Equivalent_eced7f'Access);
      Runner_1.Create
        (Case_5i_1_Test_Get_Owner_Namespace_a43e22,
         "model-named_element.ads:40:3: inherited at model-field.ads:68:3:",
         Test_Get_Owner_Namespace_a43e22'Access);
      Runner_1.Create
        (Case_6i_1_Test_Get_Name_ba8460,
         "model-named_element.ads:45:3: inherited at model-field.ads:68:3:",
         Test_Get_Name_ba8460'Access);
      Runner_1.Create
        (Case_7i_1_Test_Get_Visibility_a97d3a,
         "model-named_element.ads:50:3: inherited at model-field.ads:68:3:",
         Test_Get_Visibility_a97d3a'Access);

      Result.Add_Test (Case_1_1_Test_Get_Owner_Class_415f19'Access);
      Result.Add_Test (Case_2_1_Test_Get_Type_d441e6'Access);
      Result.Add_Test (Case_3_1_Test_Has_Default_Value_40e05f'Access);
      Result.Add_Test (Case_4_1_Test_Get_Default_Value_3dfcf7'Access);
      Result.Add_Test (Case_5_1_Test_Visit_aa2478'Access);
      Result.Add_Test (Case_1i_1_Test_Add_Comment_e58dfe'Access);
      Result.Add_Test (Case_2i_1_Test_Number_Of_Comments_e75ee0'Access);
      Result.Add_Test (Case_3i_1_Test_Get_Comment_6d199b'Access);
      Result.Add_Test (Case_4i_1_Test_Is_Equivalent_eced7f'Access);
      Result.Add_Test (Case_5i_1_Test_Get_Owner_Namespace_a43e22'Access);
      Result.Add_Test (Case_6i_1_Test_Get_Name_ba8460'Access);
      Result.Add_Test (Case_7i_1_Test_Get_Visibility_a97d3a'Access);

      return Result'Access;

   end Suite;

end Model.Field.Object_T_Test_Data.Object_T_Tests.Suite;
--  end read only
