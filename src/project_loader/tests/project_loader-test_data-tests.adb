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
  procedure Test_Console_Project (Gnattest_T : in out Test);
  procedure Test_Console_Project_66170c (Gnattest_T : in out Test) renames Test_Console_Project;
  --  id:2.2/66170c5b48cfc2bf/Console_Project/1/0/
  procedure Test_Console_Project (Gnattest_T : in out Test) is
    --  project_loader.ads:17:3:Console_Project
    --  end read only

    pragma Unreferenced (Gnattest_T);
    use Tests_Impl;

  begin
    Check_Project_Has_Valid_Name;
    Check_Project_Has_Valid_Path;
    --  begin read only
  end Test_Console_Project;
  --  end read only


  --  begin read only
  procedure Test_Module (Gnattest_T : in out Test);
  procedure Test_Module_7826d3 (Gnattest_T : in out Test) renames Test_Module;
  --  id:2.2/7826d3573c230fb0/Module/1/0/
  procedure Test_Module (Gnattest_T : in out Test) is
    --  project_loader.ads:26:3:Module
    --  end read only

    pragma Unreferenced (Gnattest_T);
    use Tests_Impl;

  begin
    Check_Module_Has_Valid_Module_Number;
    Check_Module_Has_Valid_Module_Name;
    Check_Module_Error_If_Unknown_Module_Name;
    --  begin read only
  end Test_Module;
  --  end read only


  --  begin read only
  procedure Test_Class (Gnattest_T : in out Test);
  procedure Test_Class_6fc34a (Gnattest_T : in out Test) renames Test_Class;
  --  id:2.2/6fc34a8d07757b20/Class/1/0/
  procedure Test_Class (Gnattest_T : in out Test) is
    --  project_loader.ads:30:3:Class
    --  end read only

    pragma Unreferenced (Gnattest_T);
    use Tests_Impl;

  begin

    AUnit.Assertions.Assert
      (Gnattest_Generated.Default_Assert_Value,
       "Test not implemented.");

    --  begin read only
  end Test_Class;
  --  end read only


  --  begin read only
  procedure Test_Field (Gnattest_T : in out Test);
  procedure Test_Field_078360 (Gnattest_T : in out Test) renames Test_Field;
  --  id:2.2/07836088b982fa28/Field/1/0/
  procedure Test_Field (Gnattest_T : in out Test) is
    --  project_loader.ads:50:3:Field
    --  end read only

    pragma Unreferenced (Gnattest_T);

  begin

    AUnit.Assertions.Assert
      (Gnattest_Generated.Default_Assert_Value,
       "Test not implemented.");

    --  begin read only
  end Test_Field;
  --  end read only


  --  begin read only
  procedure Test_Fields (Gnattest_T : in out Test);
  procedure Test_Fields_186588 (Gnattest_T : in out Test) renames Test_Fields;
  --  id:2.2/18658831ffe611fd/Fields/1/0/
  procedure Test_Fields (Gnattest_T : in out Test) is
    --  project_loader.ads:53:3:Fields
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
  procedure Test_Method (Gnattest_T : in out Test);
  procedure Test_Method_C59f42 (Gnattest_T : in out Test) renames Test_Method;
  --  id:2.2/c59f42a955257ff1/Method/1/0/
  procedure Test_Method (Gnattest_T : in out Test) is
    --  project_loader.ads:71:3:Method
    --  end read only

    pragma Unreferenced (Gnattest_T);

  begin

    AUnit.Assertions.Assert
      (Gnattest_Generated.Default_Assert_Value,
       "Test not implemented.");

    --  begin read only
  end Test_Method;
  --  end read only


  --  begin read only
  procedure Test_Methods (Gnattest_T : in out Test);
  procedure Test_Methods_B20da5 (Gnattest_T : in out Test) renames Test_Methods;
  --  id:2.2/b20da5f6714fc70e/Methods/1/0/
  procedure Test_Methods (Gnattest_T : in out Test) is
    --  project_loader.ads:74:3:Methods
    --  end read only

    pragma Unreferenced (Gnattest_T);

  begin

    AUnit.Assertions.Assert
      (Gnattest_Generated.Default_Assert_Value,
       "Test not implemented.");

    --  begin read only
  end Test_Methods;
  --  end read only


  --  begin read only
  procedure Test_Close (Gnattest_T : in out Test);
  procedure Test_Close_E0b8a0 (Gnattest_T : in out Test) renames Test_Close;
  --  id:2.2/e0b8a0a7e3fcad97/Close/1/0/
  procedure Test_Close (Gnattest_T : in out Test) is
    --  project_loader.ads:77:3:Close
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
  procedure Test_Get_Data (Gnattest_T : in out Test);
  procedure Test_Get_Data_4439c4 (Gnattest_T : in out Test) renames Test_Get_Data;
  --  id:2.2/4439c49f482e7eb1/Get_Data/1/0/
  procedure Test_Get_Data (Gnattest_T : in out Test) is
    --  project_loader.ads:79:3:Get_Data
    --  end read only

    pragma Unreferenced (Gnattest_T);

  begin

    AUnit.Assertions.Assert
      (Gnattest_Generated.Default_Assert_Value,
       "Test not implemented.");

    --  begin read only
  end Test_Get_Data;
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
