with Ada.Containers.Vectors;

limited with Model.Package_Def;
with Model.Named_Element;

package Model.Type_Def is

  subtype Parent_T is Named_Element.Object_T;

  type Object_T
    (Owner_Package : access Package_Def.Object_T'Class)
    is
    abstract new Parent_T with private;

  type Reference_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  procedure Initialize
    (Self : in out Object_T'Class;
     Name : in     String);

private

  type Object_T
    (Owner_Package : access Package_Def.Object_T'Class)
    is
    abstract new Named_Element.Object_T
    with null record;

end Model.Type_Def;
