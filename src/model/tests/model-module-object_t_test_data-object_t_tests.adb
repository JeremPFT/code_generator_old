--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Model.Module.Object_T_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only

--  begin read only
--  end read only
package body Model.Module.Object_T_Test_Data.Object_T_Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only

--  begin read only
   procedure Test_Has_Parent (Gnattest_T : in out Test_Object_T);
   procedure Test_Has_Parent_1f06cb (Gnattest_T : in out Test_Object_T) renames Test_Has_Parent;
--  id:2.2/1f06cbc8e2e8a3ec/Has_Parent/1/0/
   procedure Test_Has_Parent (Gnattest_T : in out Test_Object_T) is
   --  model-module.ads:33:3:Has_Parent
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Has_Parent;
--  end read only


--  begin read only
   procedure Test_Get_Parent (Gnattest_T : in out Test_Object_T);
   procedure Test_Get_Parent_03697a (Gnattest_T : in out Test_Object_T) renames Test_Get_Parent;
--  id:2.2/03697a9e0be86952/Get_Parent/1/0/
   procedure Test_Get_Parent (Gnattest_T : in out Test_Object_T) is
   --  model-module.ads:38:3:Get_Parent
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Get_Parent;
--  end read only


--  begin read only
   procedure Test_Visit (Gnattest_T : in out Test_Object_T);
   procedure Test_Visit_aa2478 (Gnattest_T : in out Test_Object_T) renames Test_Visit;
--  id:2.2/aa247832a63b9c2c/Visit/1/0/
   procedure Test_Visit (Gnattest_T : in out Test_Object_T) is
   --  model-module.ads:43:3:Visit
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Visit;
--  end read only

--  begin read only
--  id:2.2/02/
--
--  This section can be used to add elaboration code for the global state.
--
begin
--  end read only
   null;
--  begin read only
--  end read only
end Model.Module.Object_T_Test_Data.Object_T_Tests;
