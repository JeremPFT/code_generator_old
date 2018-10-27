package body Model.Project is

  procedure Initialize
    (Self   : in out Object_T'Class;
     Name   : in     String;
     Kind   : in     String;
     Parent : access Parent_Project.Object_T'Class := null)
  is
  begin
    Parent_Pkg.Initialize (Self,
                           Name,
                           Owner_Namespace => null,
                           Visibility      => Named_Element.Public_Visibility);
    Self.Parent := Parent;
    Self.Kind   := new String'(Kind);
  end Initialize;

  function Create
    (Name   : in     String;
     Kind   : in     String;
     Parent : access Parent_Project.Object_T'Class := null)
    return not null access Object_T'Class
  is
    Object : constant access Object_T := new Object_T;
  begin
    Object.Initialize (Name, Kind, Parent);

    return Object;
  end Create;

  procedure Add_Element
    (Self   : in out          Object_T;
     Object : not null access Named_Element.Object_T'Class)
  is
  begin
    Self.Elements.Append (Object);
  end Add_Element;

  procedure Add_Package
    (Self   : in out          Object_T;
     Object : not null access Package_Def.Object_T'Class)
  is
  begin
    Self.Add_Element (Named_Element.Access_T (Object));
  end Add_Package;

  procedure Add_Class
    (Self   : in out          Object_T;
     Object : not null access Types.Class_Def.Object_T'Class)
  is
  begin
    Self.Add_Element (Named_Element.Access_T (Object));
  end Add_Class;

  procedure Add_Operation
    (Self   : in out          Object_T;
     Object : not null access Operation.Object_T'Class)
  is
  begin
    Self.Add_Element (Named_Element.Access_T (Object));
  end Add_Operation;

  overriding
  procedure Visit
    (Self   : in out Object_T;
     Object : in out Visitor.Object_T'Class)
  is
  begin
    Object.Visit_Project (Self);
  end Visit;

end Model.Project;
