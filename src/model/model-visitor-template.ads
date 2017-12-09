with Ada.Strings.Unbounded;

package Model.Visitor.Template is

  -----------------------------------------------------------------------------

  Not_Initialized : exception;

  type Object_T is new Visitor.Object_T with record
    Content : Ada.Strings.Unbounded.Unbounded_String :=
      Ada.Strings.Unbounded.Null_Unbounded_String;

    Root_Directory : access String := null;
  end record;

  type Reference_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  type Array_T is array (Positive range <>) of Class_T;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  ----------------------------------------------------------------------------

  procedure Set_Root_Directory
    (Self           : in out Object_T;
     Root_Directory : in     String);

  function Get_Root_Directory
    (Self : in Object_T)
    return String;

  ----------------------------------------------------------------------------

  overriding
  procedure Visit_Class
    (Self   : in out Object_T;
     Object : in     Model.Class_Def.Object_T'Class);

  overriding
  procedure Visit_Comment
    (Self   : in out Object_T;
     Object : in     Model.Comment.Object_T'Class);

  overriding
  procedure Visit_Dependency
    (Self   : in out Object_T;
     Object : in     Model.Dependency.Object_T'Class);

  overriding
  procedure Visit_Element
    (Self   : in out Object_T;
     Object : in     Model.Element.Object_T'Class);

  overriding
  procedure Visit_Field
    (Self   : in out Object_T;
     Object : in     Model.Field.Object_T'Class);

  overriding
  procedure Visit_Interface
    (Self   : in out Object_T;
     Object : in     Model.Interface_Def.Object_T'Class);

  overriding
  procedure Visit_Module
    (Self   : in out Object_T;
     Object : in     Model.Module.Object_T'Class);

  overriding
  procedure Visit_Namespace
    (Self   : in out Object_T;
     Object : in     Model.Namespace.Object_T'Class);

  overriding
  procedure Visit_Package
    (Self   : in out Object_T;
     Object : in     Model.Package_Def.Object_T'Class);

  overriding
  procedure Visit_Parameter
    (Self   : in out Object_T;
     Object : in     Model.Parameter.Object_T'Class);

  overriding
  procedure Visit_Project
    (Self   : in out Object_T;
     Object : in     Model.Project.Object_T'Class);

  overriding
  procedure Visit_Subprogram
    (Self   : in out Object_T;
     Object : in     Model.Subprogram.Object_T'Class);

  ----------------------------------------------------------------------------

  not overriding
  function To_String
    (Self : in Object_T)
    return String;

private

  function Get_Root_Directory
    (Self : in Object_T)
    return String
    is (Self.Root_Directory.all);

end Model.Visitor.Template;
