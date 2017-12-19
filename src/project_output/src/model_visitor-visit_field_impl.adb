with String_Utils;

package body Model_Visitor.Visit_Field_Impl is

  function "+"
    (Value : String)
    return not null access String renames String_Utils."+";

  procedure Init (Field   : not null access Model.Field.Object_T'Class;
                  Visitor : in out          Model_Visitor.Object_T)
  is
  begin
    Visit_Field_Impl.Field   := Field;
    Visit_Field_Impl.Visitor := Visitor;

    Obj_Template := Tmpl.Create
      (Template_File => "field.tada",
       Tag_Names     => (+"FIELD_NAME",
                         +"FIELD_TYPE",
                         +"FIELD_DEFAULT_VALUE",
                         +"FIELD_HAS_DEFAULT_VALUE"));
  end Init;

  procedure Set_Name
  is
  begin
    Obj_Template.Add_Value (Tag_Name => "FIELD_NAME",
                            Value    => Field.Get_Name);
  end Set_Name;

  procedure Set_Type
  is
  begin
    Obj_Template.Add_Value (Tag_Name => "FIELD_TYPE",
                            Value    => Field.Get_Type);
  end Set_Type;

  procedure Set_Default_Value
  is
  begin
    if Field.Has_Default_Value then
      declare
        Value : constant String := Field.Get_Default_Value;
        pragma Unreferenced (Value);
      begin
        Obj_Template.Add_Value (Tag_Name => "FIELD_DEFAULT_VALUE",
                                Value    => Field.Get_Default_Value);
        Obj_Template.Add_Value (Tag_Name => "FIELD_HAS_DEFAULT_VALUE",
                                Value    => True);
      end;
    end if;
  end Set_Default_Value;

  procedure Set_Image
  is
    Image : constant String := Obj_Template.To_String;
  begin
    String_Utils.Free (Model_Visitor.Field_Image);
    Model_Visitor.Field_Image := new String'
      (Image (Image'First .. Image'Last - 1));
  end Set_Image;

end Model_Visitor.Visit_Field_Impl;
