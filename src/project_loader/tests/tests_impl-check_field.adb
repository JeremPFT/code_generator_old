with Ada.Exceptions;
with Ada.Text_IO;

separate (Tests_Impl)

package body Check_Field is

  package T_IO renames Ada.Text_IO;

  -----------------------------------------------------------------------------

  procedure Method_Check_Data
    (Name                 : in     String;
     Of_Type              : in     String := "";
     Name_Found           :    out Boolean;
     Number_Of_Parameters :    out Natural;
     Has_Return           :    out Boolean);

  -----------------------------------------------------------------------------

  procedure Number
  is
  begin
    Assert (Get_Class_1.Number_Of_Fields = Class_1_Number_Of_Fields,
            "bad number of fields");
  exception
    when E : others =>
      Ada.Text_IO.Put_Line (Ada.Exceptions.Exception_Information (E));
      --  when Assertion_Error => null;
  end Number;

  -----------------------------------------------------------------------------

  procedure Try_When_No_Default;

  procedure Add_2_Basic_Fields
  is
  begin
    Assert (Get_Class_1_Field (1).Get_Name = "cls_1_fld_1",
            "bad field name 1");
    Assert (Get_Class_1_Field (1).Get_Type = "cls_1_fld_1_type",
            "bad field type 1");
    Assert (Get_Class_1_Field (1).Get_Default_Value = "cls_1_fld_1_default",
            "bad default value 1");

    Assert (Get_Class_1_Field (2).Get_Name = "cls_1_fld_2",
            "bad field name 2");
    Assert (Get_Class_1_Field (2).Get_Type = "cls_1_fld_2_type",
            "bad field type 2");
    Assert_Exception
      (Try_When_No_Default'Access,
       "asking empty default value should raise");

  exception
    when E : others =>
      Ada.Text_IO.Put_Line (Ada.Exceptions.Exception_Information (E));
      --  when Assertion_Error => null;
  end Add_2_Basic_Fields;

  procedure Try_When_No_Default
  is
    Tmp : constant String := Get_Class_1_Field (2).Get_Default_Value;
  begin
    null;
  end;

  -----------------------------------------------------------------------------

  procedure With_Get
  is
    Index_Image : constant String   := "3";
    Field_Index : constant Positive := Positive'Value (Index_Image);

    Actual_Field : constant access Model.Field.Object_T'Class :=
      Get_Class_1_Field (Field_Index);

    Field_Name    : constant String := Actual_Field.Get_Name;
    Field_Type    : constant String := Actual_Field.Get_Type;
    Field_Default : constant String := Actual_Field.Get_Default_Value;

    Name_Found           : Boolean := False;
    Has_Return           : Boolean := False;
    Number_Of_Parameters : Natural := 0;

    Tmp : Boolean;
  begin
    Tmp := Assert (Field_Name = "cls_1_fld_" & Index_Image,
                   "bad field name " & Index_Image);
    Tmp := Assert (Field_Type = "cls_1_fld_" & Index_Image & "_type",
                   "bad field type " & Index_Image);
    Tmp := Assert (Field_Default = "cls_1_fld_" & Index_Image & "_default",
                   "bad default value " & Index_Image);

    Method_Check_Data (Name                 => "get_" & Field_Name,
                       Of_Type              => Field_Type,
                       Name_Found           => Name_Found,
                       Has_Return           => Has_Return,
                       Number_Of_Parameters => Number_Of_Parameters);

    Tmp := Assert (Name_Found,
                   "method get for field " &
                     Actual_Field.Get_Name & " not found");
    Tmp := Assert (Number_Of_Parameters = 1,
                   "should have 1 parameter");
    Tmp := Assert (Has_Return,
                   "should have a return");

    --  exception
    --    when E : others =>
    --      Ada.Text_IO.Put_Line (Ada.Exceptions.Exception_Information (E));
    --      --  when Assertion_Error => null;
  end With_Get;

  -----------------------------------------------------------------------------

  procedure With_Set
  is
    Index_Image : constant String   := "4";
    Field_Index : constant Positive := Positive'Value (Index_Image);

    Actual_Field : constant access Model.Field.Object_T'Class :=
      Get_Class_1_Field (Field_Index);

    Field_Name : constant String := Actual_Field.Get_Name;
    Field_Type : constant String := Actual_Field.Get_Type;

    Name_Found           : Boolean := False;
    Has_Return           : Boolean := False;
    Number_Of_Parameters : Natural := 0;

    Debug : Model.Visitor.Printer.Object_T;
  begin
    Assert (Field_Name = "cls_1_fld_" & Index_Image,
            "bad field name " & Index_Image);
    Assert (Field_Type = "cls_1_fld_" & Index_Image & "_type",
            "field type " & Index_Image);

    Method_Check_Data (Name                 => "set_" & Field_Name,
                       Name_Found           => Name_Found,
                       Number_Of_Parameters => Number_Of_Parameters,
                       Has_Return           => Has_Return);

    Assert (Name_Found,
            "method set for field " & Actual_Field.Get_Name &
              " not found");
    Assert (Number_Of_Parameters = 2,
            "should have 2 parameters");
    Assert (not Has_Return,
            "shouldn't have a return");
  exception
    when E : others =>
      Ada.Text_IO.Put_Line (Ada.Exceptions.Exception_Information (E));
      --  when Assertion_Error => null;
  end With_Set;

  -----------------------------------------------------------------------------

  procedure With_Get_Set
  is
    Index_Image : constant String   := "5";
    Field_Index : constant Positive := Positive'Value (Index_Image);

    Actual_Field : constant access Model.Field.Object_T'Class :=
      Get_Class_1_Field (Field_Index);

    Field_Name : constant String := Actual_Field.Get_Name;
    Field_Type : constant String := Actual_Field.Get_Type;

    Name_Found           : Boolean := False;
    Has_Return           : Boolean := False;
    Number_Of_Parameters : Natural := 0;

  begin
    Assert (Field_Name = "cls_1_fld_" & Index_Image,
            "bad field name " & Index_Image);
    Assert (Field_Type = "cls_1_fld_" & Index_Image & "_type",
            "field type " & Index_Image);

    Method_Check_Data (Name                 => "set_" & Field_Name,
                       Name_Found           => Name_Found,
                       Number_Of_Parameters => Number_Of_Parameters,
                       Has_Return           => Has_Return);

    Assert (Name_Found,
            "method set for field " & Actual_Field.Get_Name &
              " not found");
    Assert (Number_Of_Parameters = 2,
            "should have 2 parameters");
    Assert (not Has_Return,
            "shouldn't have a return");

    Method_Check_Data (Name                 => "get_" & Field_Name,
                       Of_Type              => Field_Type,
                       Name_Found           => Name_Found,
                       Has_Return           => Has_Return,
                       Number_Of_Parameters => Number_Of_Parameters);

    Assert (Name_Found,
            "method get for field " &
              Actual_Field.Get_Name & " not found");
    Assert (Number_Of_Parameters = 1,
            "should have 1 parameter");
    Assert (Has_Return,
            "should have a return");
  exception
    when E : others =>
      Ada.Text_IO.Put_Line (Ada.Exceptions.Exception_Information (E));
      --  when Assertion_Error => null;
  end With_Get_Set;

  -----------------------------------------------------------------------------

  procedure Try_With_Unknown_Option;

  procedure Unkown_Option
  is
  begin
    Assert_Exception (Try_With_Unknown_Option'Access,
                      "unknown_option should raise an error");
  exception
    when E : others =>
      Ada.Text_IO.Put_Line (Ada.Exceptions.Exception_Information (E));
      --  when Assertion_Error => null;
  end Unkown_Option;

  procedure Try_With_Unknown_Option
  is
  begin
    Load.Field ("field : type; another_option");
  end;

  -----------------------------------------------------------------------------

  procedure Vector_Same_Class
  is
  begin
    Assert (Get_Class_1_Field (6).Get_Name = "cls_1_fld_6",
            "bad field name 6");
    Assert (Get_Class_1_Field (6).Get_Type = "vector",
            "bad field type 6");
    null;
  exception
    when E : others =>
      Ada.Text_IO.Put_Line (Ada.Exceptions.Exception_Information (E));
      --  when Assertion_Error => null;
  end Vector_Same_Class;

  -----------------------------------------------------------------------------

  procedure Vector_Other_Class
  is
  begin
    Assert (Get_Class_1_Field (7).Get_Name = "cls_1_fld_7",
            "bad field name 7");
    Assert (Get_Class_1_Field (7).Get_Type = "class_2.vector",
            "bad field type 7");
    null;
  exception
    when E : others =>
      Ada.Text_IO.Put_Line (Ada.Exceptions.Exception_Information (E));
      --  when Assertion_Error => null;
  end Vector_Other_Class;

  -----------------------------------------------------------------------------

  procedure Method_Check_Data
    (Name                 : in     String;
     Of_Type              : in     String := "";
     Name_Found           :    out Boolean;
     Number_Of_Parameters :    out Natural;
     Has_Return           :    out Boolean)
  is
    Pkg : access Model.Package_Def.Object_T renames
      Get_Class_1_Package;

    Method  : access Model.Subprogram.Object_T'Class    := null;
    Element : access Model.Named_Element.Object_T'Class := null;
  begin
    Name_Found           := False;
    Number_Of_Parameters := 0;
    Has_Return           := False;

    On_All_Public_Elements :
    for I in 1 .. Pkg.Get_Defined_Namespace.Number_Of_Members loop
      Element := Pkg.Get_Defined_Namespace.Get_Member (Index => I);

      if Element.Get_Name = Name then
        Name_Found := True;
        Method     := Model.Subprogram.Class_T (Element);
      end if;

    end loop On_All_Public_Elements;

    if Name_Found then
      Number_Of_Parameters := Method.Number_Of_Parameters;
      Has_Return           := Method.Has_Return;
    end if;
  end Method_Check_Data;

  -----------------------------------------------------------------------------

end Check_Field;
