with Ada.Containers.Vectors;

limited with Model.Types.Class_Def;
limited with Model.Package_Def;
with Model.Named_Element;
with Model.Parameter;
with Model.Visitor;

package Model.Operation is

  -----------------------------------------------------------------------------
  --  types
  -----------------------------------------------------------------------------

  package Parent_Pkg renames Model.Named_Element;

  type Object_T is new Parent_Pkg.Object_T with private;

  type Reference_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  type Property_Enum_T is
    (Abstract_Property, Static_Property, Separate_Property);

  type Property_T is array (Property_Enum_T) of Boolean;

  Abstract_Prop : constant Property_T := (Abstract_Property => True,
                                          others            => False);
  Static_Prop   : constant Property_T := (Static_Property   => True,
                                          others            => False);
  Separate_Prop : constant Property_T := (Separate_Property => True,
                                          others            => False);

  None : constant Property_T := (others => False);

  -----------------------------------------------------------------------------
  --  constructors
  -----------------------------------------------------------------------------

  function Create
    (Name           : in     String;
     Of_Type        : in     String                     := "";
     Parent_Package : access Package_Def.Object_T'Class := null;
     In_Package     : access Package_Def.Object_T'Class := null;
     In_Class       : access Class_Def.Object_T'Class   := null;
     Properties     : in     Property_T                 := None;
     Visibility     : in     Named_Element.Visibility_T)
    return not null access Object_T'Class
  with
    Pre =>

      Only_One_Namespace (Parent_Package => Parent_Package,
                          In_Package     => In_Package,
                          In_Class       => In_Class);

  function Create_As_Unit
    (Name           : in     String;
     Parent_Package : access Package_Def.Object_T'Class := null;
     Of_Type        : in     String                     := "";
     Properties     : in     Property_T                 := None;
     Visibility     : in     Named_Element.Visibility_T)
    return not null access Object_T'Class;

  function Create_In_Package
    (Name       : in     String;
     In_Package : access Package_Def.Object_T'Class := null;
     Of_Type    : in     String                     := "";
     Properties : in     Property_T                 := None;
     Visibility : in     Named_Element.Visibility_T)
    return not null access Object_T'Class;

  function Create_In_Class
    (Name       : in     String;
     In_Class   : access Class_Def.Object_T'Class := null;
     Of_Type    : in     String                   := "";
     Properties : in     Property_T               := None;
     Visibility : in     Named_Element.Visibility_T)
    return not null access Object_T'Class;

  -----------------------------------------------------------------------------
  --  type
  -----------------------------------------------------------------------------

  not overriding
  function Has_Return
    (Self : in Object_T)
    return Boolean;

  not overriding
  function Get_Type
    (Self : in Object_T)
    return String;

  -----------------------------------------------------------------------------
  --  parameters
  -----------------------------------------------------------------------------

  not overriding
  function Number_Of_Parameters
    (Self : in Object_T)
    return Natural;

  not overriding
  procedure Add_Parameter
    (Self          : in out          Object_T;
     Obj_Parameter : not null access Parameter.Object_T'Class);

  not overriding
  function Get_Parameter
    (Self  : in Object_T;
     Index : in Positive)
    return not null access Parameter.Object_T'Class;

  -----------------------------------------------------------------------------
  --  properties
  -----------------------------------------------------------------------------

  not overriding
  function Is_Abstract
    (Self : in Object_T)
    return Boolean;

  not overriding
  function Is_Static
    (Self : in Object_T)
    return Boolean;

  not overriding
  function Is_Separate
    (Self : in Object_T)
    return Boolean;

  -----------------------------------------------------------------------------
  --  contracts
  -----------------------------------------------------------------------------

  function Only_One_Namespace
    (Parent_Package : access Package_Def.Object_T'Class := null;
     In_Package     : access Package_Def.Object_T'Class := null;
     In_Class       : access Class_Def.Object_T'Class   := null)
    return Boolean;
  --  return true if
  --   only one of the parameters is no null
  --  or
  --   each one is null

  -----------------------------------------------------------------------------
  --  visitor
  -----------------------------------------------------------------------------

  overriding
  procedure Visit
    (Self   : in out Object_T;
     Object : in out Visitor.Object_T'Class);

  procedure Initialize
    (Self           : in out Object_T'Class;
     Name           : in     String;
     Of_Type        : in     String                     := "";
     Parent_Package : access Package_Def.Object_T'Class := null;
     In_Package     : access Package_Def.Object_T'Class := null;
     In_Class       : access Class_Def.Object_T'Class   := null;
     Properties     : in     Property_T                 := None;
     Visibility     : in     Named_Element.Visibility_T)
  with
    Pre => Only_One_Namespace (Parent_Package, In_Package, In_Class);

private

  type Object_T is new Parent_Pkg.Object_T
    with record
      Parent_Package : access Package_Def.Object_T'Class := null;

      Of_Type    : access String      := null;
      Properties : Property_T         := (others => False);
      Parameters : Parameter.Vector_T := Parameter.Vectors.Empty_Vector;

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

  function Number_Of_Parameters
    (Self : in Object_T)
    return Natural
    is
    (Natural (Self.Parameters.Length));

  function Get_Parameter
    (Self  : in Object_T;
     Index : in Positive)
    return not null access Parameter.Object_T'Class
    is
    (Self.Parameters (Index));

  not overriding
  function Is_Abstract
    (Self : in Object_T)
    return Boolean
    is (Self.Properties (Abstract_Property));

  not overriding
  function Is_Static
    (Self : in Object_T)
    return Boolean
    is (Self.Properties (Static_Property));

  not overriding
  function Is_Separate
    (Self : in Object_T)
    return Boolean
    is (Self.Properties (Separate_Property));

end Model.Operation;
