with Ada.Text_IO;
with Ada.Exceptions;

separate (Model.Visitor.Template)

package body Visit_Project_Impl is

  Vis_Obj : Model.Visitor.Template.Object_T;
  type Prj_Obj_Access is access constant Model.Project.Object_T'Class;
  Prj_Obj : Prj_Obj_Access := null;

  procedure Initialize
    (Visitor_Object : in out Object_T;
     Project_Object : in     Model.Project.Object_T'Class)
  is
  begin
    Vis_Obj := Visitor_Object;
    Prj_Obj := Project_Object'Unchecked_Access;
  end Initialize;

  procedure Generate_Main_Project_Makefiles;

  procedure Generate_Main_Project
  is
    procedure Debug_Flag_Begin;
    procedure Debug_Flag_End;

    procedure Build_Directories;

    procedure Debug_Flag_Begin
    is
    begin
      Vis_Obj.Content := Vis_Obj.Content &
        "------------------- VISITOR TEMPLATE BEG ------------------" &
        EOL;
      T_IO.Put_Line ("  main project");
    end Debug_Flag_Begin;

    procedure Debug_Flag_End
    is
    begin
      Vis_Obj.Content := Vis_Obj.Content &
        "------------------- VISITOR TEMPLATE END ------------------" &
        EOL;
    end Debug_Flag_End;

    procedure Build_Directories
    is
      Working_Directory : constant String :=
        F_IO.Current_Directory;
    begin
      F_IO.Set_Working_Directory (Working_Directory);
      F_IO.Mkdir (Prj_Obj.Get_Root_Directory);
      F_IO.Set_Working_Directory (Prj_Obj.Get_Root_Directory);
      F_IO.Mkdir ("bin");
      F_IO.Mkdir ("src");
      F_IO.Mkdir ("gpr");
    end Build_Directories;

  begin
    Debug_Flag_Begin;

    Build_Directories;
    Generate_Main_Project_Makefiles;

    for Subproj of Prj_Obj.Get_Subprojects loop
      Subproj.Visit (Vis_Obj);
    end loop;

    Debug_Flag_End;
  end Generate_Main_Project;

  procedure Generate_Subproject
  is
  begin
    F_IO.Mkdir (Prj_Obj.Get_Root_Directory);
    F_IO.Set_Working_Directory
      (F_IO.Compose (F_IO.Current_Directory,
                     Prj_Obj.Get_Root_Directory));
    F_IO.Mkdir ("gpr");
  exception
    when E : others =>
      Ada.Text_IO.Put_Line
        (Ada.Exceptions.Exception_Information (E));
      Ada.Exceptions.Reraise_Occurrence (E);

  end Generate_Subproject;

  -----------------------------------------------------------------------------

  procedure Generate_Main_Makefile;
  procedure Generate_Main_Makefile_Config;
  procedure Generate_Main_Makefile_Common;

  procedure Generate_Main_Project_Makefiles
  is
  begin
    Generate_Main_Makefile;
    Generate_Main_Makefile_Config;
    Generate_Main_Makefile_Common;
  end Generate_Main_Project_Makefiles;

  procedure Generate_Main_Makefile
  is
    Template_Name : constant String := "makefile";
    File_Name     : constant String := "makefile";

    Image : constant access Tmpl.Object_T :=
      Tmpl.Create (Group         => "",
                   Template_File => Template_Name);
  begin
    F_IO.Touch (Path    => File_Name,
                Content => Image.To_String);
  end Generate_Main_Makefile;

  procedure Generate_Main_Makefile_Config
  is
    Template_Name : constant String := "makefile.config";
    File_Name     : constant String := "makefile.config";

    subtype Tag_Names_Array_T is Tmpl.Tag_Names_Array_T
      (1 .. 2);
    Module_Tag       : constant String := "MODULE";
    Project_Name_Tag : constant String := "PROJECT_NAME";

    Tags : constant Tag_Names_Array_T :=
      (new String'(Module_Tag),
       new String'(Project_Name_Tag));

    Image : access Tmpl.Object_T := null;

    ---------------------------
    procedure Set_Module_Names;
    procedure Set_Project_Name;
    ---------------------------
    procedure Set_Module_Names
    is
    begin
      for Module of Prj_Obj.Get_Subprojects loop
        Image.Add_Value (Tag_Name => Module_Tag,
                         Value    => Module.Get_Name);
      end loop;
    end Set_Module_Names;
    ---------------------------
    procedure Set_Project_Name
    is
    begin
      Image.Add_Value (Tag_Name => Project_Name_Tag,
                       Value    => Prj_Obj.Get_Name);

    end Set_Project_Name;
    ---------------------------
  begin
    Image := Tmpl.Create
      (Group         => "",
       Template_File => Template_Name,
       Tag_Names     => Tags);

    Set_Module_Names;
    Set_Project_Name;

    F_IO.Touch (Path    => File_Name,
                Content => Image.To_String);
  end Generate_Main_Makefile_Config;

  procedure Generate_Main_Makefile_Common
  is
    Template_Name : constant String := "makefile.common";
    File_Name     : constant String := "makefile.common";

    Image : constant access Tmpl.Object_T :=
      Tmpl.Create (Group         => "",
                   Template_File => Template_Name);
  begin
    F_IO.Touch (Path    => File_Name,
                Content => Image.To_String);
  end Generate_Main_Makefile_Common;

  -----------------------------------------------------------------------------

end Visit_Project_Impl;
