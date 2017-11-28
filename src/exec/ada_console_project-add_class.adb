separate (Ada_Console_Project)

function Add_Class
  (Self : access Object_T;
   Name : in     String)
  return not null access Object_T
is
  package T_IO renames Ada.Text_IO;

  --  Pkg     : access Model.Package_Def.Object_T := null;
  --  Pkg_Bis : access Model.Package_Def.Object_T := null;

  Current_Package : constant access Model.Package_Def.Object_T :=
    Self.Get_Current_Package;

begin

  T_IO.Put_Line ("Add_Class : " & Name &
                   " to " & Current_Package.To_Dbg_String);

  --  Pkg := Model.Package_Def.Create
  --    (Name => Name);

  --  Pkg_Bis := Model.Package_Def.Create
  --    (Name => Name & "_2", Parent => Pkg);

  --  Pkg.Add_Child (Pkg_Bis);

  --  Current_Module.Add_Package (Object => Pkg);

  return Self;

end Add_Class;
