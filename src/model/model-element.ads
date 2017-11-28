limited with Model.Visitor;
with Ada.Containers.Vectors;

package Model.Element is

  -----------------------------------------------------------------------------

  type Object_T is abstract tagged private;

  type Reference_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  type Array_T is array (Positive range <>) of Class_T;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  -----------------------------------------------------------------------------

  procedure Initialize
    (Self : in out Object_T'Class);

  -----------------------------------------------------------------------------

  not overriding
  procedure Add_Comment
    (Self : in out Object_T;
     Text : in     String);

  -----------------------------------------------------------------------------

  not overriding
  function Number_Of_Comments
    (Self : in Object_T)
    return Natural;

  -----------------------------------------------------------------------------

  not overriding
  function Get_Comment
    (Self  : in Object_T;
     Index : in Positive)
    return String;

  -----------------------------------------------------------------------------

  procedure Visit
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class);

  -----------------------------------------------------------------------------

  not overriding
  procedure Clear_Memory
    (Self : in out Object_T);

  -----------------------------------------------------------------------------

  procedure Free
    (Self : in out Class_T);

  -----------------------------------------------------------------------------

private

  type Object_T is
    abstract
    tagged record
      Owned_Comments : Vector_T :=
        Vectors.Empty_Vector;
    end record;

  -----------------------------------------------------------------------------

end Model.Element;
