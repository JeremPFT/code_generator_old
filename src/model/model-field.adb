with Ada.Strings.Unbounded;

with Model.Class_Def;

package body Model.Field is

  procedure Initialize
    (Self          : in out Object_T'Class;
     Name          : in     String;
     Of_Type       : in     String;
     Default_Value : in     String := "")
  is
  begin
    Parent_Pkg.Initialize (Self, Name);

    if Of_Type /= "" then
      Self.Of_Type := new String'(Of_Type);
    else
      raise Constraint_Error with "the field """ & Name & """ has no type";
    end if;

    if Default_Value /= "" then
      Self.Default_Value := new String'(Default_Value);
    end if;
  end Initialize;

  function Create
    (Owner_Class   : not null access Class_Def.Object_T'Class;
     Name          : in              String;
     Of_Type       : in              String;
     Default_Value : in              String := "")
    return not null access Object_T'Class
  is
    Object : constant access Object_T :=
      new Object_T (Owner_Class => Owner_Class);
  begin
    Object.Initialize (Name, Of_Type, Default_Value);
    return Object;
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
