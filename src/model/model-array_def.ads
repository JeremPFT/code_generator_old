with Ada.Containers.Vectors;

limited with Model.Package_Def;
limited with Model.Visitor;
with Model.Type_Def;

package Model.Array_Def is

  subtype Parent_T is Type_Def.Object_T;

  type Object_T
    --  (Owner_Package : access Package_Def.Object_T'Class)
    is
    new Parent_T with private;

  type Reference_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  procedure Initialize
    (Self           : in out Object_T'Class;
     Name           : in     String;
     Contained_Type : in     String;
     Index_Type     : in     String;
     Defined_Range  : in     String);

  function Create
    (Owner_Package  : access Package_Def.Object_T'Class;
     Name           : in     String;
     Contained_Type : in     String;
     Index_Type     : in     String;
     Defined_Range  : in     String)
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
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class);

private

  type Object_T
    --  (Owner_Package : access Package_Def.Object_T'Class)
    is
    new Type_Def.Object_T
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

end Model.Array_Def;
