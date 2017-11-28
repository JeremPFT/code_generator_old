--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Model.Element.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Model.Element.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Initialize_4e32e9 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Free_e2892d : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Initialize_4e32e9,
         "model-element.ads:23:3:",
         Test_Initialize_4e32e9'Access);
      Runner_1.Create
        (Case_2_1_Test_Free_e2892d,
         "model-element.ads:56:3:",
         Test_Free_e2892d'Access);

      Result.Add_Test (Case_1_1_Test_Initialize_4e32e9'Access);
      Result.Add_Test (Case_2_1_Test_Free_e2892d'Access);

      return Result'Access;

   end Suite;

end Model.Element.Test_Data.Tests.Suite;
--  end read only
