with Ada.Containers.Vectors;

with Model.Visitor;
limited with Model.Package_Def;
with Model.Named_Element;
with Model.Parameter;

package Model.Subprogram is

  type Object_T
    (Owner_Package  : access Package_Def.Object_T'Class;
     Parent_Package : access Package_Def.Object_T'Class)
    is
    new Named_Element.Object_T with private;

  type Reference_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  function Create
    (Owner_Package  : access Package_Def.Object_T'Class := null;
     Parent_Package : access Package_Def.Object_T'Class := null;
     Name           : in     String;
     Of_Type        : in     String                     := "";
     Is_Abstract    : in     Boolean                    := False;
     Is_Separate    : in     Boolean                    := False)
    return not null access Object_T'Class;

  not overriding
  function Get_Type
    (Self : in Object_T)
    return String;

  not overriding
  function Has_Return
    (Self : in Object_T)
    return Boolean;

  not overriding
  function Get_Number_Of_Parameters
    (Self : in Object_T)
    return Natural;

  not overriding
  procedure Add_Parameter
    (Self          : in out          Object_T;
     Obj_Parameter : not null access Parameter.Object_T'Class);

  not overriding
  function Get_Parameter
    (Self : in Object_T;
     Index : in Positive)
    return not null access Parameter.Object_T'Class;

  overriding
  procedure Visit
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class);

private

  type Object_T (Owner_Package  : access Package_Def.Object_T'Class;
                 Parent_Package : access Package_Def.Object_T'Class)
    is new Named_Element.Object_T
    with record
      Of_Type     : access String      := null;
      Is_Abstract : Boolean            := False;
      Is_Separate : Boolean            := False;
      Parameters  : Parameter.Vector_T := Parameter.Vectors.Empty_Vector;

      --  Declarations : String_Vector := String_Vectors.Empty_Vector;
      --  Instructions : String_Vector := String_Vectors.Empty_Vector;
    end record;

  function Get_Type
    (Self : in Object_T)
    return String
    is
    (Self.Of_Type.all);

  function Has_Return
    (Self : in Object_T)
    return Boolean
    is
    (Self.Of_Type.all /= "");

  function Get_Number_Of_Parameters
    (Self : in Object_T)
    return Natural
    is
    (Natural (Self.Parameters.Length));

  function Get_Parameter
    (Self : in Object_T;
     Index : in Positive)
    return not null access Parameter.Object_T'Class
    is
    (Self.Parameters (Index));

end Model.Subprogram;
