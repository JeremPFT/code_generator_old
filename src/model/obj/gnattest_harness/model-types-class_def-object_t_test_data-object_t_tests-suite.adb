--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Model.Types.Class_Def.Object_T_Test_Data.Object_T_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Model.Types.Class_Def.Object_T_Test_Data.Object_T_Tests.Test_Object_T);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Get_Defined_Namespace_dcf78a : aliased Runner_1.Test_Case;
   Case_2_1_Test_Is_Abstract_003c0d : aliased Runner_1.Test_Case;
   Case_3_1_Test_Get_Owner_Package_3506d5 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Has_Fields_ae0ef5 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Number_Of_Fields_c3235a : aliased Runner_1.Test_Case;
   Case_6_1_Test_Get_Field_1a0c5d : aliased Runner_1.Test_Case;
   Case_7_1_Test_Visit_aa2478 : aliased Runner_1.Test_Case;
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
        (Case_1_1_Test_Get_Defined_Namespace_dcf78a,
         "model-types-class_def.ads:68:3:",
         Test_Get_Defined_Namespace_dcf78a'Access);
      Runner_1.Create
        (Case_2_1_Test_Is_Abstract_003c0d,
         "model-types-class_def.ads:73:3:",
         Test_Is_Abstract_003c0d'Access);
      Runner_1.Create
        (Case_3_1_Test_Get_Owner_Package_3506d5,
         "model-types-class_def.ads:78:3:",
         Test_Get_Owner_Package_3506d5'Access);
      Runner_1.Create
        (Case_4_1_Test_Has_Fields_ae0ef5,
         "model-types-class_def.ads:87:3:",
         Test_Has_Fields_ae0ef5'Access);
      Runner_1.Create
        (Case_5_1_Test_Number_Of_Fields_c3235a,
         "model-types-class_def.ads:92:3:",
         Test_Number_Of_Fields_c3235a'Access);
      Runner_1.Create
        (Case_6_1_Test_Get_Field_1a0c5d,
         "model-types-class_def.ads:97:3:",
         Test_Get_Field_1a0c5d'Access);
      Runner_1.Create
        (Case_7_1_Test_Visit_aa2478,
         "model-types-class_def.ads:107:3:",
         Test_Visit_aa2478'Access);
      Runner_1.Create
        (Case_1i_1_Test_Add_Comment_e58dfe,
         "model-element.ads:29:3: inherited at model-types-class_def.ads:114:3:",
         Test_Add_Comment_e58dfe'Access);
      Runner_1.Create
        (Case_2i_1_Test_Number_Of_Comments_e75ee0,
         "model-element.ads:36:3: inherited at model-types-class_def.ads:114:3:",
         Test_Number_Of_Comments_e75ee0'Access);
      Runner_1.Create
        (Case_3i_1_Test_Get_Comment_6d199b,
         "model-element.ads:43:3: inherited at model-types-class_def.ads:114:3:",
         Test_Get_Comment_6d199b'Access);
      Runner_1.Create
        (Case_4i_1_Test_Is_Equivalent_eced7f,
         "model-element.ads:51:3: inherited at model-types-class_def.ads:114:3:",
         Test_Is_Equivalent_eced7f'Access);
      Runner_1.Create
        (Case_5i_1_Test_Get_Owner_Namespace_a43e22,
         "model-named_element.ads:40:3: inherited at model-types-class_def.ads:114:3:",
         Test_Get_Owner_Namespace_a43e22'Access);
      Runner_1.Create
        (Case_6i_1_Test_Get_Name_ba8460,
         "model-named_element.ads:45:3: inherited at model-types-class_def.ads:114:3:",
         Test_Get_Name_ba8460'Access);
      Runner_1.Create
        (Case_7i_1_Test_Get_Visibility_a97d3a,
         "model-named_element.ads:50:3: inherited at model-types-class_def.ads:114:3:",
         Test_Get_Visibility_a97d3a'Access);

      Result.Add_Test (Case_1_1_Test_Get_Defined_Namespace_dcf78a'Access);
      Result.Add_Test (Case_2_1_Test_Is_Abstract_003c0d'Access);
      Result.Add_Test (Case_3_1_Test_Get_Owner_Package_3506d5'Access);
      Result.Add_Test (Case_4_1_Test_Has_Fields_ae0ef5'Access);
      Result.Add_Test (Case_5_1_Test_Number_Of_Fields_c3235a'Access);
      Result.Add_Test (Case_6_1_Test_Get_Field_1a0c5d'Access);
      Result.Add_Test (Case_7_1_Test_Visit_aa2478'Access);
      Result.Add_Test (Case_1i_1_Test_Add_Comment_e58dfe'Access);
      Result.Add_Test (Case_2i_1_Test_Number_Of_Comments_e75ee0'Access);
      Result.Add_Test (Case_3i_1_Test_Get_Comment_6d199b'Access);
      Result.Add_Test (Case_4i_1_Test_Is_Equivalent_eced7f'Access);
      Result.Add_Test (Case_5i_1_Test_Get_Owner_Namespace_a43e22'Access);
      Result.Add_Test (Case_6i_1_Test_Get_Name_ba8460'Access);
      Result.Add_Test (Case_7i_1_Test_Get_Visibility_a97d3a'Access);

      return Result'Access;

   end Suite;

end Model.Types.Class_Def.Object_T_Test_Data.Object_T_Tests.Suite;
--  end read only
