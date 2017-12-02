with Ada.Containers.Vectors;

with Model.Element;

package Model.Named_Element is

  subtype Parent_T is Element.Object_T;

  type Object_T is abstract new Parent_T with private;

  type Access_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  procedure Initialize
    (Self : in out Object_T'Class;
     Name : in     String);

  --  not overriding
  --  procedure Set_Name
  --    (Self  : in out Object_T;
  --     Value : in String);

  not overriding
  function Get_Name
    (Self : in Object_T)
    return String;

  not overriding
  function To_String
    (Self : in Object_T)
    return String;

private

  type Object_T is
    abstract new Element.Object_T with
    record
      Name : access String := null;
    end record;

  function Get_Name
    (Self : in Object_T)
    return String
    is
    (Self.Name.all);

end Model.Named_Element;
