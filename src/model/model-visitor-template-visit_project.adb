with Ada.Text_IO;

separate (Model.Visitor.Template)

overriding
procedure Visit_Project
  (Self   : in out Object_T;
   Object : in     Model.Project.Object_T'Class)
is

  package T_IO renames Ada.Text_IO;

  procedure Main;
  procedure Create_Directories;
  procedure Create_Files;
  procedure Debug_Flag_Begin;
  procedure Debug_Flag_End;
  procedure Process_Modules;

  procedure Main is
  begin
    Self.Set_Root_Directory
      (F_IO.Compose (Left  => Self.Get_Root_Directory,
                     Right => Object.Get_Name));

    Debug_Flag_Begin;
    Create_Directories;
    Create_Files;
    Process_Modules;
    Debug_Flag_End;
  end Main;

  procedure Debug_Flag_Begin
  is
  begin
    T_IO.Put_Line
      ("------------------- VISITOR TEMPLATE BEG ------------------");
    T_IO.Put_Line ("  main project");
  end Debug_Flag_Begin;

  procedure Debug_Flag_End
  is
  begin
    T_IO.Put_Line
      ("------------------- VISITOR TEMPLATE END ------------------");
  end Debug_Flag_End;

  procedure Create_Directories
  is
  begin
    if Self.Root_Directory = null then
      raise Not_Initialized with "root_directory not set";
    end if;

    F_IO.Mkdir (Self.Get_Root_Directory);
    F_IO.Set_Working_Directory (Self.Get_Root_Directory);
    F_IO.Mkdir ("bin");
    F_IO.Mkdir ("src");
    F_IO.Mkdir ("gpr");
  end Create_Directories;

  -----------------------------------------------------------------------------

  procedure Create_Main_Makefile;
  procedure Create_Config_Makefile;
  procedure Create_Common_Makefile;

  procedure Create_Files
  is
  begin
    Create_Main_Makefile;
    Create_Config_Makefile;
    Create_Common_Makefile;
  end Create_Files;

  procedure Create_Main_Makefile
  is
    Template_Name : constant String := "makefile";
    File_Name     : constant String := "makefile";

    Image : constant access Tmpl.Object_T :=
      Tmpl.Create (Group         => "",
                   Template_File => Template_Name);
  begin
    F_IO.Touch (Path    => File_Name,
                Content => Image.To_String);
  end Create_Main_Makefile;

  procedure Create_Config_Makefile
  is
    Template_Name : constant String := "makefile.config";
    File_Name     : constant String := "makefile.config";

    function "+" (Item : String) return not null access String
      renames Tmpl."+";

    subtype Tag_Names_Array_T is Tmpl.Tag_Names_Array_T
      (1 .. 2);

    Module_Tag       : constant String := "MODULE";
    Project_Name_Tag : constant String := "PROJECT_NAME";

    Tags : constant Tag_Names_Array_T :=
      (+Module_Tag, +Project_Name_Tag);

    Image : constant access Tmpl.Object_T := Tmpl.Create
      (Group         => "",
       Template_File => Template_Name,
       Tag_Names     => Tags);

  begin
    for Module of Object.Get_Subprojects loop
      Image.Add_Value (Tag_Name => Module_Tag,
                       Value    => Module.Get_Name);
    end loop;

    Image.Add_Value (Tag_Name => Project_Name_Tag,
                     Value    => Object.Get_Name);

    F_IO.Touch (Path    => File_Name,
                Content => Image.To_String);
  end Create_Config_Makefile;

  procedure Create_Common_Makefile
  is
    Template_Name : constant String := "makefile.common";
    File_Name     : constant String := "makefile.common";

    Image : constant access Tmpl.Object_T :=
      Tmpl.Create (Group         => "",
                   Template_File => Template_Name);
  begin
    F_IO.Touch (Path    => File_Name,
                Content => Image.To_String);
  end Create_Common_Makefile;

  procedure Process_Modules
  is
  begin
    for Module of Object.Get_Subprojects loop
      Module.Visit (Self);
    end loop;
  end Process_Modules;

begin
  Main;
end Visit_Project;
