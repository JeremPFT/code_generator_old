with Model.Module;
with Model.Project;
with Model.Class_Def;
with String_Vectors;
with Split;

package body Project_Loader is

  -----------------------------------------------------------------------------

  Root_Directory : access String                   := null;
  Project        : access Model.Project.Object_T   := null;
  Current_Module : access Model.Module.Object_T    := null;
  Current_Class  : access Model.Class_Def.Object_T := null;

  -----------------------------------------------------------------------------

  procedure Console_Project
    (Path : in String)
  is
    function Get_Prj_Name (Path : in String) return String;

    function Get_Prj_Name (Path : in String) return String
    is
      Strings : constant String_Vectors.Vector :=
        Split (Source => Path, Separator => "/");
    begin
      return Strings.Last_Element;
    end Get_Prj_Name;

  begin
    Root_Directory := new String'(Path);

    Project := Model.Project.Create
      (Name => Get_Prj_Name (Path),
       Kind => "console");
  end Console_Project;

  -----------------------------------------------------------------------------

  procedure Module
    (Name : in String)
    is separate;

  -----------------------------------------------------------------------------

  procedure Class
    (Input : in String)
    is separate;

  -----------------------------------------------------------------------------

  procedure Field
    (Input : in String)
    is separate;

  -----------------------------------------------------------------------------

  procedure Fields
    (Inputs : in String_Array)
  is
  begin
    for Input of Inputs loop
      Field (Input.all);
    end loop;
  end Fields;

  -----------------------------------------------------------------------------

  procedure Method
    (Input : in String)
  is
  begin
    null;
  end Method;

  -----------------------------------------------------------------------------

  procedure Methods
    (Input : in String_Array)
  is
  begin
    null;
  end Methods;

  -----------------------------------------------------------------------------

  procedure Process_Project
    is separate;

  -----------------------------------------------------------------------------

end Project_Loader;
