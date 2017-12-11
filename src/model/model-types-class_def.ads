with Ada.Containers.Vectors;

limited with Model.Field;
limited with Model.Namespace;
with Model.Types.Interface_Def;
with Model.Package_Def;
with Model.Types.Type_Def;
with Model.Visitor;

package Model.Types.Class_Def is

  package Parent_Pkg renames Type_Def;

  type Object_T is new Parent_Pkg.Object_T with private;

  type Reference_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  procedure Initialize
    (Self              : in out Object_T'Class;
     Name              : in     String;
     Owner_Package     : access Package_Def.Object_T'Class;
     Parent_Class      : access Object_T'Class         := null;
     Parent_Interfaces : in     Interface_Def.Vector_T :=
       Interface_Def.Vectors.Empty_Vector;
     Is_Abstract       : in     Boolean                := False);

  function Create
    (Name              : in     String;
     Owner_Package     : access Package_Def.Object_T'Class;
     Parent_Class      : access Object_T'Class         := null;
     Parent_Interfaces : in     Interface_Def.Vector_T :=
       Interface_Def.Vectors.Empty_Vector;
     Is_Abstract       : in     Boolean                := False)
    return not null access Object_T'Class;

  not overriding
  function Get_Defined_Namespace
    (Self : in Object_T)
    return not null access Namespace.Object_T'Class;

  not overriding
  function Is_Abstract
    (Self : in Object_T)
    return Boolean;

  not overriding
  function Get_Owner_Package
    (Self : in Object_T)
    return not null access Package_Def.Object_T'Class;

  -----------------------------------------------------------------------------
  --  fields
  -----------------------------------------------------------------------------

  not overriding
  function Has_Fields
    (Self : in Object_T)
    return Boolean;

  not overriding
  function Number_Of_Fields
    (Self : in Object_T)
    return Natural;

  not overriding
  function Get_Field
    (Self  : in Object_T;
     Index : in Natural)
    return not null access Field.Object_T'Class;

  -----------------------------------------------------------------------------
  --  visitor
  -----------------------------------------------------------------------------

  overriding
  procedure Visit
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class);

private

  type Object_T is new Parent_Pkg.Object_T with
    record
      Defined_Namespace : access Namespace.Object_T'Class := null;

      Owner_Package : access Package_Def.Object_T'Class := null;

      Parent_Class : access Object_T := null;

      Parent_Interfaces : Interface_Def.Vector_T :=
        Interface_Def.Vectors.Empty_Vector;

      Is_Abstract : Boolean := True;
    end record;

  not overriding
  function Get_Defined_Namespace
    (Self : in Object_T)
    return not null access Namespace.Object_T'Class
    is (Self.Defined_Namespace);

  function Is_Abstract
    (Self : in Object_T)
    return Boolean
    is (Self.Is_Abstract);

  not overriding
  function Get_Owner_Package
    (Self : in Object_T)
    return not null access Package_Def.Object_T'Class
    is (Self.Owner_Package);

end Model.Types.Class_Def;
