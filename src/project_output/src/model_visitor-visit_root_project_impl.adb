with Model.Root_Project;
with Templates;
with File_IO;
with Ada.Text_IO;
with Ada.Tags;

package body Model_Visitor.Visit_Root_Project_Impl is

  package T_IO renames Ada.Text_IO;
  package F_IO renames File_IO;
  package Tmpl renames Standard.Templates;

  procedure Init_Impl
    (Visitor : in out          Object_T;
     Object  : not null access Model.Root_Project.Object_T'Class)
  is
  begin
    T_IO.Put_Line (Ada.Tags.Expanded_Name (Object'Tag));

    Visit_Root_Project_Impl.Visitor      := Visitor;
    Visit_Root_Project_Impl.Root_Project := Object;
  end Init_Impl;

  procedure Debug_Flag_Begin
  is
  begin
    T_IO.Put_Line
      ("-----------------------------------------------------------");
    T_IO.Put_Line
      ("------------------- VISITOR TEMPLATE BEG ------------------");
    T_IO.Put_Line
      ("-----------------------------------------------------------");
    T_IO.Put_Line ("  main project");
  end Debug_Flag_Begin;

  procedure Debug_Flag_End
  is
  begin
    T_IO.Put_Line
      ("-----------------------------------------------------------");
    T_IO.Put_Line
      ("------------------- VISITOR TEMPLATE END ------------------");
    T_IO.Put_Line
      ("-----------------------------------------------------------");
  end Debug_Flag_End;

  procedure Create_Directories
  is
  begin
    if Visitor.Root_Directory = null then
      raise Not_Initialized with "root_directory not set";
    end if;

    F_IO.Mkdir (Visitor.Get_Root_Directory);
    F_IO.Set_Working_Directory (Visitor.Get_Root_Directory);
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
      Tmpl.Create (Template_File => Template_Name);
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
      (Template_File => Template_Name,
       Tag_Names     => Tags);

  begin
    for Module of Root_Project.Get_Subprojects loop
      Image.Add_Value (Tag_Name => Module_Tag,
                       Value    => Module.Get_Name);
    end loop;

    Image.Add_Value (Tag_Name => Project_Name_Tag,
                     Value    => Root_Project.Get_Name);

    F_IO.Touch (Path    => File_Name,
                Content => Image.To_String);
  end Create_Config_Makefile;

  procedure Create_Common_Makefile
  is
    Template_Name : constant String := "makefile.common";
    File_Name     : constant String := "makefile.common";

    Image : constant access Tmpl.Object_T :=
      Tmpl.Create (Template_File => Template_Name);
  begin
    F_IO.Touch (Path    => File_Name,
                Content => Image.To_String);
  end Create_Common_Makefile;

  procedure Process_Modules
  is
  begin
    for Module of Root_Project.Get_Subprojects loop
      Module.Visit (Visitor);
    end loop;
  end Process_Modules;

end Model_Visitor.Visit_Root_Project_Impl;
