package body Model.Dependency is

  -----------------------------------------------------------------------------

  procedure Initialize
    (Self     : in out Object_T'Class;
     Client   : not null access Named_Element.Object_T'Class;
     Provider : not null access Named_Element.Object_T'Class)
  is
  begin
    Parent_Pkg.Initialize (Self => Self);

    Self.Client   := Client;
    Self.Provider := Provider;
  end Initialize;

  -----------------------------------------------------------------------------

  function Create
    (Client   : not null access Named_Element.Object_T'Class;
     Provider : not null access Named_Element.Object_T'Class)
    return not null access Object_T'Class
  is
    Result : constant access Object_T'Class := new Object_T;
  begin
    Result.Initialize (Client, Provider);
    return Result;
  end Create;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit
    (Self   : in out Object_T;
     Object : in out Visitor.Object_T'Class)
  is
  begin
    Object.Visit_Dependency (Self);
  end Visit;

  -----------------------------------------------------------------------------

end Model.Dependency;
