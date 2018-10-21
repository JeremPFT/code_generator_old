with String_Vectors;

private package Project_Loader.Class_Impl is

  type Parsed_Data_T is
    record
      Class_Data : access String := null;
      Options    : access String := null;

      Class_Name : access String         := null;
      Heritage   : String_Vectors.Vector := String_Vectors.Empty_Vector;

      Options_Coll : String_Vectors.Vector := String_Vectors.Empty_Vector;

      Opt_Abstract : Boolean := False;
      --  Has_Create  : Boolean := False;
    end record;

  Parsed_Data : Parsed_Data_T;

  procedure Check_Global_Input (Input : in String);

  procedure Separate_Data_From_Options (Input : in String);

  procedure Set_Class_Name_And_Heritage;

  procedure Fill_Options_Coll;

  procedure Process_Options;

  procedure Build_Objects;

end Project_Loader.Class_Impl;
