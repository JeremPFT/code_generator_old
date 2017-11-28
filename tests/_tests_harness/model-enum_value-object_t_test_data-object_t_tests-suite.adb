--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Model.Enum_Value.Object_T_Test_Data.Object_T_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Model.Enum_Value.Object_T_Test_Data.Object_T_Tests.Test_Object_T);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Get_Value_e533c5 : aliased Runner_1.Test_Case;
   Case_1i_1_Test_Add_Comment_e58dfe : aliased Runner_1.Test_Case;
   Case_2i_1_Test_Number_Of_Comments_e75ee0 : aliased Runner_1.Test_Case;
   Case_3i_1_Test_Get_Comment_6d199b : aliased Runner_1.Test_Case;
   Case_4i_1_Test_Clear_Memory_973cfd : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Get_Value_e533c5,
         "model-enum_value.ads:29:3:",
         Test_Get_Value_e533c5'Access);
      Runner_1.Create
        (Case_1i_1_Test_Add_Comment_e58dfe,
         "model-element.ads:28:3: inherited at model-enum_value.ads:36:3:",
         Test_Add_Comment_e58dfe'Access);
      Runner_1.Create
        (Case_2i_1_Test_Number_Of_Comments_e75ee0,
         "model-element.ads:35:3: inherited at model-enum_value.ads:36:3:",
         Test_Number_Of_Comments_e75ee0'Access);
      Runner_1.Create
        (Case_3i_1_Test_Get_Comment_6d199b,
         "model-element.ads:42:3: inherited at model-enum_value.ads:36:3:",
         Test_Get_Comment_6d199b'Access);
      Runner_1.Create
        (Case_4i_1_Test_Clear_Memory_973cfd,
         "model-element.ads:50:3: inherited at model-enum_value.ads:36:3:",
         Test_Clear_Memory_973cfd'Access);

      Result.Add_Test (Case_1_1_Test_Get_Value_e533c5'Access);
      Result.Add_Test (Case_1i_1_Test_Add_Comment_e58dfe'Access);
      Result.Add_Test (Case_2i_1_Test_Number_Of_Comments_e75ee0'Access);
      Result.Add_Test (Case_3i_1_Test_Get_Comment_6d199b'Access);
      Result.Add_Test (Case_4i_1_Test_Clear_Memory_973cfd'Access);

      return Result'Access;

   end Suite;

end Model.Enum_Value.Object_T_Test_Data.Object_T_Tests.Suite;
--  end read only
