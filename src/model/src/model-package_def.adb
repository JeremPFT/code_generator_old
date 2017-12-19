with Ada.Text_IO;
with Ada.Exceptions;

with Model.Namespace;

package body Model.Package_Def is

  -----------------------------------------------------------------------------

  procedure Initialize
    (Self           : in out Object_T'Class;
     Name           : in     String;
     Parent_Package : access Object_T'Class := null;
     Visibility     : in     Named_Element.Visibility_T)
  is
    Owner_Namespace : constant access Namespace.Object_T'Class :=
      (if Parent_Package = null
       then null
       else Parent_Package.Get_Defined_Namespace);

    Defined_Namespace : constant access Namespace.Object_T :=
      Namespace.Create (Name            => Name,
                        Owner_Namespace => Owner_Namespace,
                        Visibility      => Visibility);
  begin
    Parent_Pkg.Initialize
      (Self            => Self,
       Name            => Name,
       Owner_Namespace => Owner_Namespace,
       Visibility      => Visibility);

    Self.Parent_Package    := Parent_Package;
    Self.Defined_Namespace := Defined_Namespace;
  end Initialize;

  -----------------------------------------------------------------------------

  function Create
    (Name           : in     String;
     Parent_Package : access Object_T'Class := null;
     Visibility     : in     Named_Element.Visibility_T)
    return not null access Object_T'Class
  is
    Result : constant access Object_T := new Object_T;

  begin
    Result.Initialize (Name           => Name,
                       Parent_Package => Parent_Package,
                       Visibility     => Visibility);

    return Result;

  exception
    when Error : others =>
      Ada.Text_IO.Put_Line
        (Ada.Exceptions.Exception_Information (Error));
      raise;
  end Create;

  -----------------------------------------------------------------------------

  not overriding
  procedure Add_Specification_Dependency
    (Self   : in out          Object_T;
     Object : not null access Named_Element.Object_T'Class)
  is
    Obj_Dependency : constant access Dependency.Object_T'Class :=
      Dependency.Create (Client => Self'Access, Provider => Object);
  begin
    Self.Specification_Dependencies.Append (Obj_Dependency);
  end Add_Specification_Dependency;

  not overriding
  procedure Add_Implementation_Dependency
    (Self   : in out          Object_T;
     Object : not null access Named_Element.Object_T'Class)
  is
    Obj_Dependency : constant access Dependency.Object_T'Class :=
      Dependency.Create (Client => Self'Access, Provider => Object);
  begin
    Self.Implementation_Dependencies.Append (Obj_Dependency);
  end Add_Implementation_Dependency;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit
    (Self   : in out Object_T;
     Object : in out Visitor.Object_T'Class)
  is
  begin
    Object.Visit_Package (Self);
  end Visit;

  -----------------------------------------------------------------------------

end Model.Package_Def;
