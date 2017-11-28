with Model.Visitor;

package body Model.Project is

  procedure Initialize
    (Self           : in out Object_T'Class;
     Name           : in     String;
     Kind           : in     String;
     Root_Directory : in     String;
     Parent         : access Object_T'Class := null)
  is
  begin
    Named_Element.Initialize (Self, Name);

    Self.Kind           := new String'(Kind);
    Self.Root_Directory := new String'(Root_Directory);
    Self.Parent         := Class_T (Parent);
  end Initialize;

  function Create
    (Name           : in     String;
     Kind           : in     String;
     Root_Directory : in     String;
     Parent         : access Object_T'Class := null)
    return not null access Object_T'Class
  is
    Object : constant access Object_T :=
      new Object_T'(Parent_T with
                    Kind           => new String'(Kind),
                    Root_Directory => new String'(Root_Directory),
                    Parent         => Class_T (Parent),
                    Subprojects    => <>,
                    Elements       => <>);
  begin
    Object.Set_Name (Name);

    return Object;
  end Create;

  procedure Add_Subproject
    (Self       : in out          Object_T;
     Subproject : not null access Object_T'Class)
  is
  begin
    Self.Subprojects.Append (Subproject);
  end Add_Subproject;

  procedure Add_Element
    (Self   : in out          Object_T;
     Object : not null access Named_Element.Object_T)
  is
  begin
    Self.Elements.Append (Object);
  end Add_Element;

  procedure Add_Package
    (Self   : in out          Object_T;
     Object : not null access Package_Def.Object_T)
  is
  begin
    Self.Add_Element (Named_Element.Access_T (Object));
  end Add_Package;

  procedure Add_Class
    (Self   : in out          Object_T;
     Object : not null access Class_Def.Object_T)
  is
  begin
    Self.Add_Element (Named_Element.Access_T (Object));
  end Add_Class;

  procedure Add_Subprogram
    (Self   : in out          Object_T;
     Object : not null access Subprogram.Object_T)
  is
  begin
    Self.Add_Element (Named_Element.Access_T (Object));
  end Add_Subprogram;

  function Get_Subproject
    (Self : in Object_T;
     Name : in String)
    return not null access Object_T
  is
    Result : access Object_T := null;
  begin
    for Object of Self.Subprojects loop
      if Object.Get_Name = Name then
        Result := Object;
      end if;
    end loop;

    return Result;
  end Get_Subproject;

  overriding
  procedure Visit
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class)
  is
  begin
    Object.Visit_Project (Self);
  end Visit;

end Model.Project;
