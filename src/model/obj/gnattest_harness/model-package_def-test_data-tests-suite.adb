--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Model.Package_Def.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Model.Package_Def.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Initialize_dd1b5a : aliased Runner_1.Test_Case;
   Case_2_1_Test_Create_36948c : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Initialize_dd1b5a,
         "model-package_def.ads:32:3:",
         Test_Initialize_dd1b5a'Access);
      Runner_1.Create
        (Case_2_1_Test_Create_36948c,
         "model-package_def.ads:38:3:",
         Test_Create_36948c'Access);

      Result.Add_Test (Case_1_1_Test_Initialize_dd1b5a'Access);
      Result.Add_Test (Case_2_1_Test_Create_36948c'Access);

      return Result'Access;

   end Suite;

end Model.Package_Def.Test_Data.Tests.Suite;
--  end read only
