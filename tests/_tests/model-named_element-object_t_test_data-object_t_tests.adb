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
   procedure Test_Set_Name (Gnattest_T : in out Test_Object_T);
   procedure Test_Set_Name_f456f1 (Gnattest_T : in out Test_Object_T) renames Test_Set_Name;
--  id:2.2/f456f113e6e120b0/Set_Name/1/0/
   procedure Test_Set_Name (Gnattest_T : in out Test_Object_T) is
   --  model-named_element.ads:19:3:Set_Name
--  end read only

    --  pragma Unreferenced (Gnattest_T);

    Obj_Named_Element : access Object_T := Reference_T (Gnattest_T.Fixture);

  begin

    if Obj_Named_Element /= null then
      Obj_Named_Element.Set_Name ("named_object");

      AUnit.Assertions.Assert
        (Obj_Named_Element.Name.all = "named_object",
         "bad name.");
    end if;

    --  AUnit.Assertions.Assert
    --    (Gnattest_Generated.Default_Assert_Value,
    --     "Test not implemented.");

--  begin read only
   end Test_Set_Name;
--  end read only


--  begin read only
   procedure Test_Get_Name (Gnattest_T : in out Test_Object_T);
   procedure Test_Get_Name_ba8460 (Gnattest_T : in out Test_Object_T) renames Test_Get_Name;
--  id:2.2/ba8460e48e3f938e/Get_Name/1/0/
   procedure Test_Get_Name (Gnattest_T : in out Test_Object_T) is
   --  model-named_element.ads:24:3:Get_Name
--  end read only

    --  pragma Unreferenced (Gnattest_T);

    Obj_Named_Element : access Object_T := Reference_T (Gnattest_T.Fixture);

  begin

    if Obj_Named_Element /= null then
      Obj_Named_Element.Name := new String'("named_object");

      AUnit.Assertions.Assert
        (Obj_Named_Element.Get_Name = "named_object",
         "bad name.");
    end if;

    --  AUnit.Assertions.Assert
    --    (Gnattest_Generated.Default_Assert_Value,
    --     "Test not implemented.");

--  begin read only
   end Test_Get_Name;
--  end read only


--  begin read only
   procedure Test_To_String (Gnattest_T : in out Test_Object_T);
   procedure Test_To_String_4f6cb9 (Gnattest_T : in out Test_Object_T) renames Test_To_String;
--  id:2.2/4f6cb90407cd6846/To_String/1/0/
   procedure Test_To_String (Gnattest_T : in out Test_Object_T) is
   --  model-named_element.ads:29:3:To_String
--  end read only

    Obj_Named_Element : access Named_Element.Object_T :=
      Named_Element.Reference_T (Gnattest_T.Fixture);

  begin

    Fixtures.Check
      (Test     => "to_string",
       Actual   => Obj_Named_Element.To_String,
       Expected => "Named_Element, name: " & """" &
         Obj_Named_Element.Get_Name & """");

    --  AUnit.Assertions.Assert
    --    (Gnattest_Generated.Default_Assert_Value,
    --     "Test not implemented: to_string");

--  begin read only
   end Test_To_String;
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
