with Ada.Containers.Vectors;

limited with Model.Namespace;
with Model.Named_Element;
with Model.Types.Enum_Value;
with Model.Types.Type_Def;

package Model.Types.Enum_Def is

  package Parent_Pkg renames Type_Def;

  type Object_T is new Parent_Pkg.Object_T with private;

  type Reference_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  procedure Initialize
    (Self            : in out Object_T'Class;
     Name            : in     String;
     Owner_Namespace : access Namespace.Object_T'Class;
     Values          : in     Enum_Value.Vector_T :=
       Enum_Value.Vectors.Empty_Vector;
     Visibility      : in     Named_Element.Visibility_T);

  function Create
    (Name            : in     String;
     Owner_Namespace : access Namespace.Object_T'Class;
     Values          : in     Enum_Value.Vector_T :=
       Enum_Value.Vectors.Empty_Vector;
     Visibility      : in     Named_Element.Visibility_T)
    return not null access Object_T'Class;

private

  type Object_T is new Type_Def.Object_T
    with record
      Values : Enum_Value.Vector_T :=
        Enum_Value.Vectors.Empty_Vector;
    end record;

end Model.Types.Enum_Def;
