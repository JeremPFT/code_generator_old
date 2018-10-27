with Ada.Containers.Vectors;

with Model.Visitor;
with Model.Named_Element;
limited with Model.Namespace;

package Model.Parameter is

  package Parent_Pkg renames Model.Named_Element;

  type Object_T is abstract new Parent_Pkg.Object_T with private;

  type Access_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  type Param_Mode_T is
    (Mode_In,
     Mode_Out,
     Mode_In_Out,
     Mode_Access,
     Mode_Access_Constant,
     Mode_Not_Null_Access,
     Mode_Not_Null_Access_Constant);

  type Mode_Str_T is
    array (Param_Mode_T) of access String;

  function "+"(Text : in String)
              return access String
    is
    (new String'(Text));

  Mode_Str : constant Mode_Str_T :=
    (
     Mode_In                       => +"in",
     Mode_Out                      => +"out",
     Mode_In_Out                   => +"in out",
     Mode_Access                   => +"access",
     Mode_Access_Constant          => +"access constant",
     Mode_Not_Null_Access          => +"not null access",
     Mode_Not_Null_Access_Constant => +"not null access constant"
    );

  function Create
    (Name            : in     String;
     Owner_Namespace : access Namespace.Object_T'Class;
     Of_Type         : in     String;
     Default_Value   : in     String       := "";
     Mode            : in     Param_Mode_T := Mode_In)
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

  not overriding
  function Get_Mode
    (Self : in Object_T)
    return Param_Mode_T;

  overriding
  procedure Visit
    (Self   : in out Object_T;
     Object : in out Visitor.Object_T'Class);

  procedure Initialize
    (Self            : in out Object_T'Class;
     Name            : in     String;
     Owner_Namespace : access Namespace.Object_T'Class;
     Of_Type         : in     String;
     Default_Value   : in     String       := "";
     Mode            : in     Param_Mode_T := Mode_In);

private

  type Object_T is
    new Named_Element.Object_T
    with record
      Of_Type       : access String := null;
      Default_Value : access String := null;
      Mode          : Param_Mode_T  := Mode_In;
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

  function Get_Mode
    (Self : in Object_T)
    return Param_Mode_T
    is
    (Self.Mode);

end Model.Parameter;
