with Project_Loader.Class_Impl;

with String_Vectors;

package body Project_Loader is

  -----------------------------------------------------------------------------

  procedure Root_Project
    (Path         : in String;
     Project_Name : in String)
  is
  begin
    Current_Root_Project := Model.Root_Project.Create
      (Name         => Project_Name,
       Kind         => "console",
       In_Directory => Path);
  end Root_Project;

  -----------------------------------------------------------------------------

  procedure Close_Current_Project;
  procedure Close_Current_Package;
  procedure Close_Current_Class;

  -----------------------------------------------------------------------------

  procedure Project
    (Name : in String)
    is separate;

  -----------------------------------------------------------------------------

  procedure Class
    (Input : in String)
  is

    use Project_Loader.Class_Impl;

  begin

    Close_Current_Class;
    Close_Current_Package;

    Check_Global_Input (Input);
    Separate_Data_From_Options (Input);
    Set_Class_Name_And_Heritage;
    Fill_Options_Coll;
    Process_Options;
    Build_Objects;

  end Class;

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
    (Inputs : in String_Array)
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
    Close_Current_Project;
  end Close;

  -----------------------------------------------------------------------------

  procedure Close_Current_Project
  is
  begin
    if Current_Project /= null then
      null;
    end if;
  end Close_Current_Project;

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
      null;
    end if;
  end Close_Current_Class;

  -----------------------------------------------------------------------------

  function Get_Root_Project
    return not null access Model.Root_Project.Object_T'Class
    is (Current_Root_Project);

end Project_Loader;
