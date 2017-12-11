--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Model.Named_Element.Object_T_Test_Data.

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
package body Model.Named_Element.Object_T_Test_Data.Object_T_Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only

--  begin read only
   procedure Test_Get_Owner_Namespace (Gnattest_T : in out Test_Object_T);
   procedure Test_Get_Owner_Namespace_a43e22 (Gnattest_T : in out Test_Object_T) renames Test_Get_Owner_Namespace;
--  id:2.2/a43e2216319fccff/Get_Owner_Namespace/1/0/
   procedure Test_Get_Owner_Namespace (Gnattest_T : in out Test_Object_T) is
   --  model-named_element.ads:27:3:Get_Owner_Namespace
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Get_Owner_Namespace;
--  end read only


--  begin read only
   procedure Test_Get_Name (Gnattest_T : in out Test_Object_T);
   procedure Test_Get_Name_ba8460 (Gnattest_T : in out Test_Object_T) renames Test_Get_Name;
--  id:2.2/ba8460e48e3f938e/Get_Name/1/0/
   procedure Test_Get_Name (Gnattest_T : in out Test_Object_T) is
   --  model-named_element.ads:32:3:Get_Name
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Get_Name;
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
end Model.Named_Element.Object_T_Test_Data.Object_T_Tests;
