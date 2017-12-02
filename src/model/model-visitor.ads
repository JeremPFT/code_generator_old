with Ada.Containers.Vectors;

limited with Model.Class_Def;
limited with Model.Interface_Def;
limited with Model.Comment;
limited with Model.Element;
limited with Model.Field;
limited with Model.Package_Def;
limited with Model.Project;
limited with Model.Module;
limited with Model.Parameter;
limited with Model.Subprogram;

package Model.Visitor is

  -----------------------------------------------------------------------------

  type Object_T is abstract tagged null record;

  type Reference_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  type Array_T is array (Positive range <>) of Class_T;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  -----------------------------------------------------------------------------

  procedure Visit_Element
    (Self   : in out Object_T;
     Object : in     Model.Element.Object_T'Class)
    is abstract;

  procedure Visit_Project
    (Self   : in out Object_T;
     Object : in     Model.Project.Object_T'Class)
    is abstract;

  procedure Visit_Module
    (Self   : in out Object_T;
     Object : in     Model.Module.Object_T'Class)
    is abstract;

  procedure Visit_Package
    (Self   : in out Object_T;
     Object : in     Model.Package_Def.Object_T'Class)
    is abstract;

  procedure Visit_Comment
    (Self   : in out Object_T;
     Object : in     Model.Comment.Object_T'Class)
    is abstract;

  procedure Visit_Class
    (Self   : in out Object_T;
     Object : in     Model.Class_Def.Object_T'Class)
    is abstract;

  procedure Visit_Interface
    (Self   : in out Object_T;
     Object : in     Model.Interface_Def.Object_T'Class)
    is abstract;

  procedure Visit_Field
    (Self   : in out Object_T;
     Object : in     Model.Field.Object_T'Class)
    is abstract;

  procedure Visit_Subprogram
    (Self   : in out Object_T;
     Object : in     Model.Subprogram.Object_T'Class)
    is abstract;

  procedure Visit_Parameter
    (Self   : in out Object_T;
     Object : in     Model.Parameter.Object_T'Class)
    is abstract;

end Model.Visitor;
