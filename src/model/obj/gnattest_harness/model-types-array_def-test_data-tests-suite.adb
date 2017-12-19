--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Model.Types.Array_Def.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Model.Types.Array_Def.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Initialize_6b7b0b : aliased Runner_1.Test_Case;
   Case_2_1_Test_Create_9e6cff : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Initialize_6b7b0b,
         "model-types-array_def.ads:24:3:",
         Test_Initialize_6b7b0b'Access);
      Runner_1.Create
        (Case_2_1_Test_Create_9e6cff,
         "model-types-array_def.ads:33:3:",
         Test_Create_9e6cff'Access);

      Result.Add_Test (Case_1_1_Test_Initialize_6b7b0b'Access);
      Result.Add_Test (Case_2_1_Test_Create_9e6cff'Access);

      return Result'Access;

   end Suite;

end Model.Types.Array_Def.Test_Data.Tests.Suite;
--  end read only
