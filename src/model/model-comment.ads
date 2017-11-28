with Ada.Containers.Vectors;

with Model.Element;

package Model.Comment is

  subtype Parent_T is Model.Element.Object_T;

  type Object_T is new Parent_T with private;

  type Reference_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  type Array_T is array (Positive range <>) of
    not null access constant Object_T;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  procedure Initialize
    (Self : out Object_T'Class;
     Text : in String);

  function Create
    (Text : in String)
    return Class_T;

  function Get_Body
    (Self : in Object_T)
    return String;

private

  type Object_T is new Parent_T
    with record
      Comment_Body : access String := null;
    end record;

  function Get_Body
    (Self : in Object_T)
    return String
    is (Self.Comment_Body.all);

end Model.Comment;
