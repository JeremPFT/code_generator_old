--  with Reflection;

with Model.Package_Def;

package body Model.Array_Def is

  --  package Unit is new Reflection;

  procedure Initialize
    (Self           : in out Object_T'Class;
     Name           : in     String;
     Contained_Type : in     String;
     Index_Type     : in     String;
     Defined_Range  : in     String)
  is
  begin
    Type_Def.Initialize (Self, Name);

    Self.Contained_Type := new String'(Contained_Type);
    Self.Index_Type     := new String'(Index_Type);
    Self.Defined_Range  := new String'(Defined_Range);
  end Initialize;

  function Create
    (Owner_Package  : access Package_Def.Object_T'Class;
     Name           : in     String;
     Contained_Type : in     String;
     Index_Type     : in     String;
     Defined_Range  : in     String)
    return not null access Object_T'Class
  is
    Obj_Array : constant access Object_T :=
      new Object_T'(Type_Def.Object_T with
                    Owner_Package => Owner_Package,
                    others        => <>);
  begin
    Obj_Array.Set_Name (Name);
    Obj_Array.Contained_Type := new String'(Contained_Type);
    Obj_Array.Index_Type     := new String'(Index_Type);
    Obj_Array.Defined_Range  := new String'(Defined_Range);

    return Obj_Array;
  end Create;

  overriding
  procedure Visit
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class)
  is
  begin
    null;
  end Visit;

end Model.Array_Def;
