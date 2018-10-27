with Ada.Containers.Vectors;

limited with Model.Namespace;
with Model.Element;

package Model.Named_Element is

  pragma Assertion_Policy ( Check );
  --  pragma Assertion_Policy ( Ignore );

  -----------------------------------------------------------------------------
  --  types
  -----------------------------------------------------------------------------

  package Parent_Pkg renames Model.Element;

  type Object_T is abstract new Parent_Pkg.Object_T with private;

  type Access_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  type Array_T is array (Positive range <>) of
    not null access constant Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  type Element_Visibility_T is
    (Public_Visibility,
     Protected_Visibility,
     Package_Visibility,
     Private_Visibility,
     Undefined_Visibility
    );

  not overriding
  function Has_Owner_Namespace
    (Self : in Object_T)
    return Boolean;

  not overriding
  function Get_Owner_Namespace
    (Self : in Object_T)
    return access Namespace.Object_T'Class;

  not overriding
  function Get_Name
    (Self : in Object_T)
    return String;

  not overriding
  function Get_Visibility
    (Self : in Object_T)
    return element_visibility_t;

  not overriding
  function Has_Name
    ( Self : in out Object_T )
    return Boolean;

  function Is_Pre_State
    (Self            : in out Object_T'Class;
     Name            : in     String;
     Owner_Namespace : access Namespace.Object_T'Class;
     Visibility      : in     Element_Visibility_T)
    return Boolean;

  function Is_Post_State
    (Self            : in out Object_T'Class;
     Name            : in     String;
     Owner_Namespace : access Namespace.Object_T'Class;
     Visibility      : in     Element_Visibility_T)
    return Boolean;

  procedure Initialize
    (Self            : in out Object_T'Class;
     Name            : in     String;
     Owner_Namespace : access Namespace.Object_T'Class;
     Visibility      : in     Element_Visibility_T);
  pragma Pre ( Self.Is_Pre_State ( Name, Owner_Namespace, Visibility ) );
  pragma Post ( Self.Is_Post_State ( Name, Owner_Namespace, Visibility ) );

private

  type Object_T is abstract new Parent_Pkg.Object_T with record
    Name            : access String                         := null;
    Owner_Namespace : access Model.Namespace.Object_T'Class := null;
    Visibility      : Element_Visibility_T          := Undefined_Visibility;
  end record;

  function Is_Pre_State
    (Self            : in out Object_T'Class;
     Name            : in     String;
     Owner_Namespace : access Namespace.Object_T'Class;
     Visibility      : in     Element_Visibility_T)
    return Boolean
    is ( Self.Name = null and then
          Self.Owner_Namespace = null and then
          Self.Visibility = Undefined_Visibility );

  function Is_Post_state
    (Self            : in out Object_T'Class;
     Name            : in     String;
     Owner_Namespace : access Namespace.Object_T'Class;
     Visibility      : in     Element_Visibility_T)
    return Boolean
    is ( Self.Get_Name = Name and then
          Self.Get_Owner_Namespace = Owner_Namespace and then
          Self.Get_Visibility = Visibility );

  function Get_Owner_Namespace
    (Self : in Object_T)
    return access Namespace.Object_T'Class
    is (Self.Owner_Namespace);

  function Get_Name
    (Self : in Object_T)
    return String
    is (Self.Name.all);

  function Get_Visibility
    (Self : in Object_T)
    return Element_Visibility_T
    is (Self.Visibility);

  function Has_Name
    ( Self : in out Object_T )
    return Boolean
    is ( Self.Name /= null );

  function Has_Owner_Namespace
    (Self : in Object_T)
    return Boolean
    is (Self.Owner_Namespace /= null);

end Model.Named_Element;
