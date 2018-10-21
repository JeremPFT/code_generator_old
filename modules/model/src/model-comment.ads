with Ada.Containers.Vectors;

with Model.Element;

package Model.Comment is

  package Parent_Pkg renames Model.Element;

  type Object_T is new Parent_Pkg.Object_T with private;

  type Reference_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  type Array_T is array (Positive range <>) of
    not null access constant Object_T;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  function Create
    (Text : in String)
    return Class_T;

  procedure Initialize
    (Self : in out Object_T'Class;
     Text : in String);

  not overriding
  function Get_Body
    (Self : in Object_T)
    return String;

  overriding
  function Is_Equivalent
    (Self, To : in Object_T)
    return Boolean;

private

  type Object_T is new Parent_Pkg.Object_T
    with record
      Comment_Body : access String := null;
    end record;

  not overriding
  function Get_Body
    (Self : in Object_T)
    return String
    is (if Self.Comment_Body = null then "" else Self.Comment_Body.all);

end Model.Comment;
