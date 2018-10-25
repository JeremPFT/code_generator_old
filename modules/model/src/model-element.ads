-- defines the root class.
-- an element has 
-- * comments, which can be added, counted, getted;
-- * an equivalence operation;
-- * an Initialize procedure (to be called in the constructors).

limited with Model.Visitor;
with Ada.Containers.Vectors;

package Model.Element is

  -----------------------------------------------------------------------------

  type Object_T is abstract tagged private;

  type Access_T is access all Object_T;

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

  not overriding
  function Is_Equivalent
    (Self, To : in Object_T)
    return Boolean;

  -----------------------------------------------------------------------------

  procedure Visit
    (Self   : in out Object_T;
     Object : in out Visitor.Object_T'Class);

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
