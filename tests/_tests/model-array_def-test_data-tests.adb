--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Model.Array_Def.Test_Data.

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
package body Model.Array_Def.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only

--  begin read only
   procedure Test_Create (Gnattest_T : in out Test);
   procedure Test_Create_de2643 (Gnattest_T : in out Test) renames Test_Create;
--  id:2.2/de2643426ee6419e/Create/1/0/
   procedure Test_Create (Gnattest_T : in out Test) is
   --  model-array_def.ads:24:3:Create
--  end read only

    Obj_Package : access Model.Package_Def.Object_T :=
      Model.Package_Def.Create (Name => "package_a");

    Obj_Array : access Model.Array_Def.Object_T :=
      Model.Array_Def.Create
        (Owner_Package  => Obj_Package,
         Name           => Fixtures.Array_1_Name,
         Contained_Type => Fixtures.Array_1_Contained_Type,
         Index_Type     => Fixtures.Array_1_Index_Type,
         Defined_Range  => Fixtures.Array_1_Range);

  begin

    Fixtures.Check (Test     => "array_def.create, name",
                    Expected => Fixtures.Array_1_Name,
                    Actual   => Obj_Array.Get_Name);

    Fixtures.Check (Test     => "array_def.create, contained type",
                    Expected => Fixtures.Array_1_Contained_Type,
                    Actual   => Obj_Array.Contained_Type.all);

    Fixtures.Check (Test     => "array_def.create, index type",
                    Expected => Fixtures.Array_1_Index_Type,
                    Actual   => Obj_Array.Index_Type.all);

    Fixtures.Check (Test     => "array_def.create, range",
                    Expected => Fixtures.Array_1_Range,
                    Actual   => Obj_Array.Defined_Range.all);

    --  AUnit.Assertions.Assert
    --    (Gnattest_Generated.Default_Assert_Value,
    --     "Test not implemented.");

--  begin read only
   end Test_Create;
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
end Model.Array_Def.Test_Data.Tests;
