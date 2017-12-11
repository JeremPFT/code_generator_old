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

  type Option_Enum_T is (Abstract_Option, Static_Option, Separate_Option);

  type Option_T is array (Option_Enum_T) of Boolean;

  Is_Abstract : constant Option_T := (Abstract_Option => True,
                                      others          => False);
  Is_Static   : constant Option_T := (Static_Option   => True,
                                      others          => False);
  Is_Separate : constant Option_T := (Separate_Option => True,
                                      others          => False);

  None : constant Option_T := (others => False);

  -----------------------------------------------------------------------------
  --  constructors
  -----------------------------------------------------------------------------

  procedure Initialize
    (Self           : in out Object_T'Class;
     Name           : in     String;
     Of_Type        : in     String                     := "";
     Parent_Package : access Package_Def.Object_T'Class := null;
     In_Package     : access Package_Def.Object_T'Class := null;
     In_Class       : access Class_Def.Object_T'Class   := null;
     Options        : in     Option_T                   := None)
  with
    Pre => Only_One_Namespace (Parent_Package, In_Package, In_Class);

  function Create
    (Name           : in     String;
     Of_Type        : in     String                     := "";
     Parent_Package : access Package_Def.Object_T'Class := null;
     In_Package     : access Package_Def.Object_T'Class := null;
     In_Class       : access Class_Def.Object_T'Class   := null;
     Options        : in     Option_T                   := None)
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
     Options        : in Option_T                       := None)
    return not null access Object_T'Class;

  function Create_In_Package
    (Name       : in     String;
     In_Package : access Package_Def.Object_T'Class := null;
     Of_Type    : in     String                     := "";
     Options    : in Option_T                       := None)
    return not null access Object_T'Class;

  function Create_In_Class
    (Name     : in     String;
     In_Class : access Class_Def.Object_T'Class := null;
     Of_Type  : in     String                   := "";
     Options  : in Option_T                     := None)
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
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class);

private

  type Object_T is new Parent_Pkg.Object_T
    with record
      Parent_Package : access Package_Def.Object_T'Class := null;

      Of_Type    : access String      := null;
      Options    : Option_T           := (others => False);
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

end Model.Operation;
