with Ada.Strings.Unbounded;

package Model.Visitor.Printer is

  -----------------------------------------------------------------------------

  type Object_T is new Visitor.Object_T with record
    Content        : Ada.Strings.Unbounded.Unbounded_String :=
      Ada.Strings.Unbounded.Null_Unbounded_String;
    Current_Indent : Natural                                := 0;
    Incr           : Natural                                := 2;
  end record;

  type Reference_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  type Array_T is array (Positive range <>) of Class_T;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Element
    (Self : in out Object_T;
     Object : in     Model.Element.Object_T'Class);

  overriding
  procedure Visit_Project
    (Self   : in out Object_T;
     Object : in     Model.Project.Object_T'Class);

  overriding
  procedure Visit_Package
    (Self   : in out Object_T;
     Object : in     Model.Package_Def.Object_T'Class);

  overriding
  procedure Visit_Comment
    (Self   : in out Object_T;
     Object : in     Model.Comment.Object_T'Class);

  overriding
  procedure Visit_Class
    (Self   : in out Object_T;
     Object : in     Model.Class_Def.Object_T'Class);

  overriding
  procedure Visit_Interface
    (Self   : in out Object_T;
     Object : in     Model.Interface_Def.Object_T'Class);

  overriding
  procedure Visit_Field
    (Self   : in out Object_T;
     Object : in     Model.Field.Object_T'Class);

  overriding
  procedure Visit_Subprogram
    (Self   : in out Object_T;
     Object : in     Model.Subprogram.Object_T'Class);

  overriding
  procedure Visit_Parameter
    (Self   : in out Object_T;
     Object : in     Model.Parameter.Object_T'Class);

  not overriding
  function To_String
    (Self : in Object_T)
    return String;

private

  not overriding
  procedure Add
    (Self : in out Object_T;
     Text : in     String);

  not overriding
  procedure Indent
    (Self : in out Object_T);

  not overriding
  procedure Incr_Indent
    (Self : in out Object_T);

  not overriding
  procedure Decr_Indent
    (Self : in out Object_T);

end Model.Visitor.Printer;
