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
   Case_2_1_Test_Create_9b51ba : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Unary_Plus_28cfd5,
         "model-parameter.ads:32:3:",
         Test_Unary_Plus_28cfd5'Access);
      Runner_1.Create
        (Case_2_1_Test_Create_9b51ba,
         "model-parameter.ads:48:3:",
         Test_Create_9b51ba'Access);

      Result.Add_Test (Case_1_1_Test_Unary_Plus_28cfd5'Access);
      Result.Add_Test (Case_2_1_Test_Create_9b51ba'Access);

      return Result'Access;

   end Suite;

end Model.Parameter.Test_Data.Tests.Suite;
--  end read only
