with Model.Field;
with Model.Module;
with Model.Package_Def;
with Model.Parameter;
with Model.Project;
with Model.Subprogram;
with Model.Types.Class_Def;
with Model.Types.Interface_Def;

package Expected is

  Path : constant String := "path";

  Project : constant access Model.Project.Object_T :=
    Model.Project.Create
      (Name => "project",
       Kind => "kind");

  Module_1 : constant access Model.Module.Object_T :=
    Model.Module.Create
      (Name   => "module_1",
       Kind   => "kind",
       Parent => Project);

  Module_2 : constant access Model.Module.Object_T :=
    Model.Module.Create
      (Name   => "module_2",
       Kind   => "kind",
       Parent => Project);

  Package_Module_1 : constant access Model.Package_Def.Object_T :=
    Model.Package_Def.Create
      (Name           => "package_module_1",
       Parent_Package => null);

  Package_1 : constant access Model.Package_Def.Object_T :=
    Model.Package_Def.Create
      (Name           => "package_1",
       Parent_Package => Package_Module_1);

  Class_1 : constant access Model.Types.Class_Def.Object_T :=
    Model.Types.Class_Def.Create
      (Owner_Package     => Package_Module_1,
       Name              => "class_1",
       Parent_Class      => null,
       Parent_Interfaces => Model.Types.Interface_Def.Vectors.Empty_Vector,
       Is_Abstract       => False);

  Class_2 : constant access Model.Types.Class_Def.Object_T :=
    Model.Types.Class_Def.Create
      (Owner_Package     => Package_Module_1,
       Name              => "class_2",
       Parent_Class      => null,
       Parent_Interfaces => Model.Types.Interface_Def.Vectors.Empty_Vector,
       Is_Abstract       => True);

  Class_3 : constant access Model.Types.Class_Def.Object_T :=
    Model.Types.Class_Def.Create
      (Owner_Package     => Package_Module_1,
       Name              => "class_3",
       Parent_Class      => Class_2,
       Parent_Interfaces => Model.Types.Interface_Def.Vectors.Empty_Vector,
       Is_Abstract       => False);

  function Get_Project
    return not null access Model.Project.Object_T;

end Expected;
