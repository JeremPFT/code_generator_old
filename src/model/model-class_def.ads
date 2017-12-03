with Ada.Containers.Vectors;

with Model.Visitor;
with Model.Interface_Def;
with Model.Subprogram;
with Model.Package_Def;
with Model.Field;

package Model.Class_Def is

  type Object_T is new Interface_Def.Object_T with private;

  type Reference_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  procedure Initialize
    (Self              : in out Object_T'Class;
     Name              : in     String;
     Parent_Class      : access Object_T'Class               := null;
     Parent_Interfaces : in     Model.Interface_Def.Vector_T :=
       Model.Interface_Def.Vectors.Empty_Vector;
     Is_Abstract       : in     Boolean                      := False);

  function Create
    (Owner_Package     : access Package_Def.Object_T;
     Name              : in     String;
     Parent_Class      : access Object_T'Class               := null;
     Parent_Interfaces : in     Model.Interface_Def.Vector_T :=
       Model.Interface_Def.Vectors.Empty_Vector;
     Is_Abstract       : in     Boolean                      := False)
    return not null access Object_T'Class;

  not overriding
  function Is_Abstract
    (Self : in Object_T)
    return Boolean;

  not overriding
  function Has_Protected_Subprograms
    (Self : in Object_T)
    return Boolean;

  not overriding
  function Number_Of_Protected_Subprograms
    (Self : in Object_T)
    return Natural;

  not overriding
  function Get_Protected_Subprogram
    (Self  : in Object_T;
     Index : in Positive)
    return not null access Subprogram.Object_T'Class;

  not overriding
  procedure Add_Protected_Subprogram
    (Self   : in out Object_T;
     Object : access Subprogram.Object_T);

  not overriding
  function Has_Private_Subprograms
    (Self : in Object_T)
    return Boolean;

  not overriding
  function Number_Of_Private_Subprograms
    (Self : in Object_T)
    return Natural;

  not overriding
  function Get_Private_Subprogram
    (Self  : in Object_T;
     Index : in Positive)
    return not null access Subprogram.Object_T'Class;

  not overriding
  procedure Add_Private_Subprogram
    (Self   : in out Object_T;
     Object : access Subprogram.Object_T);

  not overriding
  function Has_Fields
    (Self : in Object_T)
    return Boolean;

  not overriding
  function Get_Fields
    (Self : in Object_T)
    return Field.Vector_T;

  not overriding
  function Number_Of_Fields
    (Self : in Object_T)
    return Natural;

  not overriding
  function Get_Field
    (Self  : in Object_T;
     Index : in Positive)
    return not null access Model.Field.Object_T'Class;

  not overriding
  procedure Add_Field
    (Self   : in out          Object_T;
     Object : not null access Field.Object_T);

  not overriding
  function Has_Discriminants
    (Self : in Object_T)
    return Boolean;

  not overriding
  function Get_Discriminants
    (Self : in Object_T)
    return Field.Vector_T;

  not overriding
  procedure Add_Discriminant
    (Self   : in out          Object_T;
     Object : not null access Field.Object_T);

  overriding
  function To_String
    (Self : in Object_T)
    return String;

  overriding
  procedure Visit
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class);

private

  type Object_T is
    new Interface_Def.Object_T with
    record
      Name         : access String   := null;
      Parent_Class : access Object_T := null;

      Fields        : Field.Vector_T := Field.Vectors.
        Empty_Vector;
      Discriminants : Field.Vector_T := Field.Vectors.Empty_Vector;

      Protected_Subprograms : Subprogram.Vector_T :=
        Subprogram.Vectors.Empty_Vector;
      Private_Subprograms   : Subprogram.Vector_T :=
        Subprogram.Vectors.Empty_Vector;

      Is_Abstract : Boolean := True;
    end record;

  function Is_Abstract
    (Self : in Object_T)
    return Boolean
    is (Self.Is_Abstract);

  function Has_Protected_Subprograms
    (Self : in Object_T)
    return Boolean
    is
    (not Self.Protected_Subprograms.Is_Empty);

  function Number_Of_Protected_Subprograms
    (Self : in Object_T)
    return Natural
    is
    (Natural (Self.Protected_Subprograms.Length));

  function Get_Protected_Subprogram
    (Self  : in Object_T;
     Index : in Positive)
    return not null access Subprogram.Object_T'Class
    is
    (Self.Protected_Subprograms (Index));

  function Has_Private_Subprograms
    (Self : in Object_T)
    return Boolean
    is
    (not Self.Private_Subprograms.Is_Empty);

  function Number_Of_Private_Subprograms
    (Self : in Object_T)
    return Natural
    is
    (Natural (Self.Private_Subprograms.Length));

  function Get_Private_Subprogram
    (Self  : in Object_T;
     Index : in Positive)
    return not null access Subprogram.Object_T'Class
    is
    (Self.Private_Subprograms (Index));

  function Has_Fields
    (Self : in Object_T)
    return Boolean
    is
    (not Self.Fields.Is_Empty);

  function Get_Fields
    (Self : in Object_T)
    return Field.Vector_T
    is
    (Self.Fields);

  not overriding
  function Number_Of_Fields
    (Self : in Object_T)
    return Natural
    is
    (Integer (Self.Fields.Length));

  not overriding
  function Get_Field
    (Self  : in Object_T;
     Index : in Positive)
    return not null access Model.Field.Object_T'Class
    is
    (Self.Fields (Index));

  function Has_Discriminants
    (Self : in Object_T)
    return Boolean
    is
    (not Self.Discriminants.Is_Empty);

  function Get_Discriminants
    (Self : in Object_T)
    return Field.Vector_T
    is
    (Self.Discriminants);

end Model.Class_Def;
