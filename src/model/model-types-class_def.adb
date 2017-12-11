with Model.Named_Element;
with Model.Field;
with Model.Namespace;

package body Model.Types.Class_Def is

  ----------------------------------------------------------------------------

  procedure Initialize
    (Self              : in out Object_T'Class;
     Name              : in     String;
     Owner_Package     : access Model.Package_Def.Object_T'Class;
     Parent_Class      : access Object_T'Class                     := null;
     Parent_Interfaces : in     Model.Types.Interface_Def.Vector_T :=
       Model.Types.Interface_Def.Vectors.Empty_Vector;
     Is_Abstract       : in     Boolean                            := False)
  is
    Owner_Namespace : constant access Namespace.Object_T :=
      (if Owner_Package = null
       then null
       else Owner_Package.Get_Defined_Namespace);

    Defined_Namespace : constant access Namespace.Object_T'Class :=
      Namespace.Create (Name            => Name,
                        Owner_Namespace => Owner_Namespace);

  begin
    Parent_Pkg.Initialize
      (Self            => Self,
       Name            => Name,
       Owner_Namespace => Owner_Namespace);

    Self.Owner_Package     := Owner_Package;
    Self.Parent_Class      := Parent_Class;
    Self.Is_Abstract       := Is_Abstract;
    Self.Parent_Interfaces := Parent_Interfaces;
    Self.Defined_Namespace := Defined_Namespace;
  end Initialize;

  ----------------------------------------------------------------------------

  function Create
    (Name              : in     String;
     Owner_Package     : access Model.Package_Def.Object_T'Class;
     Parent_Class      : access Object_T'Class                     := null;
     Parent_Interfaces : in     Model.Types.Interface_Def.Vector_T :=
       Model.Types.Interface_Def.Vectors.Empty_Vector;
     Is_Abstract       : in     Boolean                            := False)
    return not null access Object_T'Class
  is
    Object : constant access Object_T := new Object_T;
  begin
    Object.Initialize (Name              => Name,
                       Owner_Package     => Owner_Package,
                       Parent_Class      => Parent_Class,
                       Parent_Interfaces => Parent_Interfaces,
                       Is_Abstract       => Is_Abstract);
    return Object;
  end Create;

  ----------------------------------------------------------------------------

  not overriding
  function Has_Fields
    (Self : in Object_T)
    return Boolean
  is
  begin
    return Self.Number_Of_Fields = 0;
  end Has_Fields;

  not overriding
  function Number_Of_Fields
    (Self : in Object_T)
    return Natural
  is
    Result : Integer := 0;
  begin
    for I in 1 .. Self.Get_Defined_Namespace.Number_Of_Members loop
      declare
        Object : access Named_Element.Object_T'Class renames
          Self.Get_Defined_Namespace.Get_Member (Index => I);
      begin
        if Object.all in Field.Object_T'Class then
          Result := Result + 1;
        end if;
      end;
    end loop;

    return Result;
  end Number_Of_Fields;

  not overriding
  function Get_Field
    (Self  : in Object_T;
     Index : in Natural)
    return not null access Field.Object_T'Class
  is
    Result : access Field.Object_T'Class := null;
    Count  : Natural                     := 0;
  begin
    for I in 1 .. Self.Get_Defined_Namespace.Number_Of_Members loop
      declare
        Object : access Named_Element.Object_T'Class renames
          Self.Get_Defined_Namespace.Get_Member (Index => I);
      begin
        if Object.all in Field.Object_T'Class then
          Count := Count + 1;
          if Index = Count then
            Result := Field.Class_T (Object);
          end if;
        end if;
      end;
    end loop;

    return Result;
  end Get_Field;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class)
  is
  begin
    Object.Visit_Class (Self);
  end Visit;

  ----------------------------------------------------------------------------

end Model.Types.Class_Def;
