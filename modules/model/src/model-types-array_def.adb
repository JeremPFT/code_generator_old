with Model.Namespace;

package body Model.Types.Array_Def is

  ----------------------------------------------------------------------------

  procedure Initialize
    (Self            : in out Object_T'Class;
     Name            : in     String;
     Owner_Namespace : access Namespace.Object_T'Class;
     Contained_Type  : in     String;
     Index_Type      : in     String;
     Defined_Range   : in     String;
     Visibility      : in     Named_Element.Element_Visibility_T)
  is
  begin
    Parent_Pkg.Initialize (Self            => Self,
                           Owner_Namespace => Owner_Namespace,
                           Name            => Name,
                           Visibility      => Visibility);

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
     Defined_Range   : in     String;
     Visibility      : in     Named_Element.Element_Visibility_T)
    return not null access Object_T'Class
  is
    Obj_Array : constant access Object_T := new Object_T;
  begin
    Obj_Array.Initialize (Name            => Name,
                          Owner_Namespace => Owner_Namespace,
                          Contained_Type  => Contained_Type,
                          Index_Type      => Index_Type,
                          Defined_Range   => Defined_Range,
                          Visibility      => Visibility);

    return Obj_Array;
  end Create;

  ----------------------------------------------------------------------------

  overriding
  procedure Visit
    (Self   : in out Object_T;
     Object : in out Visitor.Object_T'Class)
  is
  begin
    null;
  end Visit;

  ----------------------------------------------------------------------------

end Model.Types.Array_Def;
