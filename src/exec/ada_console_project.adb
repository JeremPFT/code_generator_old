with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Characters.Latin_1;

with Model.Project.IO;
with Model.Package_Def;
with Model.Named_Element;
with Templates.Imager;
with File_IO; use File_IO;

package body Ada_Console_Project is

  procedure Generate_Main_Makefile
    (Target : access Object_T);

  procedure Generate_Main_Makefile_Common
    (Target : access Object_T);

  procedure Generate_Main_Makefile_Config
    (Target : access Object_T);

  procedure Generate_Subproject
    (Target : access Object_T;
     Object : access Model.Project.Object_T);

  procedure Generate_Package
    (Target     : access Object_T;
     Object_Pkg : access Model.Package_Def.Object_T);

  function Main_Project
    (Name           : in     String;
     Root_Directory : in     String)
    return not null access Object_T
  is
    Project : constant access Model.Project.Object_T :=
      Model.Project.Create
        (Name           => Name,
         Kind           => "root",
         Root_Directory => Root_Directory);

    Result : constant access Object_T :=
      new Object_T'(Project => Project);

  begin
    return Result;
  end Main_Project;

  function Add_Subproject
    (Self : access Object_T;
     Name : in     String;
     Kind : in     String)
    return not null access Object_T
      is separate;

  procedure Add_Subproject
    (Self   : access          Object_T;
     Object : not null access Model.Project.Object_T)
  is
  begin
    Self.Project.Add_Subproject (Object);
  end Add_Subproject;

  function Add_Package
    (Self : access Object_T;
     Name : in     String)
    return not null access Object_T
      is separate;

  procedure Add_Package
    (Self   : access          Object_T;
     Object : not null access Model.Package_Def.Object_T)
  is
    Subprojects : constant Model.Project.Vector_T :=
      Self.Project.Get_Subprojects;

    Current_Subproject : constant Model.Project.Access_T :=
      Model.Project.Access_T (Model.Project.Vectors.Element
                                (Subprojects.Last));
  begin

    Current_Subproject.Add_Package (Object => Object);

  end Add_Package;

  function Add_Child_Package
    (Self : access Object_T;
     Name : in     String)
    return not null access Object_T
      is separate;

  function Add_Class
    (Self : access Object_T;
     Name : in String)
    return not null access Object_T
      is separate;

  function Get_Current_Subproject
    (Self : access Object_T)
    return not null access Model.Project.Object_T
  is
    Subprojects : constant Model.Project.Vector_T :=
      Self.Project.Get_Subprojects;

    Current_Subproject : constant Model.Project.Access_T :=
      Model.Project.Access_T (Model.Project.Vectors.Element
                                (Subprojects.Last));
  begin
    return Current_Subproject;
  end Get_Current_Subproject;

  function Get_Current_Package
    (Self : access Object_T)
    return not null access Model.Package_Def.Object_T
  is
    package N_E renames Model.Named_Element;
    package Pkg renames Model.Package_Def;
    package Prj renames Model.Project;

    Current_Subproject : constant Prj.Access_T :=
      Self.Get_Current_Subproject;

    Elements : constant N_E.Vector_T :=
      Current_Subproject.Get_Elements;

    Current_Element : constant access N_E.Object_T'Class :=
      Model.Named_Element.Vectors.Element (Elements.Last);

    Current_Package : access Pkg.Object_T := null;
  begin
    if Current_Element.all not in Pkg.Object_T'Class
    then
      raise Constraint_Error with "last element not a package";
    end if;

    Current_Package := Pkg.Access_T (Current_Element);
    return Current_Package;
  end Get_Current_Package;

  procedure Generate_Project
    (Self : access Object_T)
    is separate;

  function Debug
    (Self : in Object_T)
    return String
  is
    package U_Str renames Ada.Strings.Unbounded;
    package Latin_1 renames Ada.Characters.Latin_1;

    Result : U_Str.Unbounded_String;

    use type U_Str.Unbounded_String;

    package T_IO renames Ada.Text_IO;

    Eol : constant String := Latin_1.CR & Latin_1.LF;

    function To_String
      (Object : access Model.Project.Object_T)
      return String
      renames Model.Project.IO.To_String;

  begin
    Result := Result &
      To_String (Self.Project) &
      Eol;

    for Subproject of Self.Project.Get_Subprojects loop
      Result := Result &
        To_String (Model.Project.Access_T (Subproject)) &
        Eol;
    end loop;

    return U_Str.To_String (Result);
  end Debug;

  procedure Generate_Main_Makefile
    (Target : access Object_T)
  is
    Template_Name : constant String := "makefile";
    File_Name     : constant String := "makefile";

    Image : constant access Templates.Imager.Object_T :=
      Templates.Imager.Create (Group         => "",
                               Template_File => Template_Name);

    File_Content : constant String := Image.To_String;
  begin
    Touch (Path    => File_Name,
           Content => Image.To_String);
  end Generate_Main_Makefile;

  procedure Generate_Main_Makefile_Common
    (Target : access Object_T)
  is
    Template_Name : constant String := "makefile.common";
    File_Name     : constant String := "makefile.common";

    Image : constant access Templates.Imager.Object_T :=
      Templates.Imager.Create (Group         => "",
                               Template_File => Template_Name);

    File_Content : constant String := Image.To_String;
  begin
    Touch (Path    => File_Name,
           Content => Image.To_String);
  end Generate_Main_Makefile_Common;

  procedure Generate_Main_Makefile_Config
    (Target : access Object_T)
    is separate;

  procedure Generate_Subproject
    (Target : access Object_T;
     Object : access Model.Project.Object_T)
    is separate;

  procedure Generate_Package
    (Target     : access Object_T;
     Object_Pkg : access Model.Package_Def.Object_T)
    is separate;

end Ada_Console_Project;
