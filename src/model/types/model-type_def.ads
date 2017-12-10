with Ada.Containers.Vectors;

with Model.Named_Element;
with Model.Namespace;

package Model.Type_Def is

  package Parent_Pkg renames Model.Named_Element;

  type Object_T is abstract new Parent_Pkg.Object_T with private;

  type Reference_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  procedure Initialize
    (Self            : in out Object_T'Class;
     Name            : in     String;
     Owner_Namespace : access Namespace.Object_T'Class);

private

  type Object_T is abstract new Parent_Pkg.Object_T
    with null record;

end Model.Type_Def;
