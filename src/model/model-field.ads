with Ada.Containers.Vectors;

with Model.Visitor;
with Model.Named_Element;
limited with Model.Class_Def;

package Model.Field is

  type Object_T
    (Owner_Class : not null access Class_Def.Object_T'Class)
    is
    new Named_Element.Object_T
    with private;

  type Reference_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  function Create
    (Owner_Class   : not null access Class_Def.Object_T'Class;
     Name          : in              String;
     Of_Type       : in              String;
     Default_Value : in              String := "")
    return not null access Object_T'Class;

  not overriding
  function Get_Type
    (Self : in Object_T)
    return String;

  not overriding
  function Has_Default_Value
    (Self : in Object_T)
    return Boolean;

  not overriding
  function Get_Default_Value
    (Self : in Object_T)
    return String;

  overriding
  function To_String
    (Self : in Object_T)
    return String;

  overriding
  procedure Visit
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class);

private

  type Object_T
    (Owner_Class : not null access Class_Def.Object_T'Class)
    is
    new Named_Element.Object_T
    with record
      Of_Type       : access String := null;
      Default_Value : access String := null;
    end record;

  function Get_Type
    (Self : in Object_T)
    return String
    is
    (Self.Of_Type.all);

  function Get_Default_Value
    (Self : in Object_T)
    return String
    is
    (Self.Default_Value.all);

  function Has_Default_Value
    (Self : in Object_T)
    return Boolean
    is
    (Self.Default_Value /= null and then
       Self.Default_Value.all /= "");

end Model.Field;
