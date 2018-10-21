with Ada.Containers.Vectors;
with Model.Named_Element;
with Model.Package_Def;
with Model.Operation;
with Model.Types.Class_Def;
with Model.Visitor;
limited with Model.Root_Project;

package Model.Project is

  package Parent_Pkg renames Model.Named_Element;

  type Object_T is new Parent_Pkg.Object_T with private;

  type Access_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  function Create
    (Name   : in     String;
     Kind   : in     String;
     Parent : access Root_Project.Object_T'Class := null)
    return not null access Object_T'Class;

  not overriding
  function Has_Parent
    (Self : in Object_T)
    return Boolean;

  not overriding
  function Get_Parent
    (Self : in Object_T)
    return not null access Root_Project.Object_T'Class;

  not overriding
  function Get_Kind
    (Self : in Object_T)
    return String;

  not overriding
  function Get_Elements
    (Self : in Object_T)
    return Named_Element.Vector_T;

  not overriding
  function Number_Of_Elements
    (Self : in Object_T)
    return Natural;

  not overriding
  function Get_Element
    (Self  : in Object_T;
     Index : in Natural)
    return not null access Named_Element.Object_T'Class;

  not overriding
  procedure Add_Package
    (Self   : in out          Object_T;
     Object : not null access Package_Def.Object_T'Class);

  not overriding
  procedure Add_Class
    (Self   : in out          Object_T;
     Object : not null access Types.Class_Def.Object_T'Class);

  not overriding
  procedure Add_Operation
    (Self   : in out          Object_T;
     Object : not null access Operation.Object_T'Class);

  overriding
  procedure Visit
    (Self   : in out Object_T;
     Object : in out Visitor.Object_T'Class);

  procedure Initialize
    (Self   : in out Object_T'Class;
     Name   : in     String;
     Kind   : in     String;
     Parent : access Root_Project.Object_T'Class := null);

private

  type Object_T is new Parent_Pkg.Object_T with record
    Parent   : access Root_Project.Object_T'Class := null;
    Kind     : access String                      := null;
    Elements : Named_Element.Vector_T             :=
      Named_Element.Vectors.Empty_Vector;
  end record;

  not overriding
  procedure Add_Element
    (Self   : in out          Object_T;
     Object : not null access Named_Element.Object_T'Class);

  not overriding
  function Get_Kind
    (Self : in Object_T)
    return String
    is
    (Self.Kind.all);

  not overriding
  function Has_Parent
    (Self : in Object_T)
    return Boolean
    is (Self.Parent /= null);

  not overriding
  function Get_Parent
    (Self : in Object_T)
    return not null access Root_Project.Object_T'Class
    is (Self.Parent);

  not overriding
  function Get_Elements
    (Self : in Object_T)
    return Named_Element.Vector_T
    is (Self.Elements);

  not overriding
  function Number_Of_Elements
    (Self : in Object_T)
    return Natural
    is (Natural (Self.Elements.Length));

  not overriding
  function Get_Element
    (Self  : in Object_T;
     Index : in Natural)
    return not null access Named_Element.Object_T'Class
    is (Self.Elements (Index));

end Model.Project;
