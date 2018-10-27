--  with Ada.Exceptions;
--  with Ada.Text_IO;
with Model.Visitor;

package body Model.Parent_Project is

  procedure Initialize
    (Self         : in out Object_T'Class;
     Name         : in     String;
     Kind         : in     String;
     In_Directory : in     String)
  is
  begin
    Parent_Pkg.Initialize (Self => Self,
                           Name => Name,
                           Kind => Kind);

    Self.In_Directory := new String'(In_Directory);
  end Initialize;

  function Create
    (Name         : in String;
     Kind         : in String;
     In_Directory : in String)
    return not null access Object_T'Class
  is
    Object : constant access Object_T := new Object_T;
  begin
    Object.Initialize (Name, Kind, In_Directory);
    return Object;
  end Create;

  procedure Add_Subproject
    (Self       : in out          Object_T;
     Subproject : not null access Project.Object_T'Class)
  is
  begin
    Self.Subprojects.Append (Subproject);
  end Add_Subproject;

  function Get_Subproject
    (Self : in Object_T;
     Name : in String)
    return not null access Project.Object_T'Class
  is
    Result : access Project.Object_T := null;
  begin
    for Object of Self.Subprojects loop
      if Object.Get_Name = Name then
        Result := Object;
      end if;
    end loop;

    return Result;
    --  exception
    --    when Constraint_Error =>
    --      raise Constraint_Error with "no subproject with name """ & Name & """";
  end Get_Subproject;

  not overriding
  function Get_Subproject
    (Self  : in Object_T;
     Index : in Positive)
    return not null access Project.Object_T'Class
  is
  begin
    return Self.Subprojects (Index);
  end Get_Subproject;

  overriding
  procedure Visit
    (Self   : in out Object_T;
     Object : in out Visitor.Object_T'Class)
  is
  begin
    Object.Visit_Parent_Project (Self);
  end Visit;

end Model.Parent_Project;
