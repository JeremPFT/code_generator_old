package body Model.Module is

  procedure Initialize
    (Self   : in out Object_T'Class;
     Name   : in     String;
     Kind   : in     String;
     Parent : access Project.Object_T'Class := null)
  is
  begin
    Project.Initialize (Object_T (Self), Name, Kind);
    Self.Parent := Parent;
  end Initialize;

  function Create
    (Name   : in String;
     Kind   : in String;
     Parent : access Project.Object_T'Class := null)
    return not null access Object_T'Class
  is
    Object : constant access Object_T := new Object_T;
  begin
    Object.Initialize (Name, Kind, Parent);

    return Object;
  end Create;

  overriding
  procedure Visit
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class)
  is
  begin
    Object.Visit_Module (Self);
  end Visit;

end Model.Module;
