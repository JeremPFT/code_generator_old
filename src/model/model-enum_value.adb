package body Model.Enum_Value is

  function Create
    (Owner_Enum : not null access Enum_Def.Object_T'Class;
     Name       : in String;
     Value      : in Integer)
    return not null access Object_T'Class
  is
    Obj_Value : constant access Object_T :=
      new Object_T'(Named_Element.Object_T
                    with
                    Owner_Enum => Owner_Enum,
                    Value      => Value);
  begin
    Obj_Value.Set_Name (Name);
    return Obj_Value;
  end Create;

end Model.Enum_Value;
