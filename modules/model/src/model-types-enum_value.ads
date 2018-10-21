with Ada.Containers.Vectors;

with Model.Named_Element;
limited with Model.Types.Enum_Def;

package Model.Types.Enum_Value is

  package Parent_Pkg renames Model.Named_Element;

  type Object_T is new Parent_Pkg.Object_T with private;

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

  procedure Initialize
    (Self       : in out          Object_T'Class;
     Name       : in              String;
     Value      : in              Integer;
     Owner_Enum : not null access Enum_Def.Object_T'Class);

private

  type Object_T is new Named_Element.Object_T
    with record
      Owner_Enum : access Enum_Def.Object_T'Class;
      Value      : Natural;
    end record;

  function Get_Value
    (Self : in Object_T)
    return Integer
    is
    (Self.Value);

end Model.Types.Enum_Value;
