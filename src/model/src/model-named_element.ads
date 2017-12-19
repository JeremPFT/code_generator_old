with Ada.Containers.Vectors;

limited with Model.Namespace;
with Model.Element;

package Model.Named_Element is

  -----------------------------------------------------------------------------
  --  types
  -----------------------------------------------------------------------------

  package Parent_Pkg renames Model.Element;

  type Object_T is abstract new Parent_Pkg.Object_T with private;

  type Access_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  type Visibility_T is
    (Public_Visibility,
     Protected_Visibility,
     Package_Visibility,
     Private_Visibility,
     Undefined_Visibility
    );

  procedure Initialize
    (Self            : in out Object_T'Class;
     Name            : in     String;
     Owner_Namespace : access Namespace.Object_T'Class;
     Visibility      : in     Visibility_T);

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
    return Visibility_T;

private

  type Object_T is abstract new Parent_Pkg.Object_T with record
    Name : access String := null;

    Owner_Namespace : access Model.Namespace.Object_T'Class := null;

    Visibility : Visibility_T := Undefined_Visibility;
  end record;

  not overriding
  function Get_Owner_Namespace
    (Self : in Object_T)
    return access Namespace.Object_T'Class
    is (Self.Owner_Namespace);

  not overriding
  function Get_Name
    (Self : in Object_T)
    return String
    is (Self.Name.all);

  not overriding
  function Get_Visibility
    (Self : in Object_T)
    return Visibility_T
    is (Self.Visibility);

end Model.Named_Element;
