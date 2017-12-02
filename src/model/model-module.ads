with Ada.Containers.Vectors;
with Model.Project;
with Model.Visitor;

package Model.Module is

  subtype Parent_T is Model.Project.Object_T;

  type Object_T
    is new Parent_T with private;

  type Access_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  procedure Initialize
    (Self   : in out Object_T'Class;
     Name   : in     String;
     Kind   : in     String;
     Parent : access Project.Object_T'Class := null);

  function Create
    (Name   : in String;
     Kind   : in String;
     Parent : access Project.Object_T'Class := null)
    return not null access Object_T'Class;

  not overriding
  function Has_Parent
    (Self : in Object_T)
    return Boolean;

  not overriding
  function Get_Parent
    (Self : in Object_T)
    return not null access Project.Object_T'Class;

  overriding
  procedure Visit
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class);

private

  type Object_T
    is new Parent_T
    with record
      Parent : access Project.Object_T'Class := null;
    end record;

  function Has_Parent
    (Self : in Object_T)
    return Boolean
    is
    (Self.Parent /= null);

  function Get_Parent
    (Self : in Object_T)
    return not null access Project.Object_T'Class
    is
    (Self.Parent);

end Model.Module;
