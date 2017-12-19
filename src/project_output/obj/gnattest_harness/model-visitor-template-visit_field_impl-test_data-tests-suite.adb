--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Model.Visitor.Template.Visit_Field_Impl.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Model.Visitor.Template.Visit_Field_Impl.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Init_7fac7f : aliased Runner_1.Test_Case;
   Case_2_1_Test_Set_Field_Name_67a77a : aliased Runner_1.Test_Case;
   Case_3_1_Test_Set_Field_Type_ec91c5 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Set_Field_Default_b88711 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Set_Field_Image_45051b : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Init_7fac7f,
         "model-visitor-template-visit_field_impl.ads:7:3:",
         Test_Init_7fac7f'Access);
      Runner_1.Create
        (Case_2_1_Test_Set_Field_Name_67a77a,
         "model-visitor-template-visit_field_impl.ads:10:3:",
         Test_Set_Field_Name_67a77a'Access);
      Runner_1.Create
        (Case_3_1_Test_Set_Field_Type_ec91c5,
         "model-visitor-template-visit_field_impl.ads:12:3:",
         Test_Set_Field_Type_ec91c5'Access);
      Runner_1.Create
        (Case_4_1_Test_Set_Field_Default_b88711,
         "model-visitor-template-visit_field_impl.ads:14:3:",
         Test_Set_Field_Default_b88711'Access);
      Runner_1.Create
        (Case_5_1_Test_Set_Field_Image_45051b,
         "model-visitor-template-visit_field_impl.ads:16:3:",
         Test_Set_Field_Image_45051b'Access);

      Result.Add_Test (Case_1_1_Test_Init_7fac7f'Access);
      Result.Add_Test (Case_2_1_Test_Set_Field_Name_67a77a'Access);
      Result.Add_Test (Case_3_1_Test_Set_Field_Type_ec91c5'Access);
      Result.Add_Test (Case_4_1_Test_Set_Field_Default_b88711'Access);
      Result.Add_Test (Case_5_1_Test_Set_Field_Image_45051b'Access);

      return Result'Access;

   end Suite;

end Model.Visitor.Template.Visit_Field_Impl.Test_Data.Tests.Suite;
--  end read only
