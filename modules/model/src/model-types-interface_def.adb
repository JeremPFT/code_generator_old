with Model.Package_Def;

package body Model.Types.Interface_Def is

  procedure Initialize
    (Self              : in out          Object_T'Class;
     Name              : in              String;
     Owner_Package     : not null access Package_Def.Object_T'Class;
     Parent_Interfaces : in              Model.Types.Interface_Def.Vector_T :=
       Model.Types.Interface_Def.Vectors.Empty_Vector;
     Visibility        : in              Named_Element.Element_Visibility_T)
  is
  begin
    Parent_Pkg.Initialize
      (Self            => Self,
       Name            => Name,
       Owner_Namespace => Owner_Package.Get_Defined_Namespace,
       Visibility      => Visibility);

    for Itf of Parent_Interfaces loop
      Self.Add_Parent_Interface (Itf);
    end loop;

    Self.Owner_Package := Owner_Package;
  end Initialize;

  function Create
    (Name              : in              String;
     Owner_Package     : not null access Package_Def.Object_T'Class;
     Parent_Interfaces : in              Vector_T := Vectors.Empty_Vector;
     Visibility        : in              Named_Element.Element_Visibility_T)
    return not null access Object_T'Class
  is
    Object : constant access Object_T := new Object_T;
  begin
    Object.Initialize (Name              => Name,
                       Owner_Package     => Owner_Package,
                       Parent_Interfaces => Parent_Interfaces,
                       Visibility        => Visibility);
    return Object;
  end Create;

  procedure Add_Parent_Interface
    (Self   : in out Object_T;
     Parent : access Object_T'Class)
  is
  begin
    Self.Parent_Interfaces.Append (Parent);
  end Add_Parent_Interface;

  --  procedure Add_Public_Operation
  --    (Self   : in out Object_T;
  --     Object : access Operation.Object_T)
  --  is
  --  begin
  --    Self.Public_Operations.Append (Object);
  --  end Add_Public_Operation;

  overriding
  procedure Visit
    (Self   : in out Object_T;
     Object : in out Visitor.Object_T'Class)
  is
  begin
    Object.Visit_Interface (Self);
  end Visit;

end Model.Types.Interface_Def;
