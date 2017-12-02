with Ada.Containers.Vectors;

with Model.Visitor;
with Model.Named_Element;

package Model.Parameter is

  package Parent_Pkg renames Model.Named_Element;

  type Object_T is abstract new Parent_Pkg.Object_T with private;

  type Reference_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  type Param_Mode_T is
    (P_Mode_In,
     P_Mode_Out,
     P_Mode_In_Out,
     P_Mode_Access,
     P_Mode_Access_Constant,
     P_Mode_Not_Null_Access,
     P_Mode_Not_Null_Access_Constant);

  type Mode_Str_T is
    array (Param_Mode_T) of access String;

  function "+"(Text : in String)
              return access String
    is
    (new String'(Text));

  Mode_Str : constant Mode_Str_T :=
    (
     P_Mode_In                       => +"in",
     P_Mode_Out                      => +"out",
     P_Mode_In_Out                   => +"in out",
     P_Mode_Access                   => +"access",
     P_Mode_Access_Constant          => +"access constant",
     P_Mode_Not_Null_Access          => +"not null access",
     P_Mode_Not_Null_Access_Constant => +"not null access constant"
    );

  procedure Initialize
    (Self          : in out Object_T'Class;
     Name          : in     String;
     Of_Type       : in     String;
     Default_Value : in     String       := "";
     Mode          : in     Param_Mode_T := P_Mode_In);

  function Create
    (Name          : in String;
     Of_Type       : in String;
     Default_Value : in String       := "";
     Mode          : in Param_Mode_T := P_Mode_In)
    return not null access Object_T'Class;

  --  not overriding
  --  procedure Set_Type
  --    (Self  : in out Object_T;
  --     Value : in     String);

  not overriding
  function Get_Type
    (Self : in Object_T)
    return String;

  --  not overriding
  --  procedure Set_Default_Value
  --    (Self  : in out Object_T;
  --     Value : in     String);

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
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class);

private

  type Object_T is
    new Named_Element.Object_T
    with record
      Of_Type       : access String := null;
      Default_Value : access String := null;
      Mode          : Param_Mode_T  := P_Mode_In;
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
