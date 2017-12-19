--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Model.Parameter.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Model.Parameter.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Unary_Plus_28cfd5 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Initialize_942818 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Create_8531e9 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Unary_Plus_28cfd5,
         "model-parameter.ads:35:3:",
         Test_Unary_Plus_28cfd5'Access);
      Runner_1.Create
        (Case_2_1_Test_Initialize_942818,
         "model-parameter.ads:51:3:",
         Test_Initialize_942818'Access);
      Runner_1.Create
        (Case_3_1_Test_Create_8531e9,
         "model-parameter.ads:59:3:",
         Test_Create_8531e9'Access);

      Result.Add_Test (Case_1_1_Test_Unary_Plus_28cfd5'Access);
      Result.Add_Test (Case_2_1_Test_Initialize_942818'Access);
      Result.Add_Test (Case_3_1_Test_Create_8531e9'Access);

      return Result'Access;

   end Suite;

end Model.Parameter.Test_Data.Tests.Suite;
--  end read only
