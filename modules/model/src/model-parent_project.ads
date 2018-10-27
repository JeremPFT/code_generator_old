with Ada.Containers.Vectors;

limited with Model.Visitor;
with Model.Project;

package Model.Parent_Project is

  package Parent_Pkg renames Model.Project;

  type Object_T is new Parent_Pkg.Object_T with private;

  type Access_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  function Create
    (Name         : in String;
     Kind         : in String;
     In_Directory : in String)
    return not null access Object_T'Class;

  function Get_Directory
    (Self : in Object_T)
    return String;

  not overriding
  function Get_Subprojects
    (Self : in Object_T)
    return Project.Vector_T;

  not overriding
  function Get_Subproject
    (Self : in Object_T;
     Name : in String)
    return not null access Project.Object_T'Class;

  not overriding
  function Get_Subproject
    (Self  : in Object_T;
     Index : in Positive)
    return not null access Project.Object_T'Class;

  not overriding
  procedure Add_Subproject
    (Self       : in out          Object_T;
     Subproject : not null access Project.Object_T'Class);

  overriding
  procedure Visit
    (Self   : in out Object_T;
     Object : in out Visitor.Object_T'Class);

  procedure Initialize
    (Self         : in out Object_T'Class;
     Name         : in     String;
     Kind         : in     String;
     In_Directory : in     String);

private

  type Object_T
    is new Parent_Pkg.Object_T
    with record
      In_Directory : access String    := null;
      Subprojects  : Project.Vector_T := Project.Vectors.Empty_Vector;
    end record;

  function Get_Directory
    (Self : in Object_T)
    return String
    is (Self.In_Directory.all);

  not overriding
  function Get_Subprojects
    (Self : in Object_T)
    return Project.Vector_T
    is (Self.Subprojects);

end Model.Parent_Project;
