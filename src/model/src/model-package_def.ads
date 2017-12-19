with Ada.Containers.Vectors;

limited with Model.Namespace;
with Model.Named_Element;
with Model.Dependency;
with Model.Visitor;

package Model.Package_Def is

  -----------------------------------------------------------------------------
  --  types
  -----------------------------------------------------------------------------

  package Parent_Pkg renames Model.Named_Element;

  type Object_T is new Parent_Pkg.Object_T with private;

  type Access_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  -----------------------------------------------------------------------------
  --  constructors
  -----------------------------------------------------------------------------

  procedure Initialize
    (Self           : in out Object_T'Class;
     Name           : in     String;
     Parent_Package : access Object_T'Class := null;
     Visibility     : in     Named_Element.Visibility_T);

  function Create
    (Name           : in     String;
     Parent_Package : access Object_T'Class := null;
     Visibility     : in     Named_Element.Visibility_T)
    return not null access Object_T'Class;

  -----------------------------------------------------------------------------
  --  namespace
  -----------------------------------------------------------------------------

  not overriding
  function Get_Defined_Namespace
    (Self : in Object_T)
    return not null access Namespace.Object_T'Class;

  -----------------------------------------------------------------------------
  --  parent package
  -----------------------------------------------------------------------------

  not overriding
  function Has_Parent_Package
    (Self : in Object_T)
    return Boolean;

  not overriding
  function Get_Parent_Package
    (Self : in Object_T)
    return access Object_T'Class;

  overriding
  procedure Visit
    (Self   : in out Object_T;
     Object : in out Visitor.Object_T'Class);

  not overriding
  procedure Add_Specification_Dependency
    (Self   : in out          Object_T;
     Object : not null access Named_Element.Object_T'Class);

  not overriding
  procedure Add_Implementation_Dependency
    (Self   : in out          Object_T;
     Object : not null access Named_Element.Object_T'Class);

private

  type Object_T is new Parent_Pkg.Object_T
    with record
      Defined_Namespace : access Namespace.Object_T'Class := null;

      Parent_Package : access Package_Def.Object_T'Class := null;

      Specification_Dependencies : Dependency.Vector_T :=
        Dependency.Vectors.Empty_Vector;

      Implementation_Dependencies : Dependency.Vector_T :=
        Dependency.Vectors.Empty_Vector;
    end record;

  not overriding
  function Get_Defined_Namespace
    (Self : in Object_T)
    return not null access Namespace.Object_T'Class
    is (Self.Defined_Namespace);

  function Has_Parent_Package
    (Self : in Object_T)
    return Boolean
    is (Self.Parent_Package /= null);

  function Get_Parent_Package
    (Self : in Object_T)
    return access Object_T'Class
    is (Self.Parent_Package);

end Model.Package_Def;
