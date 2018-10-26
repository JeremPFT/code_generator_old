with Model.Field;
--  with Model.Module;
with Model.Package_Def;
with Model.Parameter;
with Model.Project;
with Model.Root_Project;
with Model.Operation;
with Model.Types.Class_Def;
with Model.Types.Interface_Def;

package Expected is

  Project_Name        : constant String := "a name for a project";
  Parent_Project_Name : constant String := "a name for a parent project";
  Child_Project_Name  : constant String := "a name for a child project";
  Alone_Project_Name  : constant String := "a name for a project alone";
  Module_Name         : constant String := "a name for a module";
  Project_Kind_1      : constant String := "a kind 1 for a project";
  Project_Kind_2      : constant String := "a kind 2 for a project";
  Project_Kind_3      : constant String := "a kind 3 for a project";

  Root_Project : constant access Model.Root_Project.Object_T :=
    Model.Root_Project.Create
      (Name         => "project",
       Kind         => "test_root_project",
       In_Directory => "path" );

  Project : constant access Model.Project.Object_T :=
    Model.Project.Create
      (Name => "project",
       Kind => "kind");

  --  Module_1 : constant access Model.Module.Object_T :=
  --    Model.Module.Create
  --      (Name   => "module_1",
  --       Kind   => "kind",
  --       Parent => Project);

  --  Module_2 : constant access Model.Module.Object_T :=
  --    Model.Module.Create
  --      (Name   => "module_2",
  --       Kind   => "kind",
  --       Parent => Project);

  --  Package_Module_1 : constant access Model.Package_Def.Object_T :=
  --    Model.Package_Def.Create
  --      (Name           => "package_module_1",
  --       Parent_Package => null);

  --  Package_1 : constant access Model.Package_Def.Object_T :=
  --    Model.Package_Def.Create
  --      (Name           => "package_1",
  --       Parent_Package => Package_Module_1);

  --  Class_1 : constant access Model.Types.Class_Def.Object_T :=
  --    Model.Types.Class_Def.Create
  --      (Owner_Package     => Package_Module_1,
  --       Name              => "class_1",
  --       Parent_Class      => null,
  --       Parent_Interfaces => Model.Types.Interface_Def.Vectors.Empty_Vector,
  --       Is_Abstract       => False);

  --  Class_2 : constant access Model.Types.Class_Def.Object_T :=
  --    Model.Types.Class_Def.Create
  --      (Owner_Package     => Package_Module_1,
  --       Name              => "class_2",
  --       Parent_Class      => null,
  --       Parent_Interfaces => Model.Types.Interface_Def.Vectors.Empty_Vector,
  --       Is_Abstract       => True);

  --  Class_3 : constant access Model.Types.Class_Def.Object_T :=
  --    Model.Types.Class_Def.Create
  --      (Owner_Package     => Package_Module_1,
  --       Name              => "class_3",
  --       Parent_Class      => Class_2,
  --       Parent_Interfaces => Model.Types.Interface_Def.Vectors.Empty_Vector,
  --       Is_Abstract       => False);

  function Get_Project
    return not null access Model.Project.Object_T;

end Expected;
