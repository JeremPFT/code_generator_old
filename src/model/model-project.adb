--  with Ada.Exceptions;
--  with Ada.Text_IO;
with Model.Visitor;

package body Model.Project is

  procedure Initialize
    (Self : in out Object_T'Class;
     Name : in     String;
     Kind : in     String)
  is
  begin
    Parent_Pkg.Initialize (Self            => Self,
                           Name            => Name,
                           Owner_Namespace => null);

    Self.Kind := new String'(Kind);
  end Initialize;

  function Create
    (Name : in     String;
     Kind : in     String)
    return not null access Object_T'Class
  is
    Object : constant access Object_T :=
      new Object_T;
  begin
    Object.Initialize (Name, Kind);
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
     Object : not null access Named_Element.Object_T'Class)
  is
  begin
    Self.Elements.Append (Object);
  end Add_Element;

  procedure Add_Package
    (Self   : in out          Object_T;
     Object : not null access Package_Def.Object_T'Class)
  is
  begin
    Self.Add_Element (Named_Element.Access_T (Object));
  end Add_Package;

  procedure Add_Class
    (Self   : in out          Object_T;
     Object : not null access Types.Class_Def.Object_T'Class)
  is
  begin
    Self.Add_Element (Named_Element.Access_T (Object));
  end Add_Class;

  procedure Add_Operation
    (Self   : in out          Object_T;
     Object : not null access Operation.Object_T'Class)
  is
  begin
    Self.Add_Element (Named_Element.Access_T (Object));
  end Add_Operation;

  function Get_Subproject
    (Self : in Object_T;
     Name : in String)
    return not null access Object_T'Class
  is
    Result : access Object_T := null;
  begin
    for Object of Self.Subprojects loop
      if Object.Get_Name = Name then
        Result := Object;
      end if;
    end loop;

    return Result;
  exception
    when Constraint_Error =>
      raise Constraint_Error with "no subproject with name """ & Name & """";
  end Get_Subproject;

  not overriding
  function Get_Subproject
    (Self  : in Object_T;
     Index : in Positive)
    return not null access Object_T'Class
  is
  begin
    return Self.Subprojects (Index);
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
