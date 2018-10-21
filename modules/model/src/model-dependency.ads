with Ada.Containers.Vectors;

limited with Model.Named_Element;
with Model.Element;
with Model.Visitor;

package Model.Dependency is

  -----------------------------------------------------------------------------
  --  types
  -----------------------------------------------------------------------------

  package Parent_Pkg renames Model.Element;

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

  function Create
    (Client   : not null access Named_Element.Object_T'Class;
     Provider : not null access Named_Element.Object_T'Class)
    return not null access Object_T'Class;

  -----------------------------------------------------------------------------

  function Get_Client
    (Self : in Object_T)
    return not null access Named_Element.Object_T'Class;

  function Get_Provider
    (Self : in Object_T)
    return not null access Named_Element.Object_T'Class;

  procedure Initialize
    (Self     : in out Object_T'Class;
     Client   : not null access Named_Element.Object_T'Class;
     Provider : not null access Named_Element.Object_T'Class);

private

  type Object_T is new Parent_Pkg.Object_T
    with record
      Client,
        Provider : access Named_Element.Object_T'Class;
    end record;

  -----------------------------------------------------------------------------
  --  visitor
  -----------------------------------------------------------------------------

  overriding
  procedure Visit
    (Self   : in out Object_T;
     Object : in out Visitor.Object_T'Class);

  function Get_Client
    (Self : in Object_T)
    return not null access Named_Element.Object_T'Class
    is (Self.Client);

  function Get_Provider
    (Self : in Object_T)
    return not null access Named_Element.Object_T'Class
    is (Self.Provider);

end Model.Dependency;
