with Ada.Containers.Vectors;

with Model.Visitor;
with Model.Named_Element;
limited with Model.Types.Class_Def;

package Model.Field is

  No_Default_Value : exception;

  package Parent_Pkg renames Model.Named_Element;

  type Object_T is new Parent_Pkg.Object_T with private;

  type Reference_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  function Create
    (Name          : in              String;
     Owner_Class   : not null access Class_Def.Object_T'Class;
     Of_Type       : in              String;
     Default_Value : in              String := "";
     Visibility    : in              Named_Element.Visibility_T)
    return not null access Object_T'Class;

  procedure Initialize
    (Self          : in out          Object_T'Class;
     Name          : in              String;
     Owner_Class   : not null access Class_Def.Object_T'Class;
     Of_Type       : in              String;
     Default_Value : in              String := "";
     Visibility    : in              Named_Element.Visibility_T);

  not overriding
  function Get_Owner_Class
    (Self : in Object_T)
    return not null access Class_Def.Object_T'Class;

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
  procedure Visit
    (Self   : in out Object_T;
     Object : in out Visitor.Object_T'Class);

private

  type Object_T is new Named_Element.Object_T
    with record
      Owner_Class   : access Class_Def.Object_T'Class := null;
      Of_Type       : access String                   := null;
      Default_Value : access String                   := null;
    end record;

  not overriding
  function Get_Owner_Class
    (Self : in Object_T)
    return not null access Class_Def.Object_T'Class
    is (Self.Owner_Class);

  not overriding
  function Get_Type
    (Self : in Object_T)
    return String
    is (Self.Of_Type.all);

  not overriding
  function Has_Default_Value
    (Self : in Object_T)
    return Boolean
    is (Self.Default_Value /= null and then
          Self.Default_Value.all /= "");

end Model.Field;
