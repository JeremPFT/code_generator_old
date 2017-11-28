with Model.Package_Def;

separate (Project_Loader)

procedure Module
  (Name : in String)
is
  function Build_Path
    (Module_Name : in              String;
     In_Project  : not null access Mdl_Prj.Object_T)
    return String;

  function Build_Path
    (Module_Name : in              String;
     In_Project  : not null access Mdl_Prj.Object_T)
    return String
  is
  begin
    return File_IO.Compose (Left  => In_Project.Get_Root_Directory,
                            Right => Module_Name);
  end Build_Path;

  Root_Directory : constant String :=
    Build_Path (Module_Name => Name, In_Project => Project);

  package Mdl_Pkg renames Model.Package_Def;

  Pkg : constant access Mdl_Pkg.Object_T := Mdl_Pkg.Create (Name => Name);

begin
  Last_Module := Mdl_Prj.Create
    (Name           => Name,
     Kind           => "",
     Root_Directory => Root_Directory,
     Parent         => Project);

  Last_Module.Add_Package (Pkg);

  Project.Add_Subproject (Last_Module);
end Module;
