with Ada.Strings.Unbounded;
with Ada.Containers.Vectors;

with String_Utils;
with String_Vectors;
with Model.Visitor;
with Model.Types.Class_Def;
with Model.Package_Def;
with Model.Element;
with Model.Comment;
with Model.Dependency;
with Model.Field;
with Model.Operation;
with Model.Namespace;
with Model.Parameter;
with Model.Project;
with Model.Root_Project;
with Model.Types.Interface_Def;

package Model_Visitor is

  -----------------------------------------------------------------------------

  Not_Initialized : exception;

  type Object_T is new Model.Visitor.Object_T with record
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
     Object : in out Model.Types.Class_Def.Object_T'Class);

  overriding
  procedure Visit_Comment
    (Self   : in out Object_T;
     Object : in out Model.Comment.Object_T'Class);

  overriding
  procedure Visit_Dependency
    (Self   : in out Object_T;
     Object : in out Model.Dependency.Object_T'Class);

  overriding
  procedure Visit_Element
    (Self   : in out Object_T;
     Object : in out Model.Element.Object_T'Class);

  overriding
  procedure Visit_Field
    (Self   : in out Object_T;
     Object : in out Model.Field.Object_T'Class);

  overriding
  procedure Visit_Interface
    (Self   : in out Object_T;
     Object : in out Model.Types.Interface_Def.Object_T'Class);

  overriding
  procedure Visit_Namespace
    (Self   : in out Object_T;
     Object : in out Model.Namespace.Object_T'Class);

  overriding
  procedure Visit_Operation
    (Self   : in out Object_T;
     Object : in out Model.Operation.Object_T'Class);

  overriding
  procedure Visit_Package
    (Self   : in out Object_T;
     Object : in out Model.Package_Def.Object_T'Class);

  overriding
  procedure Visit_Parameter
    (Self   : in out Object_T;
     Object : in out Model.Parameter.Object_T'Class);

  overriding
  procedure Visit_Project
    (Self   : in out Object_T;
     Object : in out Model.Project.Object_T'Class);

  overriding
  procedure Visit_Root_Project
    (Self   : in out Object_T;
     Object : in out Model.Root_Project.Object_T'Class);

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

  Ads_Public_Types : String_Vectors.Vector := String_Vectors.Empty_Vector;

  Ads_Public_Subprograms : String_Vectors.Vector :=
    String_Vectors.Empty_Vector;

  Ads_Private_Class : String_Vectors.Vector := String_Vectors.Empty_Vector;

  Ads_Fields : String_Vectors.Vector := String_Vectors.Empty_Vector;

  Field_Image : String_Utils.String_Access := null;

end Model_Visitor;
