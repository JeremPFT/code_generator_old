--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Model.Package_Def.Object_T_Test_Data.

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
package body Model.Package_Def.Object_T_Test_Data.Object_T_Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only

--  begin read only
   procedure Test_Set_Qualified_Name (Gnattest_T : in out Test_Object_T);
   procedure Test_Set_Qualified_Name_f9fdf5 (Gnattest_T : in out Test_Object_T) renames Test_Set_Qualified_Name;
--  id:2.2/f9fdf5e5b1711106/Set_Qualified_Name/1/0/
   procedure Test_Set_Qualified_Name (Gnattest_T : in out Test_Object_T) is
   --  model-package_def.ads:28:3:Set_Qualified_Name
--  end read only

    pragma Unreferenced (Gnattest_T);

  begin

    AUnit.Assertions.Assert
      (Gnattest_Generated.Default_Assert_Value,
       "Test not implemented.");

--  begin read only
   end Test_Set_Qualified_Name;
--  end read only


--  begin read only
   procedure Test_Get_Qualified_Name (Gnattest_T : in out Test_Object_T);
   procedure Test_Get_Qualified_Name_00f306 (Gnattest_T : in out Test_Object_T) renames Test_Get_Qualified_Name;
--  id:2.2/00f3067af77d0551/Get_Qualified_Name/1/0/
   procedure Test_Get_Qualified_Name (Gnattest_T : in out Test_Object_T) is
   --  model-package_def.ads:33:3:Get_Qualified_Name
--  end read only

    --  pragma Unreferenced (Gnattest_T);

    Obj_Package : access Package_Def.Object_T := Package_Def.Reference_T (Gnattest_T.Fixture);

  begin

    AUnit.Assertions.Assert
      (Obj_Package.Get_Qualified_Name = "a_qualified_name",
       "bad Get_Qualified_Name");

    --  AUnit.Assertions.Assert
    --    (Gnattest_Generated.Default_Assert_Value,
    --     "Test not implemented.");

--  begin read only
   end Test_Get_Qualified_Name;
--  end read only


--  begin read only
   procedure Test_Add_Public_Subprogram (Gnattest_T : in out Test_Object_T);
   procedure Test_Add_Public_Subprogram_02557a (Gnattest_T : in out Test_Object_T) renames Test_Add_Public_Subprogram;
--  id:2.2/02557a2b462e778e/Add_Public_Subprogram/1/0/
   procedure Test_Add_Public_Subprogram (Gnattest_T : in out Test_Object_T) is
   --  model-package_def.ads:38:3:Add_Public_Subprogram
--  end read only

    pragma Unreferenced (Gnattest_T);

  begin

    AUnit.Assertions.Assert
      (Gnattest_Generated.Default_Assert_Value,
       "Test not implemented.");

--  begin read only
   end Test_Add_Public_Subprogram;
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
end Model.Package_Def.Object_T_Test_Data.Object_T_Tests;
