with Ada.Containers.Vectors;

limited with Model.Visitor;
with Model.Named_Element;
with Model.Package_Def;
with Model.Class_Def;
with Model.Subprogram;
with Reflection;

package Model.Project is

  subtype Parent_T is Named_Element.Object_T;

  type Object_T
    is new Parent_T with private;

  type Access_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  procedure Initialize
    (Self           : in out Object_T'Class;
     Name           : in     String;
     Kind           : in     String;
     Root_Directory : in     String;
     Parent         : access Object_T'Class := null);

  function Create
    (Name           : in String;
     Kind           : in String;
     Root_Directory : in String;
     Parent         : access Object_T'Class := null)
    return not null access Object_T'Class;

  not overriding
  function Get_Kind
    (Self : in Object_T)
    return String;

  not overriding
  function Get_Root_Directory
    (Self : in Object_T)
    return String;

  not overriding
  function Has_Parent
    (Self : in Object_T)
    return Boolean;

  not overriding
  function Get_Parent
    (Self : in Object_T)
    return not null access Object_T'Class;

  not overriding
  function Get_Subprojects
    (Self : in Object_T)
    return Vector_T;

  not overriding
  function Get_Subproject
    (Self : in Object_T;
     Name : in String)
    return not null access Object_T;

  not overriding
  procedure Add_Subproject
    (Self       : in out          Object_T;
     Subproject : not null access Object_T'Class);

  not overriding
  function Get_Elements
    (Self : in Object_T)
    return Named_Element.Vector_T;

  not overriding
  procedure Add_Package
    (Self   : in out          Object_T;
     Object : not null access Package_Def.Object_T);

  not overriding
  procedure Add_Class
    (Self   : in out          Object_T;
     Object : not null access Class_Def.Object_T);

  not overriding
  procedure Add_Subprogram
    (Self   : in out          Object_T;
     Object : not null access Subprogram.Object_T);

  overriding
  procedure Visit
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class);

  not overriding
  function To_Dbg_String
    (Self : in Object_T)
    return String;

private

  type Object_T
    is new Parent_T
    with record
      Kind           : access String := null;
      Root_Directory : access String := null;
      Parent         : Class_T       := null;
      Subprojects    : Vector_T      := Vectors.Empty_Vector;

      Elements : Named_Element.Vector_T :=
        Named_Element.Vectors.Empty_Vector;
    end record;

  not overriding
  procedure Add_Element
    (Self   : in out          Object_T;
     Object : not null access Named_Element.Object_T);

  function Get_Kind
    (Self : in Object_T)
    return String
    is
    (Self.Kind.all);

  function Get_Root_Directory
    (Self : in Object_T)
    return String
    is
    (Self.Root_Directory.all);

  function Has_Parent
    (Self : in Object_T)
    return Boolean
    is
    (Self.Parent /= null);

  function Get_Parent
    (Self : in Object_T)
    return not null access Object_T'Class
    is
    (Self.Parent);

  function Get_Subprojects
    (Self : in Object_T)
    return Vector_T
    is (Self.Subprojects);

  function Get_Elements
    (Self : in Object_T)
    return Named_Element.Vector_T
    is (Self.Elements);

  package Unit is new Reflection;

  function To_Dbg_String
    (Self : in Object_T)
    return String
    is (Unit.Name & " """ & Self.Get_Name & """" &
          " (" & Self.Get_Kind & ")");

end Model.Project;
