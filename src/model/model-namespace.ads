
--  with ada files
with Ada.Containers.Vectors;

--  with others libraries

--  with project files
with Model.Named_Element;
with Model.Visitor;

package Model.Namespace is

  package Parent_Pkg renames Named_Element;

  type Object_T (<>) is new Parent_Pkg.Object_T with private;

  type Reference_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  type Visibility_Kind is
    (Public_Visibility,
     Protected_Visibility,
     Package_Visibility,
     Private_Visibility
    );

  procedure Initialize
    (Self            : in out Object_T'Class;
     Name            : in     String;
     Owner_Namespace : access Namespace.Object_T'Class);

  function Create
    (Name            : in     String;
     Owner_Namespace : access Namespace.Object_T'Class)
    return not null access Object_T'Class;

  not overriding
  function Has_Parent
    (Self : in Object_T)
    return Boolean;

  not overriding
  function Get_Parent
    (Self : in Object_T)
    return not null access Object_T'Class;

  not overriding
  procedure Add_Member
    (Self       : in out          Object_T;
     Object     : not null access Named_Element.Object_T'Class;
     Visibility : in              Visibility_Kind := Public_Visibility);

  not overriding
  function Has_Members
    (Self       : in Object_T;
     Visibility : in Visibility_Kind := Public_Visibility)
    return Boolean;

  not overriding
  function Number_Of_Members
    (Self       : in Object_T;
     Visibility : in Visibility_Kind := Public_Visibility)
    return Natural;

  not overriding
  function Get_Member
    (Self       : in Object_T;
     Visibility : in Visibility_Kind := Public_Visibility;
     Index      : in Positive)
    return not null access Named_Element.Object_T'Class;

  -----------------------------------------------------------------------------
  --  visitor
  -----------------------------------------------------------------------------

  overriding
  procedure Visit
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class);

private

  type Elements_Array_T is array (Visibility_Kind) of Named_Element.Vector_T;

  type Object_T
    is new Named_Element.Object_T with record
      Owned_Members : Elements_Array_T :=
        (others => Named_Element.Vectors.Empty_Vector);
    end record;

  function Has_Parent
    (Self : in Object_T)
    return Boolean
    is (Self.Get_Owner_Namespace /= null);

  function Get_Parent
    (Self : in Object_T)
    return not null access Object_T'Class
    is (Self.Get_Owner_Namespace);

  function Has_Members
    (Self       : in Object_T;
     Visibility : in Visibility_Kind := Public_Visibility)
    return Boolean
    is (Natural (Self.Owned_Members (Visibility).Length) > 0);

  function Number_Of_Members
    (Self       : in Object_T;
     Visibility : in Visibility_Kind := Public_Visibility)
    return Natural
    is (Natural (Self.Owned_Members'Length));

  function Get_Member
    (Self       : in Object_T;
     Visibility : in Visibility_Kind := Public_Visibility;
     Index      : in Positive)
    return not null access Named_Element.Object_T'Class
    is (Self.Owned_Members (Visibility) (Index));

end Model.Namespace;
