with Ada.Containers.Vectors;

with Model.Visitor;
with Model.Named_Element;
with Model.Subprogram;
limited with Model.Class_Def;
with Reflection;

package Model.Package_Def is

  subtype Parent_T is Named_Element.Object_T;

  type Object_T is new Parent_T with private;

  type Access_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  procedure Initialize
    (Self   : in out Object_T'Class;
     Name   : in     String;
     Parent : access Object_T'Class := null);

  function Create
    (Name   : in     String;
     Parent : access Object_T'Class := null)
    return not null access Object_T'Class;

  not overriding
  function Has_Parent
    (Self : in Object_T)
    return Boolean;

  not overriding
  function Get_Parent
    (Self : in Object_T)
    return access Object_T'Class;

  not overriding
  procedure Add_Public_Class
    (Self   : in out          Object_T;
     Object : not null access Class_Def.Object_T'Class);

  not overriding
  procedure Add_Public_Subprogram
    (Self   : in out          Object_T;
     Object : not null access Subprogram.Object_T'Class);

  not overriding
  procedure Add_Private_Subprogram
    (Self   : in out          Object_T;
     Object : not null access Subprogram.Object_T'Class);

  not overriding
  procedure Add_Child
    (Self   : in out          Object_T;
     Object : not null access Object_T'Class);

  not overriding
  function Get_Children
    (Self : in Object_T)
    return Vector_T;

  not overriding
  function Get_Public_Elements
    (Self : in Object_T)
    return Named_Element.Vector_T;

  not overriding
  function Get_Private_Elements
    (Self : in Object_T)
    return Named_Element.Vector_T;

  overriding
  procedure Visit
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class);

  not overriding
  function To_Dbg_String
    (Self : in Object_T)
    return String;

private

  type Object_T is
    new Named_Element.Object_T
    with record
      Parent : access Package_Def.Object_T'Class := null;

      Children : Package_Def.Vector_T :=
        Package_Def.Vectors.Empty_Vector;

      Public_Elements : Named_Element.Vector_T :=
        Named_Element.Vectors.Empty_Vector;

      Private_Elements : Named_Element.Vector_T :=
        Named_Element.Vectors.Empty_Vector;

      Body_Local_Decl : Named_Element.Vector_T :=
        Named_Element.Vectors.Empty_Vector;

      Body_Public_Def : Named_Element.Vector_T :=
        Named_Element.Vectors.Empty_Vector;

      Body_Private_Def : Named_Element.Vector_T :=
        Named_Element.Vectors.Empty_Vector;

      Body_Local_Def : Named_Element.Vector_T :=
        Named_Element.Vectors.Empty_Vector;
    end record;

  function Has_Parent
    (Self : in Object_T)
    return Boolean
    is (Self.Parent /= null);

  function Get_Parent
    (Self : in Object_T)
    return access Object_T'Class
    is (Self.Parent);

  function Get_Public_Elements
    (Self : in Object_T)
    return Named_Element.Vector_T
    is (Self.Public_Elements);

  function Get_Private_Elements
    (Self : in Object_T)
    return Named_Element.Vector_T
    is (Self.Private_Elements);

  function Get_Children
    (Self : in Object_T)
    return Vector_T
    is (Self.Children);

  package Unit is new Reflection;

  function To_Dbg_String
    (Self : in Object_T)
    return String
    is (Unit.Name & " """ &
          (if Self.Has_Parent then
             Self.Get_Parent.Get_Name & "."
           else "") &
          Self.Get_Name & """");

end Model.Package_Def;
