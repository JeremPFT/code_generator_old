with Model.Types.Class_Def;
with Model.Namespace;

package body Model.Field is

  procedure Initialize
    (Self          : in out          Object_T'Class;
     Name          : in              String;
     Owner_Class   : not null access Types.Class_Def.Object_T'Class;
     Of_Type       : in              String;
     Default_Value : in              String := "";
     Visibility    : in              Named_Element.Element_Visibility_T)
  is
    Owner_Namespace : constant access Namespace.Object_T'Class :=
      Owner_Class.Get_Defined_Namespace;

  begin
    Parent_Pkg.Initialize (Self            => Self,
                           Name            => Name,
                           Owner_Namespace => Owner_Namespace,
                           Visibility      => Visibility);

    if Of_Type /= "" then
      Self.Of_Type := new String'(Of_Type);
    else
      raise Constraint_Error with "the field """ & Name & """ has no type";
    end if;

    if Default_Value /= "" then
      Self.Default_Value := new String'(Default_Value);
    end if;

    Self.Owner_Class := Owner_Class;
  end Initialize;

  function Create
    (Name          : in              String;
     Owner_Class   : not null access Types.Class_Def.Object_T'Class;
     Of_Type       : in              String;
     Default_Value : in              String := "";
     Visibility    : in              Named_Element.Element_Visibility_T)
    return not null access Object_T'Class
  is
    Object : constant access Object_T := new Object_T;
  begin
    Object.Initialize (Name          => Name,
                       Owner_Class   => Owner_Class,
                       Of_Type       => Of_Type,
                       Default_Value => Default_Value,
                       Visibility    => Visibility);
    return Object;
  end Create;

  function Get_Default_Value
    (Self : in Object_T)
    return String
  is
  begin
    if not Self.Has_Default_Value then
      raise No_Default_Value with "field " & Self.Get_Name &
        " has no default value";
    else
      return Self.Default_Value.all;
    end if;
  end Get_Default_Value;

  overriding
  procedure Visit
    (Self   : in out Object_T;
     Object : in out Visitor.Object_T'Class)
  is
  begin
    Object.Visit_Field (Self);
  end Visit;

end Model.Field;
