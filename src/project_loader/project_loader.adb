with Model.Module;
with Model.Class_Def;
with Model.Package_Def;
with String_Vectors;

package body Project_Loader is

  -----------------------------------------------------------------------------

  Current_Project : access Model.Project.Object_T     := null;
  Current_Package : access Model.Package_Def.Object_T := null;
  Current_Module  : access Model.Module.Object_T      := null;
  Current_Class   : access Model.Class_Def.Object_T   := null;

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
    if Current_Class /= null then
      Current_Package.Add_Public_Class (Current_Class);

      for I in 1 .. Current_Class.Number_Of_Public_Subprograms loop
        Current_Package.Add_Public_Subprogram
          (Current_Class.Get_Public_Subprogram (I));
      end loop;

      for I in 1 .. Current_Class.Number_Of_Private_Subprograms loop
        Current_Package.Add_Private_Subprogram
          (Current_Class.Get_Private_Subprogram (I));
      end loop;

    end if;
  end Close_Current_Class;

  -----------------------------------------------------------------------------

end Project_Loader;
