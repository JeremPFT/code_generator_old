package body Model.Enum_Value is

  procedure Initialize
    (Self  : in out Object_T'Class;
     Name  : in     String;
     Value : in     Integer)
  is
  begin
    Parent_Pkg.Initialize (Self, Name);
    Self.Value := Value;
  end Initialize;

  function Create
    (Owner_Enum : not null access Enum_Def.Object_T'Class;
     Name       : in String;
     Value      : in Integer)
    return not null access Object_T'Class
  is
    Object : constant access Object_T :=
      new Object_T (Owner_Enum => Owner_Enum);
  begin
    Object.Initialize (Name, Value);
    return Object;
  end Create;

end Model.Enum_Value;
