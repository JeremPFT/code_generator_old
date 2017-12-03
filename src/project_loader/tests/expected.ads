with Model.Project;
with Model.Module;
with Model.Package_Def;
with Model.Interface_Def;
with Model.Class_Def;
with Model.Field;
with Model.Subprogram;
with Model.Parameter;

package Expected is

  Path : constant String := "path";

  Project : constant access Model.Project.Object_T :=
    Model.Project.Create (Name => "project",
                          Kind => "kind");

  Module_1 : constant access Model.Module.Object_T :=
    Model.Module.Create (Name   => "module_1",
                         Kind   => "kind",
                         Parent => Project);

  Module_2 : constant access Model.Module.Object_T :=
    Model.Module.Create (Name   => "module_2",
                         Kind   => "kind",
                         Parent => Project);

  Package_Module_1 : constant access Model.Package_Def.Object_T :=
    Model.Package_Def.Create (Name   => "package_1",
                              Parent => null);

  Package_1 : constant access Model.Package_Def.Object_T :=
    Model.Package_Def.Create (Name   => "package_1",
                              Parent => Package_Module_1);

  Class_1 : constant access Model.Class_Def.Object_T :=
    Model.Class_Def.Create (Owner_Package     => Package_Module_1,
                            Name              => "class_1",
                            Parent_Class      => null,
                            Parent_Interfaces => Model.Interface_Def.Vectors.Empty_Vector,
                            Is_Abstract       => False);

  Class_2 : constant access Model.Class_Def.Object_T :=
    Model.Class_Def.Create (Owner_Package     => Package_Module_1,
                            Name              => "class_2",
                            Parent_Class      => null,
                            Parent_Interfaces => Model.Interface_Def.Vectors.Empty_Vector,
                            Is_Abstract       => True);

  Class_3 : constant access Model.Class_Def.Object_T :=
    Model.Class_Def.Create (Owner_Package     => Package_Module_1,
                            Name              => "class_3",
                            Parent_Class      => Class_2,
                            Parent_Interfaces => Model.Interface_Def.Vectors.Empty_Vector,
                            Is_Abstract       => False);

  function Get_Project
    return not null access Model.Project.Object_T;

end Expected;
