with Ada.Containers.Vectors;

limited with Model.Package_Def;
with Model.Type_Def;
with Model.Enum_Value;

package Model.Enum_Def is

  type Object_T
    (Owner_Package : access Package_Def.Object_T'Class)
    is
    new Type_Def.Object_T with private;

  type Reference_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  function Create
    (Owner_Package : access Package_Def.Object_T'Class;
     Name          : in     String;
     Values        : in     Enum_Value.Vector_T :=
       Enum_Value.Vectors.Empty_Vector)
    return not null access Object_T'Class;

private

  type Object_T
    (Owner_Package : access Package_Def.Object_T'Class)
    is
    new Type_Def.Object_T (Owner_Package => Owner_Package)
    with record
      Values : Enum_Value.Vector_T :=
        Enum_Value.Vectors.Empty_Vector;
    end record;

end Model.Enum_Def;
