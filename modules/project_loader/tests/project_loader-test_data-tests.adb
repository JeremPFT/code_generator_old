--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Project_Loader.Test_Data.

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
package body Project_Loader.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only

--  begin read only
   procedure Test_Root_Project (Gnattest_T : in out Test);
   procedure Test_Root_Project_e22c5f (Gnattest_T : in out Test) renames Test_Root_Project;
--  id:2.2/e22c5f9e4255ae28/Root_Project/1/0/
   procedure Test_Root_Project (Gnattest_T : in out Test) is
   --  project_loader.ads:18:3:Root_Project
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Root_Project;
--  end read only


--  begin read only
   procedure Test_Project (Gnattest_T : in out Test);
   procedure Test_Project_fc3287 (Gnattest_T : in out Test) renames Test_Project;
--  id:2.2/fc3287b889d579e8/Project/1/0/
   procedure Test_Project (Gnattest_T : in out Test) is
   --  project_loader.ads:27:3:Project
--  end read only
    pragma Unreferenced (Gnattest_T);
    use Tests_Impl;
  begin
    Init_Check_Project;

    Check_Project_Has_Valid_Path;
    Check_Project_Has_Valid_Name;
--  begin read only
   end Test_Project;
--  end read only


--  begin read only
   procedure Test_Class (Gnattest_T : in out Test);
   procedure Test_Class_6fc34a (Gnattest_T : in out Test) renames Test_Class;
--  id:2.2/6fc34a8d07757b20/Class/1/0/
   procedure Test_Class (Gnattest_T : in out Test) is
   --  project_loader.ads:31:3:Class
--  end read only
    pragma Unreferenced (Gnattest_T);
    use Tests_Impl;
  begin
    Init_Check_Class;

    Check_Class_Is_Added;
    Check_Class_Package_Is_Created;
    Check_Class_Has_Valid_Name;
--  begin read only
   end Test_Class;
--  end read only


--  begin read only
   procedure Test_Field (Gnattest_T : in out Test);
   procedure Test_Field_078360 (Gnattest_T : in out Test) renames Test_Field;
--  id:2.2/07836088b982fa28/Field/1/0/
   procedure Test_Field (Gnattest_T : in out Test) is
   --  project_loader.ads:51:3:Field
--  end read only
    pragma Unreferenced (Gnattest_T);
    use Tests_Impl;
  begin
    Init_Check_Field;

    Check_Field_Number;
    Check_Field_Add_2_Basic_Fields;
    Check_Field_With_Get;
    Check_Field_With_Set;
    Check_Field_With_Get_Set;
    Check_Field_Unkown_Option;
    Check_Field_Vector_Same_Class;
    Check_Field_Vector_Other_Class;
--  begin read only
   end Test_Field;
--  end read only


--  begin read only
   procedure Test_Fields (Gnattest_T : in out Test);
   procedure Test_Fields_186588 (Gnattest_T : in out Test) renames Test_Fields;
--  id:2.2/18658831ffe611fd/Fields/1/0/
   procedure Test_Fields (Gnattest_T : in out Test) is
   --  project_loader.ads:54:3:Fields
--  end read only

    pragma Unreferenced (Gnattest_T);

  begin

    AUnit.Assertions.Assert
      (Gnattest_Generated.Default_Assert_Value,
       "Test not implemented.");

--  begin read only
   end Test_Fields;
--  end read only


--  begin read only
   procedure Test_Operation (Gnattest_T : in out Test);
   procedure Test_Operation_c64c68 (Gnattest_T : in out Test) renames Test_Operation;
--  id:2.2/c64c6871f14057af/Operation/1/0/
   procedure Test_Operation (Gnattest_T : in out Test) is
   --  project_loader.ads:72:3:Operation
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Operation;
--  end read only


--  begin read only
   procedure Test_Operations (Gnattest_T : in out Test);
   procedure Test_Operations_e79d44 (Gnattest_T : in out Test) renames Test_Operations;
--  id:2.2/e79d444f2de8354d/Operations/1/0/
   procedure Test_Operations (Gnattest_T : in out Test) is
   --  project_loader.ads:75:3:Operations
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Operations;
--  end read only


--  begin read only
   procedure Test_Close (Gnattest_T : in out Test);
   procedure Test_Close_e0b8a0 (Gnattest_T : in out Test) renames Test_Close;
--  id:2.2/e0b8a0a7e3fcad97/Close/1/0/
   procedure Test_Close (Gnattest_T : in out Test) is
   --  project_loader.ads:78:3:Close
--  end read only

    pragma Unreferenced (Gnattest_T);

  begin

    AUnit.Assertions.Assert
      (Gnattest_Generated.Default_Assert_Value,
       "Test not implemented.");

--  begin read only
   end Test_Close;
--  end read only


--  begin read only
   procedure Test_Constante (Gnattest_T : in out Test);
   procedure Test_Constante_8b89d0 (Gnattest_T : in out Test) renames Test_Constante;
--  id:2.2/8b89d0c17510f364/Constante/1/0/
   procedure Test_Constante (Gnattest_T : in out Test) is
   --  project_loader.ads:80:3:Constante
--  end read only

    pragma Unreferenced (Gnattest_T);

  begin

    AUnit.Assertions.Assert
      (Gnattest_Generated.Default_Assert_Value,
       "Test not implemented.");

--  begin read only
   end Test_Constante;
--  end read only


--  begin read only
   procedure Test_Get_Root_Project (Gnattest_T : in out Test);
   procedure Test_Get_Root_Project_8f996e (Gnattest_T : in out Test) renames Test_Get_Root_Project;
--  id:2.2/8f996e185fda539a/Get_Root_Project/1/0/
   procedure Test_Get_Root_Project (Gnattest_T : in out Test) is
   --  project_loader.ads:82:3:Get_Root_Project
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Get_Root_Project;
--  end read only


--  begin read only
   --  procedure Test_Get_Data (Gnattest_T : in out Test);
   --  procedure Test_Get_Data_4439c4 (Gnattest_T : in out Test) renames Test_Get_Data;
--  id:2.2/4439c49f482e7eb1/Get_Data/1/1/
   --  procedure Test_Get_Data (Gnattest_T : in out Test) is
--  end read only
--  
--      pragma Unreferenced (Gnattest_T);
--  
--    begin
--  
--      AUnit.Assertions.Assert
--        (Gnattest_Generated.Default_Assert_Value,
--         "Test not implemented.");
--  
--  begin read only
   --  end Test_Get_Data;
--  end read only


--  begin read only
   --  procedure Test_Console_Project (Gnattest_T : in out Test);
   --  procedure Test_Console_Project_66170c (Gnattest_T : in out Test) renames Test_Console_Project;
--  id:2.2/66170c5b48cfc2bf/Console_Project/1/1/
   --  procedure Test_Console_Project (Gnattest_T : in out Test) is
--  end read only
  --
  --      pragma Unreferenced (Gnattest_T);
  --      use Tests_Impl;
  --
  --    begin
  --      Check_Project_Has_Valid_Name;
  --      Check_Project_Has_Valid_Path;
--  begin read only
   --  end Test_Console_Project;
--  end read only


--  begin read only
   --  procedure Test_Module (Gnattest_T : in out Test);
   --  procedure Test_Module_7826d3 (Gnattest_T : in out Test) renames Test_Module;
--  id:2.2/7826d3573c230fb0/Module/1/1/
   --  procedure Test_Module (Gnattest_T : in out Test) is
--  end read only
--  
--      pragma Unreferenced (Gnattest_T);
--      use Tests_Impl;
--  
--    begin
--      Init_Check_Module;
--  
--      Check_Module_Only_Its_Root_Package;
--      Check_Module_Has_Valid_Module_Number;
--      Check_Module_Has_Valid_Module_Name;
--      Check_Module_Error_If_Unknown_Module_Name;
--  begin read only
   --  end Test_Module;
--  end read only


--  begin read only
   --  procedure Test_Methods (Gnattest_T : in out Test);
   --  procedure Test_Methods_b20da5 (Gnattest_T : in out Test) renames Test_Methods;
--  id:2.2/b20da5f6714fc70e/Methods/1/1/
   --  procedure Test_Methods (Gnattest_T : in out Test) is
--  end read only
--  
--      pragma Unreferenced (Gnattest_T);
--  
--    begin
--  
--      AUnit.Assertions.Assert
--        (Gnattest_Generated.Default_Assert_Value,
--         "Test not implemented.");
--  
--  begin read only
   --  end Test_Methods;
--  end read only


--  begin read only
   --  procedure Test_Method (Gnattest_T : in out Test);
   --  procedure Test_Method_c59f42 (Gnattest_T : in out Test) renames Test_Method;
--  id:2.2/c59f42a955257ff1/Method/1/1/
   --  procedure Test_Method (Gnattest_T : in out Test) is
--  end read only
--  
--      pragma Unreferenced (Gnattest_T);
--  
--    begin
--  
--      AUnit.Assertions.Assert
--        (Gnattest_Generated.Default_Assert_Value,
--         "Test not implemented.");
--  
--  begin read only
   --  end Test_Method;
--  end read only


--  begin read only
   --  procedure Test_Close_And_Get_Data (Gnattest_T : in out Test);
   --  procedure Test_Close_And_Get_Data_d227b5 (Gnattest_T : in out Test) renames Test_Close_And_Get_Data;
--  id:2.2/d227b5c644211979/Close_And_Get_Data/1/1/
   --  procedure Test_Close_And_Get_Data (Gnattest_T : in out Test) is
--  end read only
  --
  --        pragma Unreferenced (Gnattest_T);
  --
  --     begin
  --
  --        AUnit.Assertions.Assert
  --          (Gnattest_Generated.Default_Assert_Value,
  --           "Test not implemented.");
  --
--  begin read only
   --  end Test_Close_And_Get_Data;
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
end Project_Loader.Test_Data.Tests;
