separate (Ada_Console_Project)

procedure Generate_Main_Makefile_Config
  (Target : access Object_T)
is
  Template_Name : constant String := "makefile.config";
  File_Name     : constant String := "makefile.config";

  Modules_Number : constant Natural :=
    Natural (Target.Project.Get_Subprojects.Length);

  Module_Tag : constant String := "MODULE";

  Project_Name_Tag : constant String := "PROJECT_NAME";

  Tags : constant Templates.Imager.Tag_Names_Array_T (1 .. 2) :=
    (new String'(Module_Tag),
     new String'(Project_Name_Tag));

  Image : access Templates.Imager.Object_T := null;

  procedure Set_Module_Names;
  procedure Set_Project_Name;

  procedure Set_Module_Names
  is
  begin
    for Module of Target.Project.Get_Subprojects loop
      Image.Add_Value (Tag_Name => Module_Tag,
                       Value    => Module.Get_Name);
    end loop;
  end Set_Module_Names;

  procedure Set_Project_Name
  is
  begin
    Image.Add_Value (Tag_Name => Project_Name_Tag,
                     Value    => Target.Project.Get_Name);

  end Set_Project_Name;

begin
  Image := Templates.Imager.Create
    (Group         => "",
     Template_File => Template_Name,
     Tag_Names     => Tags);

  Set_Module_Names;
  Set_Project_Name;

  Touch (Path    => File_Name,
         Content => Image.To_String);
end Generate_Main_Makefile_Config;
