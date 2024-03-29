with Model.Types.Class_Def;
with Model.Namespace;
with Model.Package_Def;

package body Model.Operation is

  -----------------------------------------------------------------------------

  procedure Initialize
    (Self           : in out Object_T'Class;
     Name           : in     String;
     Of_Type        : in     String                     := "";
     Parent_Package : access Package_Def.Object_T'Class := null;
     In_Package     : access Package_Def.Object_T'Class := null;
     In_Class       : access Class_Def.Object_T'Class   := null;
     Properties     : in     Property_T                 := None;
     Visibility     : in     Named_Element.Element_Visibility_T)
  is
    Owner_Namespace : constant access Namespace.Object_T'Class :=
      (if Parent_Package /= null
       then Parent_Package.Get_Defined_Namespace
       elsif In_Package /= null
       then In_Package.Get_Defined_Namespace
       elsif In_Class /= null
       then In_Class.Get_Defined_Namespace
       else null);
  begin
    Parent_Pkg.Initialize (Self            => Self,
                           Name            => Name,
                           Owner_Namespace => Owner_Namespace,
                           Visibility      => Visibility);

    if Name /= "" then
      Self.Of_Type := new String'(Of_Type);
    end if;

    Self.Parent_Package := Parent_Package;
    Self.Properties     := Properties;
  end Initialize;

  -----------------------------------------------------------------------------

  function Create
    (Name           : in     String;
     Of_Type        : in     String                     := "";
     Parent_Package : access Package_Def.Object_T'Class := null;
     In_Package     : access Package_Def.Object_T'Class := null;
     In_Class       : access Class_Def.Object_T'Class   := null;
     Properties     : in     Property_T                 := None;
     Visibility     : in     Named_Element.Element_Visibility_T)
    return not null access Object_T'Class
  is
    Object : constant access Object_T := new Object_T;
  begin
    Object.Initialize (Name           => Name,
                       Of_Type        => Of_Type,
                       Parent_Package => Parent_Package,
                       In_Package     => In_Package,
                       In_Class       => In_Class,
                       Properties     => Properties,
                       Visibility     => Visibility);
    return Object;
  end Create;

  -----------------------------------------------------------------------------

  function Create_As_Unit
    (Name           : in     String;
     Parent_Package : access Package_Def.Object_T'Class := null;
     Of_Type        : in     String                     := "";
     Properties     : in     Property_T                 := None;
     Visibility     : in     Named_Element.Element_Visibility_T)
    return not null access Object_T'Class
  is
  begin
    return Create (Name           => Name,
                   Parent_Package => Parent_Package,
                   Of_Type        => Of_Type,
                   Properties     => Properties,
                   Visibility     => Visibility);
  end Create_As_Unit;

  -----------------------------------------------------------------------------

  function Create_In_Package
    (Name       : in     String;
     In_Package : access Package_Def.Object_T'Class := null;
     Of_Type    : in     String                     := "";
     Properties : in     Property_T                 := None;
     Visibility : in     Named_Element.Element_Visibility_T)
    return not null access Object_T'Class
  is
  begin
    return Create (Name       => Name,
                   In_Package => In_Package,
                   Of_Type    => Of_Type,
                   Properties => Properties,
                   Visibility => Visibility);
  end Create_In_Package;

  -----------------------------------------------------------------------------

  function Create_In_Class
    (Name       : in     String;
     In_Class   : access Class_Def.Object_T'Class := null;
     Of_Type    : in     String                   := "";
     Properties : in     Property_T               := None;
     Visibility : in     Named_Element.Element_Visibility_T)
    return not null access Object_T'Class
  is
  begin
    return Create (Name       => Name,
                   In_Class   => In_Class,
                   Of_Type    => Of_Type,
                   Properties => Properties,
                   Visibility => Visibility);
  end Create_In_Class;

  -----------------------------------------------------------------------------

  not overriding
  procedure Add_Parameter
    (Self          : in out          Object_T;
     Obj_Parameter : not null access Parameter.Object_T'Class)
  is
  begin
    Self.Parameters.Append (Obj_Parameter);
  end Add_Parameter;

  -----------------------------------------------------------------------------

  function Only_One_Namespace
    (Parent_Package : access Package_Def.Object_T'Class := null;
     In_Package     : access Package_Def.Object_T'Class := null;
     In_Class       : access Class_Def.Object_T'Class   := null)
    return Boolean
  is
    Independant : constant Boolean :=
      Parent_Package = null
        and then In_Package = null
        and then In_Class = null;

    Counter : Natural := 0;

  begin
    if Parent_Package /= null then
      Counter := Counter + 1;
    end if;
    if In_Package /= null then
      Counter := Counter + 1;
    end if;
    if In_Class /= null then
      Counter := Counter + 1;
    end if;
    if Independant then
      Counter := Counter + 1;
    end if;

    return Counter = 1;
  end Only_One_Namespace;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit
    (Self   : in out Object_T;
     Object : in out Visitor.Object_T'Class)
  is
  begin
    Object.Visit_Operation (Self);
  end Visit;

  -----------------------------------------------------------------------------

end Model.Operation;
