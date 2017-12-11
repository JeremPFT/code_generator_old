with Ada.Containers.Vectors;

with Model.Visitor;
with Model.Types.Type_Def;
limited with Model.Package_Def;

package Model.Types.Interface_Def is

  ----------------------------------------------------------------------------
  --  types
  ----------------------------------------------------------------------------

  package Parent_Pkg renames Type_Def;

  type Object_T is new Parent_Pkg.Object_T with private;

  type Reference_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  ----------------------------------------------------------------------------
  --  constructors
  ----------------------------------------------------------------------------

  procedure Initialize
    (Self              : in out          Object_T'Class;
     Name              : in              String;
     Owner_Package     : not null access Package_Def.Object_T'Class;
     Parent_Interfaces : in              Model.Types.Interface_Def.Vector_T :=
       Model.Types.Interface_Def.Vectors.Empty_Vector);

  function Create
    (Name              : in              String;
     Owner_Package     : not null access Package_Def.Object_T'Class;
     Parent_Interfaces : in              Vector_T :=
       Vectors.Empty_Vector)
    return not null access Object_T'Class;

  ----------------------------------------------------------------------------
  --  parent interfaces
  ----------------------------------------------------------------------------

  not overriding
  function Has_Parent_Interfaces
    (Self : in Object_T)
    return Boolean;

  not overriding
  function Number_Of_Parent_Interfaces
    (Self : in Object_T)
    return Natural;

  not overriding
  function Get_Parent_Interface
    (Self  : in Object_T;
     Index : in Positive)
    return access Object_T'Class;

  not overriding
  procedure Add_Parent_Interface
    (Self   : in out Object_T;
     Parent : access Object_T'Class);

  ----------------------------------------------------------------------------
  --  constantes
  ----------------------------------------------------------------------------

  --  TODO

  ----------------------------------------------------------------------------
  --  operations
  ----------------------------------------------------------------------------

  --  not overriding
  --  function Has_Operations
  --    (Self : in Object_T)
  --    return Boolean;

  --  not overriding
  --  function Number_Of_Operations
  --    (Self : in Object_T)
  --    return Natural;

  --  not overriding
  --  function Get_Operation
  --    (Self  : in Object_T;
  --     Index : in Positive)
  --    return access Operation.Object_T'Class;

  --  not overriding
  --  function Get_Operations
  --    (Self : in Object_T)
  --    return Operation.Vector_T;

  --  not overriding
  --  procedure Add_Operation
  --    (Self   : in out Object_T;
  --     Object : access Operation.Object_T);

  ----------------------------------------------------------------------------
  --  visitor
  ----------------------------------------------------------------------------

  overriding
  procedure Visit
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class);

private

  ----------------------------------------------------------------------------
  --  types
  ----------------------------------------------------------------------------

  type Object_T is
    new Parent_Pkg.Object_T with
    record
      Owner_Package : access Package_Def.Object_T'Class;

      Parent_Interfaces : Vector_T := Vectors.Empty_Vector;

      --  Operations : Subprogram.Vector_T := Subprogram.Vectors.Empty_Vector;
    end record;

  ----------------------------------------------------------------------------
  --  parent interfaces
  ----------------------------------------------------------------------------

  function Has_Parent_Interfaces
    (Self : in Object_T)
    return Boolean
    is
    (not Self.Parent_Interfaces.Is_Empty);

  function Number_Of_Parent_Interfaces
    (Self : in Object_T)
    return Natural
    is
    (Natural (Self.Parent_Interfaces.Length));

  function Get_Parent_Interface
    (Self  : in Object_T;
     Index : in Positive)
    return access Object_T'Class
    is
    (Self.Parent_Interfaces (Index));

  ----------------------------------------------------------------------------
  --  operations
  ----------------------------------------------------------------------------

  --  function Has_Operations
  --    (Self : in Object_T)
  --    return Boolean
  --    is
  --    (not Self.Operations.Is_Empty);

  --  function Number_Of_Operations
  --    (Self : in Object_T)
  --    return Natural
  --    is
  --    (Natural (Self.Operations.Length));

  --  function Get_Operation
  --    (Self  : in Object_T;
  --     Index : in Positive)
  --    return access Operation.Object_T'Class
  --    is
  --    (Self.Operations (Index));

  --  function Get_Operations
  --    (Self : in Object_T)
  --    return Operation.Vector_T
  --    is (Self.Operations);

end Model.Types.Interface_Def;
