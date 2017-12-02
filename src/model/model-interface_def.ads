with Ada.Containers.Vectors;

with Model.Visitor;
with Model.Type_Def;
limited with Model.Package_Def;
with Model.Subprogram;

package Model.Interface_Def is

  type Object_T is new Type_Def.Object_T with private;

  type Reference_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  procedure Initialize
    (Self              : in out Object_T'Class;
     Name              : in     String;
     Parent_Interfaces : in     Model.Interface_Def.Vector_T :=
       Model.Interface_Def.Vectors.Empty_Vector);

  function Create
    (Owner_Package     : not null access Package_Def.Object_T'Class;
     Name              : in              String;
     Parent_Interfaces : in              Vector_T :=
       Vectors.Empty_Vector)
    return not null access Object_T'Class;

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

  not overriding
  function Has_Public_Subprograms
    (Self : in Object_T)
    return Boolean;

  not overriding
  function Number_Of_Public_Subprograms
    (Self : in Object_T)
    return Natural;

  not overriding
  function Get_Public_Subprogram
    (Self  : in Object_T;
     Index : in Positive)
    return access Subprogram.Object_T'Class;

  not overriding
  function Get_Public_Subprograms
    (Self : in Object_T)
    return Subprogram.Vector_T;

  not overriding
  procedure Add_Public_Subprogram
    (Self   : in out Object_T;
     Object : access Subprogram.Object_T);

  overriding
  procedure Visit
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class);

private

  type Object_T is
    new Type_Def.Object_T with
    record
      Parent_Interfaces  : Vector_T            :=
        Vectors.Empty_Vector;
      Public_Subprograms : Subprogram.Vector_T :=
        Subprogram.Vectors.Empty_Vector;
    end record;

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

  function Has_Public_Subprograms
    (Self : in Object_T)
    return Boolean
    is
    (not Self.Public_Subprograms.Is_Empty);

  function Number_Of_Public_Subprograms
    (Self : in Object_T)
    return Natural
    is
    (Natural (Self.Public_Subprograms.Length));

  function Get_Public_Subprogram
    (Self  : in Object_T;
     Index : in Positive)
    return access Subprogram.Object_T'Class
    is
    (Self.Public_Subprograms (Index));

  function Get_Public_Subprograms
    (Self : in Object_T)
    return Subprogram.Vector_T
    is (Self.Public_Subprograms);

end Model.Interface_Def;
