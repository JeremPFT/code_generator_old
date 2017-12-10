
--  with ada files

--  with others libraries

--  with project files

package body Model.Namespace is

  -----------------------------------------------------------------------------

  --
  --  private data declarations
  --

  -----------------------------------------------------------------------------

  --
  --  private subprograms declarations
  --

  -----------------------------------------------------------------------------

  --
  --  public subprograms definitions
  --

  -----------------------------------------------------------------------------

  procedure Initialize
    (Self            : in out Object_T'Class;
     Name            : in     String;
     Owner_Namespace : access Namespace.Object_T'Class)
  is
  begin
    Parent_Pkg.Initialize (Self            => Self,
                           Name            => Name,
                           Owner_Namespace => Owner_Namespace);
  end Initialize;

  function Create
    (Name            : in     String;
     Owner_Namespace : access Namespace.Object_T'Class)
    return not null access Object_T'Class
  is
    Result : constant access Object_T'Class := new Object_T;
  begin
    Namespace.Initialize (Self            => Result.all,
                          Name            => Name,
                          Owner_Namespace => Owner_Namespace);
    return Result;
  end Create;

  not overriding
  procedure Add_Member
    (Self       : in out          Object_T;
     Object     : not null access Named_Element.Object_T'Class;
     Visibility : in              Visibility_Kind := Public_Visibility)
  is
  begin
    Self.Owned_Members (Visibility).Append (Object);
  end Add_Member;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class)
  is
  begin
    Object.Visit_Namespace (Self);
  end Visit;

  -----------------------------------------------------------------------------

end Model.Namespace;
