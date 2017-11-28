with Ada.Characters.Latin_1;
with Ada.Strings.Unbounded;

package body Model.Class_Def is

  function Create
    (Owner_Package     : access Package_Def.Object_T;
     Name              : in     String;
     Parent_Class      : access Object_T'Class               := null;
     Parent_Interfaces : in     Model.Interface_Def.Vector_T :=
       Model.Interface_Def.Vectors.Empty_Vector;
     Is_Abstract       : in     Boolean                      := False)
    return not null access Object_T'Class
  is
    Obj_Class : constant access Object_T :=
      new Object_T'(Interface_Def.Object_T
                    with
                    Owner_Package => Owner_Package,
                    Is_Abstract   => Is_Abstract,
                    Parent_Class  => Parent_Class,
                    others        => <>);
  begin

    Obj_Class.Set_Name (Name);

    for Itf of Parent_Interfaces loop
      Obj_Class.Add_Parent_Interface (Itf);
    end loop;

    return Obj_Class;
  end Create;

  procedure Add_Protected_Subprogram
    (Self   : in out Object_T;
     Object : access Subprogram.Object_T)
  is
  begin
    Self.Protected_Subprograms.Append (Object);
  end Add_Protected_Subprogram;

  procedure Add_Private_Subprogram
    (Self   : in out Object_T;
     Object : access Subprogram.Object_T)
  is
  begin
    Self.Private_Subprograms.Append (Object);
  end Add_Private_Subprogram;

  procedure Add_Field
    (Self   : in out          Object_T;
     Object : not null access Field.Object_T)
  is
  begin
    Self.Fields.Append (Object);
  end Add_Field;

  procedure Add_Discriminant
    (Self   : in out          Object_T;
     Object : not null access Field.Object_T)
  is
  begin
    Self.Discriminants.Append (Object);
  end Add_Discriminant;

  overriding
  function To_String
    (Self : in Object_T)
    return String
  is
    package U_Str renames Ada.Strings.Unbounded;
    use type U_Str.Unbounded_String;

    package Latin_1 renames Ada.Characters.Latin_1;
    EOL : constant String := Latin_1.CR & Latin_1.LF;

    U_Result : U_Str.Unbounded_String := U_Str.Null_Unbounded_String;
  begin
    U_Result := U_Result & U_Str.To_Unbounded_String
      ("Class_Def.Object_T, " &
         "name: """ & Self.Get_Name & """");

    for Field of Self.Fields loop
      U_Result := U_Result & EOL & Field.To_String;
    end loop;

    return U_Str.To_String (U_Result);
  end To_String;

  overriding
  procedure Visit
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class)
  is
  begin
    Object.Visit_Class (Self);
  end Visit;

end Model.Class_Def;
