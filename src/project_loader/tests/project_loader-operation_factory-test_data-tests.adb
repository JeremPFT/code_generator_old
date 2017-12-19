--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Project_Loader.Operation_Factory.Test_Data.

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
package body Project_Loader.Operation_Factory.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only

--  begin read only
   procedure Test_Self_In (Gnattest_T : in out Test);
   procedure Test_Self_In_dbd1f8 (Gnattest_T : in out Test) renames Test_Self_In;
--  id:2.2/dbd1f86518ed2faf/Self_In/1/0/
   procedure Test_Self_In (Gnattest_T : in out Test) is
   --  project_loader-operation_factory.ads:7:3:Self_In
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Self_In;
--  end read only


--  begin read only
   procedure Test_Self_In_Out (Gnattest_T : in out Test);
   procedure Test_Self_In_Out_60e8eb (Gnattest_T : in out Test) renames Test_Self_In_Out;
--  id:2.2/60e8eb27926bf353/Self_In_Out/1/0/
   procedure Test_Self_In_Out (Gnattest_T : in out Test) is
   --  project_loader-operation_factory.ads:10:3:Self_In_Out
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Self_In_Out;
--  end read only


--  begin read only
   procedure Test_Create_Operation_And_Add_To_Namespace (Gnattest_T : in out Test);
   procedure Test_Create_Operation_And_Add_To_Namespace_6c1486 (Gnattest_T : in out Test) renames Test_Create_Operation_And_Add_To_Namespace;
--  id:2.2/6c14864785f282fc/Create_Operation_And_Add_To_Namespace/1/0/
   procedure Test_Create_Operation_And_Add_To_Namespace (Gnattest_T : in out Test) is
   --  project_loader-operation_factory.ads:13:3:Create_Operation_And_Add_To_Namespace
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Create_Operation_And_Add_To_Namespace;
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
end Project_Loader.Operation_Factory.Test_Data.Tests;
