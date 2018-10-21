--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Model_Visitor.Visit_Field_Impl.Test_Data.

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
package body Model_Visitor.Visit_Field_Impl.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   procedure Wrap_Test_Init_6597ca_78e722 (Field   : not null access Model.Field.Object_T'Class; Visitor : in out          Model_Visitor.Object_T) 
   is
   begin
      begin
         pragma Assert
           (True);
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(model_visitor-visit_field_impl.ads:0:):nominal test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Model_Visitor.Visit_Field_Impl.Init (Field, Visitor);
      begin
         pragma Assert
           (True);

      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(model_visitor-visit_field_impl.ads:0:):nominal test commitment violated");
      end;
   end Wrap_Test_Init_6597ca_78e722;
--  end read only

--  begin read only
   procedure Test_Init_nominal (Gnattest_T : in out Test);
   procedure Test_Init_6597ca_78e722 (Gnattest_T : in out Test) renames Test_Init_nominal;
--  id:2.2/6597ca2af1d1f381/Init/1/0/nominal/
   procedure Test_Init_nominal (Gnattest_T : in out Test) is
   --  model_visitor-visit_field_impl.ads:13:3:Init
   procedure Init (Field   : not null access Model.Field.Object_T'Class; Visitor : in out          Model_Visitor.Object_T) renames Wrap_Test_Init_6597ca_78e722;
--  end read only

  begin

    Init (Field   => Gnattest_T.Field_With_Default,
          Visitor => Gnattest_T.Visitor);

    AUnit.Assertions.Assert (Field = Gnattest_T.Field_With_Default,
                             "bad field");

--  begin read only
   end Test_Init_nominal;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Name_6bd702_78e722
   is
   begin
      begin
         pragma Assert
           (True);
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(model_visitor-visit_field_impl.ads:0:):nominal test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Model_Visitor.Visit_Field_Impl.Set_Name;
      begin
         pragma Assert
           (True);

      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(model_visitor-visit_field_impl.ads:0:):nominal test commitment violated");
      end;
   end Wrap_Test_Set_Name_6bd702_78e722;
--  end read only

--  begin read only
   procedure Test_Set_Name_nominal (Gnattest_T : in out Test);
   procedure Test_Set_Name_6bd702_78e722 (Gnattest_T : in out Test) renames Test_Set_Name_nominal;
--  id:2.2/6bd7022f15dcb2a8/Set_Name/1/0/nominal/
   procedure Test_Set_Name_nominal (Gnattest_T : in out Test) is
   --  model_visitor-visit_field_impl.ads:19:3:Set_Name
   procedure Set_Name renames Wrap_Test_Set_Name_6bd702_78e722;
--  end read only

  begin

    Init (Field   => Gnattest_T.Field_With_Default,
          Visitor => Gnattest_T.Visitor);
    Set_Name;

    declare
      Expected : constant String := Obj_Template.Get_Value (Tag_Name => "FIELD_NAME", Index => 1);
      Actual   : constant String := Gnattest_T.Field_With_Default.Get_Name;
    begin
      AUnit.Assertions.Assert
        (Expected = Actual,
         "field_name not good: got """ & Actual & """, expected """ & Expected & """");
    end;

--  begin read only
   end Test_Set_Name_nominal;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Name_6bd702_8e3f1c
   is
   begin
      GNATtest_Generated.GNATtest_Standard.Model_Visitor.Visit_Field_Impl.Set_Name;
   end Wrap_Test_Set_Name_6bd702_8e3f1c;
--  end read only

--  begin read only
   procedure Test_Set_Name_not_initialized (Gnattest_T : in out Test);
   procedure Test_Set_Name_6bd702_8e3f1c (Gnattest_T : in out Test) renames Test_Set_Name_not_initialized;
--  id:2.2/6bd7022f15dcb2a8/Set_Name/1/0/not_initialized/
   procedure Test_Set_Name_not_initialized (Gnattest_T : in out Test) is
   --  model_visitor-visit_field_impl.ads:19:3:Set_Name
   procedure Set_Name renames Wrap_Test_Set_Name_6bd702_8e3f1c;
--  end read only

    pragma Unreferenced (Gnattest_T);

  begin

    Set_Name;

    AUnit.Assertions.Assert
      (False,
       "Test_Set_Name_Not_Initialized TODO.");

--  begin read only
   end Test_Set_Name_not_initialized;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Type_b137e0_78e722
   is
   begin
      begin
         pragma Assert
           (True);
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(model_visitor-visit_field_impl.ads:0:):nominal test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Model_Visitor.Visit_Field_Impl.Set_Type;
      begin
         pragma Assert
           (True);

      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(model_visitor-visit_field_impl.ads:0:):nominal test commitment violated");
      end;
   end Wrap_Test_Set_Type_b137e0_78e722;
--  end read only

--  begin read only
   procedure Test_Set_Type_nominal (Gnattest_T : in out Test);
   procedure Test_Set_Type_b137e0_78e722 (Gnattest_T : in out Test) renames Test_Set_Type_nominal;
--  id:2.2/b137e02c8f741196/Set_Type/1/0/nominal/
   procedure Test_Set_Type_nominal (Gnattest_T : in out Test) is
   --  model_visitor-visit_field_impl.ads:25:3:Set_Type
   procedure Set_Type renames Wrap_Test_Set_Type_b137e0_78e722;
--  end read only

  begin

    Init (Field   => Gnattest_T.Field_With_Default,
          Visitor => Gnattest_T.Visitor);
    Set_Type;

    declare
      Expected : constant String := Obj_Template.Get_Value (Tag_Name => "FIELD_TYPE", Index => 1);
      Actual   : constant String := Gnattest_T.Field_With_Default.Get_Type;
    begin
      AUnit.Assertions.Assert
        (Expected = Actual,
         "field_name not good: got """ & Actual & """, expected """ & Expected & """");
    end;

--  begin read only
   end Test_Set_Type_nominal;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Type_b137e0_8e3f1c
   is
   begin
      GNATtest_Generated.GNATtest_Standard.Model_Visitor.Visit_Field_Impl.Set_Type;
   end Wrap_Test_Set_Type_b137e0_8e3f1c;
--  end read only

--  begin read only
   procedure Test_Set_Type_not_initialized (Gnattest_T : in out Test);
   procedure Test_Set_Type_b137e0_8e3f1c (Gnattest_T : in out Test) renames Test_Set_Type_not_initialized;
--  id:2.2/b137e02c8f741196/Set_Type/1/0/not_initialized/
   procedure Test_Set_Type_not_initialized (Gnattest_T : in out Test) is
   --  model_visitor-visit_field_impl.ads:25:3:Set_Type
   procedure Set_Type renames Wrap_Test_Set_Type_b137e0_8e3f1c;
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Set_Type_not_initialized;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Default_Value_4348e5_3a68d1
   is
   begin
      begin
         pragma Assert
           (True);
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(model_visitor-visit_field_impl.ads:0:):nominal_with_default test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Model_Visitor.Visit_Field_Impl.Set_Default_Value;
      begin
         pragma Assert
           (True);

      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(model_visitor-visit_field_impl.ads:0:):nominal_with_default test commitment violated");
      end;
   end Wrap_Test_Set_Default_Value_4348e5_3a68d1;
--  end read only

--  begin read only
   procedure Test_Set_Default_Value_nominal_with_default (Gnattest_T : in out Test);
   procedure Test_Set_Default_Value_4348e5_3a68d1 (Gnattest_T : in out Test) renames Test_Set_Default_Value_nominal_with_default;
--  id:2.2/4348e5640f4963bd/Set_Default_Value/1/0/nominal_with_default/
   procedure Test_Set_Default_Value_nominal_with_default (Gnattest_T : in out Test) is
   --  model_visitor-visit_field_impl.ads:31:3:Set_Default_Value
   procedure Set_Default_Value renames Wrap_Test_Set_Default_Value_4348e5_3a68d1;
--  end read only

  begin

    Init (Field   => Gnattest_T.Field_With_Default,
          Visitor => Gnattest_T.Visitor);
    Set_Default_Value;

    declare
      Expected : constant String := Obj_Template.Get_Value (Tag_Name => "FIELD_DEFAULT_VALUE", Index => 1);
      Actual   : constant String := Gnattest_T.Field_With_Default.Get_Default_Value;
    begin
      AUnit.Assertions.Assert
        (Expected = Actual,
         "field_name not good: got """ & Actual & """, expected """ & Expected & """");
    end;

--  begin read only
   end Test_Set_Default_Value_nominal_with_default;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Default_Value_4348e5_bd09c7
   is
   begin
      GNATtest_Generated.GNATtest_Standard.Model_Visitor.Visit_Field_Impl.Set_Default_Value;
   end Wrap_Test_Set_Default_Value_4348e5_bd09c7;
--  end read only

--  begin read only
   procedure Test_Set_Default_Value_without_default (Gnattest_T : in out Test);
   procedure Test_Set_Default_Value_4348e5_bd09c7 (Gnattest_T : in out Test) renames Test_Set_Default_Value_without_default;
--  id:2.2/4348e5640f4963bd/Set_Default_Value/1/0/without_default/
   procedure Test_Set_Default_Value_without_default (Gnattest_T : in out Test) is
   --  model_visitor-visit_field_impl.ads:31:3:Set_Default_Value
   procedure Set_Default_Value renames Wrap_Test_Set_Default_Value_4348e5_bd09c7;
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Set_Default_Value_without_default;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Default_Value_4348e5_8e3f1c
   is
   begin
      GNATtest_Generated.GNATtest_Standard.Model_Visitor.Visit_Field_Impl.Set_Default_Value;
   end Wrap_Test_Set_Default_Value_4348e5_8e3f1c;
--  end read only

--  begin read only
   procedure Test_Set_Default_Value_not_initialized (Gnattest_T : in out Test);
   procedure Test_Set_Default_Value_4348e5_8e3f1c (Gnattest_T : in out Test) renames Test_Set_Default_Value_not_initialized;
--  id:2.2/4348e5640f4963bd/Set_Default_Value/1/0/not_initialized/
   procedure Test_Set_Default_Value_not_initialized (Gnattest_T : in out Test) is
   --  model_visitor-visit_field_impl.ads:31:3:Set_Default_Value
   procedure Set_Default_Value renames Wrap_Test_Set_Default_Value_4348e5_8e3f1c;
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Set_Default_Value_not_initialized;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Image_36d8f4_78e722
   is
   begin
      begin
         pragma Assert
           (True);
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(model_visitor-visit_field_impl.ads:0:):nominal test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Model_Visitor.Visit_Field_Impl.Set_Image;
      begin
         pragma Assert
           (True);

      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(model_visitor-visit_field_impl.ads:0:):nominal test commitment violated");
      end;
   end Wrap_Test_Set_Image_36d8f4_78e722;
--  end read only

--  begin read only
   procedure Test_Set_Image_nominal (Gnattest_T : in out Test);
   procedure Test_Set_Image_36d8f4_78e722 (Gnattest_T : in out Test) renames Test_Set_Image_nominal;
--  id:2.2/36d8f4f5fa81b32e/Set_Image/1/0/nominal/
   procedure Test_Set_Image_nominal (Gnattest_T : in out Test) is
   --  model_visitor-visit_field_impl.ads:39:3:Set_Image
   procedure Set_Image renames Wrap_Test_Set_Image_36d8f4_78e722;
--  end read only

    Expected_1 : constant String := "field_with_default : a_type := default;";
    Expected_2 : constant String := "field_without_default : a_type;";

  begin

    Init (Field   => Gnattest_T.Field_With_Default,
          Visitor => Gnattest_T.Visitor);

    Set_Name;
    Set_Type;
    if Gnattest_T.Field_With_Default.Has_Default_Value then
      Set_Default_Value;
    end if;
    Set_Image;

    AUnit.Assertions.Assert
      (Expected_1 = Field_Image.all,
       "expects """ & Expected_1 & """, got """ & Field_Image.all & """");

    Init (Field   => Gnattest_T.Field_Without_Default,
          Visitor => Gnattest_T.Visitor);

    Set_Name;
    Set_Type;
    if Gnattest_T.Field_Without_Default.Has_Default_Value then
      Set_Default_Value;
    end if;
    Set_Image;

    AUnit.Assertions.Assert
      (Expected_2 = Field_Image.all,
       "should be """ & Expected_2 & """, is """ & Field_Image.all & """");

--  begin read only
   end Test_Set_Image_nominal;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Image_36d8f4_8e3f1c
   is
   begin
      GNATtest_Generated.GNATtest_Standard.Model_Visitor.Visit_Field_Impl.Set_Image;
   end Wrap_Test_Set_Image_36d8f4_8e3f1c;
--  end read only

--  begin read only
   procedure Test_Set_Image_not_initialized (Gnattest_T : in out Test);
   procedure Test_Set_Image_36d8f4_8e3f1c (Gnattest_T : in out Test) renames Test_Set_Image_not_initialized;
--  id:2.2/36d8f4f5fa81b32e/Set_Image/1/0/not_initialized/
   procedure Test_Set_Image_not_initialized (Gnattest_T : in out Test) is
   --  model_visitor-visit_field_impl.ads:39:3:Set_Image
   procedure Set_Image renames Wrap_Test_Set_Image_36d8f4_8e3f1c;
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Set_Image_not_initialized;
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
end Model_Visitor.Visit_Field_Impl.Test_Data.Tests;
