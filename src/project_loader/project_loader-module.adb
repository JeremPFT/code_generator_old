with Model.Package_Def;

separate (Project_Loader)

procedure Module
  (Name : in String)
is
  Root_Directory : constant String := Name;

  package Mdl_Pkg renames Model.Package_Def;

  Pkg : constant access Mdl_Pkg.Object_T := Mdl_Pkg.Create (Name => Name);

begin
  Current_Module := Mdl_Prj.Create
    (Name           => Name,
     Kind           => "",
     Root_Directory => Root_Directory,
     Parent         => Project);

  Current_Module.Add_Package (Pkg);

  Project.Add_Subproject (Current_Module);
end Module;
