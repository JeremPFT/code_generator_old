package body Model.Named_Element is

  procedure Initialize
    (Self            : in out Object_T'Class;
     Name            : in     String;
     Owner_Namespace : access Namespace.Object_T'Class;
     Visibility      : in     Element_Visibility_T)
  is
  begin
    Parent_Pkg.Initialize (Self);
    Self.Name            := new String'(Name);
    Self.Owner_Namespace := Owner_Namespace;
    Self.Visibility      := Visibility;
  end Initialize;

end Model.Named_Element;
