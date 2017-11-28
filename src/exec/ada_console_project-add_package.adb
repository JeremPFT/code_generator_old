with Model.Project;
with Model.Package_Def;

separate (Ada_Console_Project)

function Add_Package
  (Self : access Object_T;
   Name : in     String)
  return not null access Object_T
is
  package T_IO renames Ada.Text_IO;

  Pkg     : access Model.Package_Def.Object_T := null;
  Pkg_Bis : access Model.Package_Def.Object_T := null;

  Modules : constant Model.Project.Vector_T := Self.Project.Get_Subprojects;

  Current_Module : constant Model.Project.Access_T :=
    Model.Project.Access_T (Model.Project.Vectors.Element
                              (Modules.Last));

begin

  T_IO.Put_Line ("Add_Package : " & Name &
                   " to " & Current_Module.To_Dbg_String);

  Pkg := Model.Package_Def.Create
    (Name => Name);

  Pkg_Bis := Model.Package_Def.Create
    (Name => Name & "_2", Parent => Pkg);

  Pkg.Add_Child (Pkg_Bis);

  Current_Module.Add_Package (Object => Pkg);

  return Self;

end Add_Package;
