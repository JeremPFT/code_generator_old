with Ada.Strings.Unbounded;

package body Model.Named_Element is

  procedure Initialize
    (Self : in out Object_T'Class;
     Name : in     String)
  is
  begin
    Element.Initialize (Self);
    Self.Name := new String'(Name);
  end Initialize;

  --  procedure Set_Name
  --    (Self  : in out Object_T;
  --     Value : in String)
  --  is
  --  begin
  --    Self.Name := new String'(Value);
  --  end Set_Name;

  function To_String
    (Self : in Object_T)
    return String
  is
    package U_Str renames Ada.Strings.Unbounded;
    use type U_Str.Unbounded_String;

    U_Result : U_Str.Unbounded_String := U_Str.Null_Unbounded_String;
  begin
    U_Result := U_Result & U_Str.To_Unbounded_String
      ("Named_Element, " &
         "name: """ & Self.Get_Name & """");

    return U_Str.To_String (U_Result);
  end To_String;

end Model.Named_Element;
