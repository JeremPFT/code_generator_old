package body Model.Named_Element is

  procedure Initialize
    (Self            : in out Object_T'Class;
     Name            : in     String;
     Owner_Namespace : access Namespace.Object_T'Class;
     Visibility      : in     Visibility_T)
  is
  begin
    Element.Initialize (Self);
    Self.Name            := new String'(Name);
    Self.Owner_Namespace := Owner_Namespace;
    Self.Visibility      := Visibility;
  end Initialize;

  function Has_Name
    ( Self : in out Object_T )
    return Boolean
  is
  begin
    return Self.Name /= null;
  end Has_Name;

end Model.Named_Element;
