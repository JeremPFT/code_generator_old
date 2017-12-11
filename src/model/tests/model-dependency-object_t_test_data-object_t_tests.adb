--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Model.Dependency.Object_T_Test_Data.

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
package body Model.Dependency.Object_T_Test_Data.Object_T_Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only

--  begin read only
   procedure Test_Get_Client (Gnattest_T : in out Test_Object_T);
   procedure Test_Get_Client_3d0fbe (Gnattest_T : in out Test_Object_T) renames Test_Get_Client;
--  id:2.2/3d0fbe7601688b6b/Get_Client/1/0/
   procedure Test_Get_Client (Gnattest_T : in out Test_Object_T) is
   --  model-dependency.ads:43:3:Get_Client
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Get_Client;
--  end read only


--  begin read only
   procedure Test_Get_Provider (Gnattest_T : in out Test_Object_T);
   procedure Test_Get_Provider_a5b9e7 (Gnattest_T : in out Test_Object_T) renames Test_Get_Provider;
--  id:2.2/a5b9e72dfcd3d9c2/Get_Provider/1/0/
   procedure Test_Get_Provider (Gnattest_T : in out Test_Object_T) is
   --  model-dependency.ads:47:3:Get_Provider
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Get_Provider;
--  end read only


--  begin read only
   procedure Test_Visit (Gnattest_T : in out Test_Object_T);
   procedure Test_Visit_aa2478 (Gnattest_T : in out Test_Object_T) renames Test_Visit;
--  id:2.2/aa247832a63b9c2c/Visit/1/0/
   procedure Test_Visit (Gnattest_T : in out Test_Object_T) is
   --  model-dependency.ads:55:3:Visit
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
end Model.Dependency.Object_T_Test_Data.Object_T_Tests;
