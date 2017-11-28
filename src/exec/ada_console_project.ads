with Model.Project;
with Model.Package_Def;

package Ada_Console_Project is

  type Object_T is tagged private;

  function Main_Project
    (Name           : in     String;
     Root_Directory : in     String)
    return not null access Object_T;

  function Add_Subproject
    (Self : access Object_T;
     Name : in     String;
     Kind : in     String)
    return not null access Object_T;

  procedure Add_Subproject
    (Self   : access          Object_T;
     Object : not null access Model.Project.Object_T);

  function Add_Package
    (Self : access Object_T;
     Name : in     String)
    return not null access Object_T;

  procedure Add_Package
    (Self   : access          Object_T;
     Object : not null access Model.Package_Def.Object_T);

  function Add_Child_Package
    (Self : access Object_T;
     Name : in     String)
    return not null access Object_T;

  function Add_Class
    (Self : access Object_T;
     Name : in     String)
    return not null access Object_T;

  function Get_Current_Subproject
    (Self : access Object_T)
    return not null access Model.Project.Object_T;

  function Get_Current_Package
    (Self : access Object_T)
    return not null access Model.Package_Def.Object_T;

  procedure Generate_Project
    (Self : access Object_T);

  function Debug
    (Self : in Object_T)
    return String;

private

  type Object_T is tagged
    record
      Project : access Model.Project.Object_T := null;
    end record;

end Ada_Console_Project;
