--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Model.Array_Def.Object_T_Test_Data.

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
package body Model.Array_Def.Object_T_Test_Data.Object_T_Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only

--  begin read only
   procedure Test_Get_Contained_Type (Gnattest_T : in out Test_Object_T);
   procedure Test_Get_Contained_Type_7393dd (Gnattest_T : in out Test_Object_T) renames Test_Get_Contained_Type;
--  id:2.2/7393dd456fb38acf/Get_Contained_Type/1/0/
   procedure Test_Get_Contained_Type (Gnattest_T : in out Test_Object_T) is
   --  model-array_def.ads:32:3:Get_Contained_Type
--  end read only

    Obj_Array : access Model.Array_Def.Object_T :=
      Model.Array_Def.Reference_T (Gnattest_T.Fixture);

  begin

    AUnit.Assertions.Assert
      (Fixtures.Array_1_Contained_Type = Obj_Array.Contained_Type.all,
       "error on contained_type");

--  begin read only
   end Test_Get_Contained_Type;
--  end read only


--  begin read only
   procedure Test_Get_Index_Type (Gnattest_T : in out Test_Object_T);
   procedure Test_Get_Index_Type_f6bc16 (Gnattest_T : in out Test_Object_T) renames Test_Get_Index_Type;
--  id:2.2/f6bc1657dfb458ea/Get_Index_Type/1/0/
   procedure Test_Get_Index_Type (Gnattest_T : in out Test_Object_T) is
   --  model-array_def.ads:37:3:Get_Index_Type
--  end read only

    Obj_Array : access Model.Array_Def.Object_T :=
      Model.Array_Def.Reference_T (Gnattest_T.Fixture);

  begin

    AUnit.Assertions.Assert
      (Fixtures.Array_1_Index_Type = Obj_Array.Index_Type.all,
       "error on index_type");

--  begin read only
   end Test_Get_Index_Type;
--  end read only


--  begin read only
   procedure Test_Get_Defined_Range (Gnattest_T : in out Test_Object_T);
   procedure Test_Get_Defined_Range_3e0bf7 (Gnattest_T : in out Test_Object_T) renames Test_Get_Defined_Range;
--  id:2.2/3e0bf790c7f56ca3/Get_Defined_Range/1/0/
   procedure Test_Get_Defined_Range (Gnattest_T : in out Test_Object_T) is
   --  model-array_def.ads:42:3:Get_Defined_Range
--  end read only

    Obj_Array : access Model.Array_Def.Object_T :=
      Model.Array_Def.Reference_T (Gnattest_T.Fixture);

  begin

    AUnit.Assertions.Assert
      (Fixtures.Array_1_Range = Obj_Array.Defined_Range.all,
       "error on contained_type");

--  begin read only
   end Test_Get_Defined_Range;
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
end Model.Array_Def.Object_T_Test_Data.Object_T_Tests;
