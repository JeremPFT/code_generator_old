with Ada.Containers.Vectors;

with Model.Named_Element;
limited with Model.Enum_Def;

package Model.Enum_Value is

  type Object_T
    (Owner_Enum : access Enum_Def.Object_T'Class)
    is
    new Named_Element.Object_T with private;

  type Reference_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  function Create
    (Owner_Enum : not null access Enum_Def.Object_T'Class;
     Name       : in String;
     Value      : in Integer)
    return not null access Object_T'Class;

  not overriding
  function Get_Value
    (Self : in Object_T)
    return Integer;

private

  type Object_T
    (Owner_Enum : access Enum_Def.Object_T'Class)
    is
    new Named_Element.Object_T
    with record
      Value : Natural;
    end record;

  function Get_Value
    (Self : in Object_T)
    return Integer
    is
    (Self.Value);

end Model.Enum_Value;
