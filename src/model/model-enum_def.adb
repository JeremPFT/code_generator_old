package body Model.Enum_Def is

  procedure Initialize
    (Self   : in out Object_T'Class;
     Name   : in     String;
     Values : in     Enum_Value.Vector_T :=
       Enum_Value.Vectors.Empty_Vector)
  is
  begin
    Parent_Pkg.Initialize (Self, Name);

    for Value of Values loop
      Self.Values.Append (Value);
    end loop;
  end Initialize;

  function Create
    (Owner_Package : access Package_Def.Object_T'Class;
     Name          : in     String;
     Values        : in     Enum_Value.Vector_T :=
       Enum_Value.Vectors.Empty_Vector)
    return not null access Object_T'Class
  is
    Object : constant access Object_T :=
      new Object_T (Owner_Package => Owner_Package);
  begin
    Object.Initialize (Name, Values);

    return Object;
  end Create;

end Model.Enum_Def;
