with Ada.Text_IO;

with Test_Utils;
with Reflection;

--  with Model.Tests;
with Model.Array_Def;
with Model.Package_Def;
with Model.Project.IO;
with Model.Project;
with Model.Class_Def;
with Model.Field;

with Model.Visitor.Printer;
with Model.Visitor.Template;

--  with Ada_Console_Project;

--  with Code.Ada_Language.Tests;
with Template;

procedure Exec is
  package T_IO renames Ada.Text_IO;
  package Unit is new Reflection;

  Local_Package : aliased Model.Package_Def.Object_T;
  Local_Array   : Model.Array_Def.Object_T
    (Owner_Package => Local_Package'Access);

  Prj_Dir  : constant String :=
    "/home/jeremy/workspace/ada/test_gen_code_generator";
  Prj_Name : constant String := "main_project_test";
  Prj_Kind : constant String := "prj_kind";

  package Prj renames Model.Project;
  package Pkg renames Model.Package_Def;
  package Cls renames Model.Class_Def;
  package Fld renames Model.Field;

  Main_Project     : access Prj.Object_T := null;
  Subproject_Exe   : access Prj.Object_T := null;
  Subproject_Model : access Prj.Object_T := null;
  Pkg_Model        : access Pkg.Object_T := null;

  Cls_Element : access Cls.Object_T := null;

  pragma Warnings (Off, "*is assigned but never read");
  Fld_Comments : access Fld.Object_T := null;
  pragma Warnings (On, "*is assigned but never read");

  Cls_Named_Element : access Cls.Object_T := null;

  pragma Warnings (Off, "*is assigned but never read");
  Fld_Name : access Fld.Object_T := null;
  pragma Warnings (On, "*is assigned but never read");

  Printer  : Model.Visitor.Printer.Object_T;
  Template : Model.Visitor.Template.Object_T;

begin

  Main_Project := Prj.Create
    (Name           => Prj_Name,
     Root_Directory => Prj_Dir,
     Kind           => "console");

  Subproject_Model := Prj.Create
    (Name           => "model",
     Kind           => "lib",
     Root_Directory => "model",
     Parent         => Main_Project);

  Main_Project.Add_Subproject (Subproject_Model);

  Subproject_Exe := Prj.Create
    (Name           => "exec",
     Kind           => "bin",
     Root_Directory => "exec",
     Parent         => Main_Project);

  Pkg_Model := Pkg.Create
    (Name => "model");

  Main_Project.Add_Subproject (Subproject_Exe);

  Subproject_Model.Add_Package
    (Pkg_Model);

  Cls_Element := Cls.Create
    (Owner_Package => Pkg_Model,
     Name          => "element");

  Pkg_Model.Add_Public_Class
    (Object => Cls_Element);

  Cls_Named_Element := Cls.Create
    (Owner_Package => Pkg_Model,
     Name          => "named_element");

  Pkg_Model.Add_Public_Class
    (Object => Cls_Named_Element);

  pragma Warnings (Off, "*value might not be referenced");
  Fld_Comments := Fld.Create
    (Owner_Class   => Cls_Element,
     Name          => "Owned_Comments",
     Of_Type       => "Vector_T",
     Default_Value => "Vectors.Empty_Vector");
  pragma Warnings (On, "*value might not be referenced");

  T_IO.Put_Line (Cls_Element.To_String);

  --  Class_1.Add_Field (Fld.Create
  --                       (Owner_Class => Class_1,
  --                        Name        => "field_name_1",
  --                        Of_Type     => "field_type_1"));

  --  declare
  --    Fields : constant String :=
  --      "name_1 : type_1 := def_1; " &
  --        "name_2 : type_2; " &
  --        "name_3 : type_3 := def_3; ";
  --  begin
  --    Project.Add_Fields (To_Class => Class_1,
  --                        Fields   => Fields);
  --  end;

  --  Project.Add_Fields (To_Class => Class_1,
  --                      Fields   => "" &
  --                        "name_1 : type_1 := def_1; " &
  --                        "name_2 : type_2; " &
  --                        "name_3 : type_3 := def_3; ");

  --  Project.Add_Class
  --    (To_Package => "mod_1_package_1",
  --     Object     => "class xx : "&
  --       "name_1 : type_1 := def_1; " &
  --       "name_2 : type_2; " &
  --       "name_3 : type_3 := def_3; ");

  --  Project.Add_Class
  --    (To_Package => "mod_1_package_1",
  --     Object     => "class yy new xx : "&
  --       "name_4 : type_4 (rwc); " &
  --       "name_5 : type_5 (rwc); " &
  --       "name_6 : type_6 (rwc); ");

  --
  --

  --  Main_Project := Main_Project.Add_Subproject
  --    (Name => "module_1",
  --     Kind => "lib")

  --    .Add_Subproject (Name => "module_1",
  --                     Kind => "lib")

  --    .Add_Package (Name => "mod_1_package_1")

  --    .Add_Child_Package (Name => "child_1")

  --    .Add_Class (Name => "class_1")

  --    .Add_Package (Name => "mod_1_package_2")

  --    .Add_Subproject (Name => "module_2",
  --                     Kind => "lib")

  --    .Add_Subproject (Name => "exec",
  --                     Kind => "run");

  --  T_IO.Put_Line (Main_Project.Debug);

  Model.Project.Visit (Main_Project.all, Printer);
  Model.Project.Visit (Main_Project.all, Template);

  T_IO.Put (Printer.To_String);

end Exec;
