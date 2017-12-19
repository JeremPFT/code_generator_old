with Model.Named_Element;
with Model.Package_Def;
with Model.Project;

separate (Project_Loader)

procedure Project
  (Name : in String)
is
  Pkg : constant access Model.Package_Def.Object_T :=
    Model.Package_Def.Create
      (Name       => Name,
       Visibility => Model.Named_Element.Public_Visibility);

begin
  Close_Current_Class;
  Close_Current_Package;
  Close_Current_Project;

  Current_Project := Model.Project.Create
    (Name   => Name,
     Kind   => "",
     Parent => Current_Root_Project);

  Current_Project.Add_Package (Pkg);

  Current_Root_Project.Add_Subproject (Current_Project);
end Project;
