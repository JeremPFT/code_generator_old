with Ada.Containers.Vectors;

limited with Model.Namespace;
with Model.Element;

package Model.Named_Element is

  package Parent_Pkg renames Model.Element;

  type Object_T is abstract new Parent_Pkg.Object_T with private;

  type Access_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  procedure Initialize
    (Self            : in out Object_T'Class;
     Name            : in     String;
     Owner_Namespace : access Namespace.Object_T'Class);

  not overriding
  function Get_Owner_Namespace
    (Self : in Object_T)
    return access Namespace.Object_T'Class;

  not overriding
  function Get_Name
    (Self : in Object_T)
    return String;

private

  type Object_T is abstract new Parent_Pkg.Object_T with record
    Name            : access String                         := null;
    Owner_Namespace : access Model.Namespace.Object_T'Class := null;
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

end Model.Named_Element;
