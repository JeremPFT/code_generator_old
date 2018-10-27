with Ada.Containers.Vectors;

with Model.Element;

package Model.Comment is

  pragma Assertion_Policy ( Check );
  --  pragma Assertion_Policy ( Ignore );

  -----------------------------------------------------------------------------
  --  types
  -----------------------------------------------------------------------------

  package Parent_Pkg renames Model.Element;

  type Object_T is new Parent_Pkg.Object_T with private;

  type Access_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  type Array_T is array (Positive range <>) of
    not null access constant Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  function Create
    (Text : in String)
    return Class_T;

  not overriding
  function Get_Body
    (Self : in Object_T)
    return String;

  overriding
  function Is_Equivalent
    (Self, To : in Object_T)
    return Boolean;

  function Is_Pre_state
    (Self : in out Object_T'Class)
    return Boolean;

  function Is_Post_State
    (Self : in out Object_T'Class;
     Text : in     String)
    return Boolean;

  procedure Initialize
    (Self : in out Object_T'Class;
     Text : in     String);
  pragma Pre ( Self.Is_Pre_State );
  pragma Post ( False );
  --  pragma Post ( Self.Is_Post_State ( Text ) );

private

  type Object_T is new Parent_Pkg.Object_T
    with record
      Comment_Body : access String := null;
    end record;

  function Is_Pre_state
    (Self : in out Object_T'Class)
    return Boolean
  is ( Self.Comment_Body = null );

  function Is_Post_State
    (Self : in out Object_T'Class;
     Text : in     String)
    return Boolean
  is ( Self.Get_Body = Text );
  --  is ( Self.Get_Body = Text );

  not overriding
  function Get_Body
    (Self : in Object_T)
    return String
    is (if Self.Comment_Body = null then "" else Self.Comment_Body.all);

end Model.Comment;
