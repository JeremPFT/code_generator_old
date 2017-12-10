with Model.Namespace;

package body Model.Array_Def is

  ----------------------------------------------------------------------------

  procedure Initialize
    (Self            : in out Object_T'Class;
     Name            : in     String;
     Owner_Namespace : access Namespace.Object_T'Class;
     Contained_Type  : in     String;
     Index_Type      : in     String;
     Defined_Range   : in     String)
  is
  begin
    Parent_Pkg.Initialize (Self            => Self,
                           Owner_Namespace => Owner_Namespace,
                           Name            => Name);

    Self.Contained_Type := new String'(Contained_Type);
    Self.Index_Type     := new String'(Index_Type);
    Self.Defined_Range  := new String'(Defined_Range);
  end Initialize;

  ----------------------------------------------------------------------------

  function Create
    (Name            : in     String;
     Owner_Namespace : access Namespace.Object_T'Class;
     Contained_Type  : in     String;
     Index_Type      : in     String;
     Defined_Range   : in     String)
    return not null access Object_T'Class
  is
    Obj_Array : constant access Object_T := new Object_T;
  begin
    Obj_Array.Initialize (Name            => Name,
                          Owner_Namespace => Owner_Namespace,
                          Contained_Type  => Contained_Type,
                          Index_Type      => Index_Type,
                          Defined_Range   => Defined_Range);

    return Obj_Array;
  end Create;

  ----------------------------------------------------------------------------

  overriding
  procedure Visit
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class)
  is
  begin
    null;
  end Visit;

  ----------------------------------------------------------------------------

end Model.Array_Def;
