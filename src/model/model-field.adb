with Ada.Strings.Unbounded;

with Model.Class_Def;

package body Model.Field is

  function Create
    (Owner_Class   : not null access Class_Def.Object_T'Class;
     Name          : in              String;
     Of_Type       : in              String;
     Default_Value : in              String := "")
    return not null access Object_T'Class
  is
    Of_Type_Val       : constant access String :=
      new String'(Of_Type);
    Default_Value_Val : constant access String :=
      (if Default_Value = ""
       then null
       else new String'(Default_Value));

    Obj_Field : constant access Object_T :=
      new Object_T'(Named_Element.Object_T with
                    Owner_Class   => Owner_Class,
                    Of_Type       => Of_Type_Val,
                    Default_Value => Default_Value_Val);
  begin
    Obj_Field.Set_Name (Name);
    return Obj_Field;
  end Create;

  overriding
  function To_String
    (Self : in Object_T)
    return String
  is
    package U_Str renames Ada.Strings.Unbounded;
    use type U_Str.Unbounded_String;

    U_Result : U_Str.Unbounded_String := U_Str.Null_Unbounded_String;
  begin
    U_Result := U_Result & U_Str.To_Unbounded_String
      ("[Field.Object_T] " &
         """" & Self.Get_Name & """" & " : " &
         """" & Self.Get_Type & """" &
         (if Self.Has_Default_Value then
            " := " & """" & Self.Get_Default_Value & """"
          else ""));

    return U_Str.To_String (U_Result);
  end To_String;

  overriding
  procedure Visit
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class)
  is
  begin
    Object.Visit_Field (Self);
  end Visit;

end Model.Field;
