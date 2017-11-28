with Ada.Text_IO;
with File_IO;

with Model.Element;
with Model.Project;
with Model.Package_Def;
with Model.Class_Def;
with Model.Field;
with Model.Parameter;
with Model.Subprogram;

with Template;

package body Model.Visitor.Template is

  package T_IO renames Ada.Text_IO;
  package F_IO renames File_IO;

  package Tmpl renames Standard.Template;

  -----------------------------------------------------------------------------

  procedure Generate_Main_Project
    (Self   : in out Object_T;
     Object : in     Model.Project.Object_T'Class);

  procedure Generate_Main_Makefile
    (Self   : in out Object_T;
     Object : in     Model.Project.Object_T'Class);

  procedure Generate_Main_Makefile_Config
    (Self   : in out Object_T;
     Object : in     Model.Project.Object_T'Class);

  procedure Generate_Main_Makefile_Common
    (Self   : in out Object_T;
     Object : in     Model.Project.Object_T'Class);

  procedure Generate_Subproject
    (Self   : in out Object_T;
     Object : in     Model.Project.Object_T'Class);

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Element
    (Self   : in out Object_T;
     Object : in     Model.Element.Object_T'Class)
  is
    pragma Unreferenced (Self, Object);
  begin
    T_IO.Put_Line ("visit_element");
  end Visit_Element;

  overriding
  procedure Visit_Project
    (Self   : in out Object_T;
     Object : in     Model.Project.Object_T'Class)
  is
  begin
    T_IO.Put_Line ("visit_project " & Object.Get_Name);

    if Object.Has_Parent then
      T_IO.Put_Line ("  subproject");

      F_IO.Set_Working_Directory
        (F_IO.Compose
           (Left  => Object.Get_Parent.Get_Root_Directory,
            Right => "src"));
      Generate_Subproject (Self, Object);
    else
      T_IO.Put_Line ("  main project");

      Generate_Main_Project (Self, Object);

      for Subproj of Object.Get_Subprojects loop
        Subproj.Visit (Self);
      end loop;
    end if;
  end Visit_Project;

  overriding
  procedure Visit_Package
    (Self   : in out Object_T;
     Object : in     Model.Package_Def.Object_T'Class)
  is
    pragma Unreferenced (Self, Object);
  begin
    T_IO.Put_Line ("visit_package");
  end Visit_Package;

  overriding
  procedure Visit_Comment
    (Self   : in out Object_T;
     Object : in     Model.Comment.Object_T'Class)
  is
    pragma Unreferenced (Self, Object);
  begin
    T_IO.Put_Line ("visit_comment");
  end Visit_Comment;

  overriding
  procedure Visit_Class
    (Self   : in out Object_T;
     Object : in     Model.Class_Def.Object_T'Class)
  is
    pragma Unreferenced (Self, Object);
  begin
    T_IO.Put_Line ("visit_class");
  end Visit_Class;

  overriding
  procedure Visit_Interface
    (Self   : in out Object_T;
     Object : in     Model.Interface_Def.Object_T'Class)
  is
    pragma Unreferenced (Self, Object);
  begin
    T_IO.Put_Line ("visit_interface");
  end Visit_Interface;

  overriding
  procedure Visit_Field
    (Self   : in out Object_T;
     Object : in     Model.Field.Object_T'Class)
  is
    pragma Unreferenced (Self, Object);
  begin
    T_IO.Put_Line ("visit_field");
  end Visit_Field;

  overriding
  procedure Visit_Subprogram
    (Self   : in out Object_T;
     Object : in     Model.Subprogram.Object_T'Class)
  is
    pragma Unreferenced (Self, Object);
  begin
    T_IO.Put_Line ("visit_subprogram");
  end Visit_Subprogram;

  overriding
  procedure Visit_Parameter
    (Self   : in out Object_T;
     Object : in     Model.Parameter.Object_T'Class)
  is
    pragma Unreferenced (Self, Object);
  begin
    T_IO.Put_Line ("visit_parameter");
  end Visit_Parameter;

  function To_String
    (Self : in Object_T)
    return String
    is ("");

  procedure Generate_Main_Project
    (Self   : in out Object_T;
     Object : in     Model.Project.Object_T'Class)
  is
    Working_Directory : constant String :=
      F_IO.Current_Directory;
  begin
    F_IO.Set_Working_Directory (Working_Directory);
    F_IO.Mkdir (Object.Get_Root_Directory);
    F_IO.Set_Working_Directory (Object.Get_Root_Directory);
    F_IO.Mkdir ("bin");
    F_IO.Mkdir ("src");
    F_IO.Mkdir ("gpr");

    Generate_Main_Makefile (Self, Object);
    Generate_Main_Makefile_Config (Self, Object);
    Generate_Main_Makefile_Common (Self, Object);
  end Generate_Main_Project;

  procedure Generate_Subproject
    (Self   : in out Object_T;
     Object : in     Model.Project.Object_T'Class)
  is
    pragma Unreferenced (Self);
  begin
    F_IO.Mkdir (Object.Get_Root_Directory);
    F_IO.Set_Working_Directory
      (F_IO.Compose (F_IO.Current_Directory,
                     Object.Get_Root_Directory));
    F_IO.Mkdir ("gpr");
  end Generate_Subproject;

  procedure Generate_Main_Makefile
    (Self   : in out Object_T;
     Object : in     Model.Project.Object_T'Class)
  is
    pragma Unreferenced (Self, Object);

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
    (Self   : in out Object_T;
     Object : in     Model.Project.Object_T'Class)
  is
    pragma Unreferenced (Self);

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
      for Module of Object.Get_Subprojects loop
        Image.Add_Value (Tag_Name => Module_Tag,
                         Value    => Module.Get_Name);
      end loop;
    end Set_Module_Names;
    ---------------------------
    procedure Set_Project_Name
    is
    begin
      Image.Add_Value (Tag_Name => Project_Name_Tag,
                       Value    => Object.Get_Name);

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
    (Self   : in out Object_T;
     Object : in     Model.Project.Object_T'Class)
  is
    pragma Unreferenced (Self, Object);

    Template_Name : constant String := "makefile.common";
    File_Name     : constant String := "makefile.common";

    Image : constant access Tmpl.Object_T :=
      Tmpl.Create (Group         => "",
                   Template_File => Template_Name);
  begin
    F_IO.Touch (Path    => File_Name,
                Content => Image.To_String);
  end Generate_Main_Makefile_Common;

end Model.Visitor.Template;
