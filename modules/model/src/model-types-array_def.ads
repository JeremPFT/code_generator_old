with Ada.Containers.Vectors;

limited with Model.Namespace;
limited with Model.Visitor;
with Model.Named_Element;
with Model.Types.Type_Def;

package Model.Types.Array_Def is

  package Parent_Pkg renames Type_Def;

  type Object_T is new Parent_Pkg.Object_T with private;

  type Reference_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  function Create
    (Name            : in     String;
     Owner_Namespace : access Namespace.Object_T'Class;
     Contained_Type  : in     String;
     Index_Type      : in     String;
     Defined_Range   : in     String;
     Visibility      : in     Named_Element.Visibility_T)
    return not null access Object_T'Class;

  not overriding
  function Get_Contained_Type
    (Self : in Object_T)
    return String;

  not overriding
  function Get_Index_Type
    (Self : in Object_T)
    return String;

  not overriding
  function Get_Defined_Range
    (Self : in Object_T)
    return String;

  overriding
  procedure Visit
    (Self   : in out Object_T;
     Object : in out Visitor.Object_T'Class);

  procedure Initialize
    (Self            : in out Object_T'Class;
     Name            : in     String;
     Owner_Namespace : access Namespace.Object_T'Class;
     Contained_Type  : in     String;
     Index_Type      : in     String;
     Defined_Range   : in     String;
     Visibility      : in     Named_Element.Visibility_T);

private

  type Object_T is new Parent_Pkg.Object_T
    with record
      Contained_Type : access String := null;
      Index_Type     : access String := null;
      Defined_Range  : access String := null;
    end record;

  function Get_Contained_Type
    (Self : in Object_T)
    return String
    is
    (Self.Contained_Type.all);

  function Get_Index_Type
    (Self : in Object_T)
    return String
    is
    (Self.Index_Type.all);

  function Get_Defined_Range
    (Self : in Object_T)
    return String
    is
    (Self.Defined_Range.all);

end Model.Types.Array_Def;
