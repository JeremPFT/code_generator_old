with Model.Package_Def;
with Model.Module;

separate (Project_Loader)

procedure Module
  (Name : in String)
is
  Pkg : constant access Model.Package_Def.Object_T :=
    Model.Package_Def.Create (Name => Name);

begin
  Current_Module := Model.Module.Create
    (Name   => Name,
     Kind   => "",
     Parent => Project);

  Current_Module.Add_Package (Pkg);

  Project.Add_Subproject (Current_Module);
end Module;
