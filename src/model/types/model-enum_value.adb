with Model.Enum_Def;
with Model.Namespace;

package body Model.Enum_Value is

  procedure Initialize
    (Self       : in out          Object_T'Class;
     Name       : in              String;
     Value      : in              Integer;
     Owner_Enum : not null access Enum_Def.Object_T'Class)
  is
    Owner_Namespace : constant access Namespace.Object_T'Class :=
      Owner_Enum.Get_Owner_Namespace;
  begin
    Parent_Pkg.Initialize (Self            => Self,
                           Name            => Name,
                           Owner_Namespace => Owner_Namespace);

    Self.Value      := Value;
    Self.Owner_Enum := Owner_Enum;
  end Initialize;

  function Create
    (Owner_Enum : not null access Enum_Def.Object_T'Class;
     Name       : in String;
     Value      : in Integer)
    return not null access Object_T'Class
  is
    Object : constant access Object_T := new Object_T;
  begin
    Object.Initialize (Name       => Name,
                       Value      => Value,
                       Owner_Enum => Owner_Enum);
    return Object;
  end Create;

end Model.Enum_Value;
