with Model.Module;
with Model.Namespace;
with Model.Package_Def;
with Model.Types.Class_Def;

with String_Vectors;

package body Project_Loader is

  -----------------------------------------------------------------------------

  Current_Project   : access Model.Project.Object_T'Class         := null;
  Current_Package   : access Model.Package_Def.Object_T'Class     := null;
  Current_Namespace : access Model.Namespace.Object_T'Class       := null;
  Current_Module    : access Model.Module.Object_T'Class          := null;
  Current_Class     : access Model.Types.Class_Def.Object_T'Class := null;

  -----------------------------------------------------------------------------

  Data : Data_T;

  procedure Project
    (Path         : in String;
     Project_Name : in String)
  is
  begin
    Current_Project := Model.Project.Create
      (Name => Project_Name,
       Kind => "console");

    Data.Path    := new String'(Path);
    Data.Project := Current_Project;
  end Project;

  -----------------------------------------------------------------------------

  procedure Close_Current_Module;
  procedure Close_Current_Package;
  procedure Close_Current_Class;

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

  procedure Operation
    (Input : in String)
    is separate;

  -----------------------------------------------------------------------------

  procedure Operations
    (Input : in String_Array)
  is
  begin
    for Input of Inputs loop
      Operation (Input.all);
    end loop;
  end Operations;

  -----------------------------------------------------------------------------

  procedure Close
  is
  begin
    Close_Current_Class;
    Close_Current_Package;
    Close_Current_Module;
  end Close;

  -----------------------------------------------------------------------------

  function Get_Data
    return Data_T
  is
  begin
    return Data;
  end Get_Data;

  -----------------------------------------------------------------------------

  procedure Close_Current_Module
  is
  begin
    if Current_Module /= null then
      null;
    end if;
  end Close_Current_Module;

  procedure Close_Current_Package
  is
  begin
    if Current_Package /= null then
      null;
    end if;
  end Close_Current_Package;

  procedure Close_Current_Class
  is
  begin
    null;
  end Close_Current_Class;

  -----------------------------------------------------------------------------

end Project_Loader;
