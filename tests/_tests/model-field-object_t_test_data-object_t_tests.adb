--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Model.Field.Object_T_Test_Data.

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
package body Model.Field.Object_T_Test_Data.Object_T_Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only

--  begin read only
   procedure Test_Get_Type (Gnattest_T : in out Test_Object_T);
   procedure Test_Get_Type_d441e6 (Gnattest_T : in out Test_Object_T) renames Test_Get_Type;
--  id:2.2/d441e683cbefca2e/Get_Type/1/0/
   procedure Test_Get_Type (Gnattest_T : in out Test_Object_T) is
   --  model-field.ads:39:3:Get_Type
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Get_Type;
--  end read only


--  begin read only
   procedure Test_Get_Default_Value (Gnattest_T : in out Test_Object_T);
   procedure Test_Get_Default_Value_3dfcf7 (Gnattest_T : in out Test_Object_T) renames Test_Get_Default_Value;
--  id:2.2/3dfcf7b4dc6d3f03/Get_Default_Value/1/0/
   procedure Test_Get_Default_Value (Gnattest_T : in out Test_Object_T) is
   --  model-field.ads:49:3:Get_Default_Value
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Get_Default_Value;
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
end Model.Field.Object_T_Test_Data.Object_T_Tests;
