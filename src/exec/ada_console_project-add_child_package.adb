with Model.Named_Element;

separate (Ada_Console_Project)

function Add_Child_Package
  (Self : access Object_T;
   Name : in     String)
  return not null access Object_T
is
  package T_IO renames Ada.Text_IO;

  Pkg : access Model.Package_Def.Object_T := null;

  --  Modules : constant Model.Project.Vector_T := Self.Project.Get_Children;

  --  Current_Module : constant Model.Project.Access_T :=
  --    Model.Project.Access_T (Model.Project.Vectors.Element
  --                              (Modules.Last));

  --  Elements : constant Model.Named_Element.Vector_T :=
  --    Current_Module.Get_Elements;

  --  Current_Element : constant access Model.Named_Element.Object_T'Class :=
  --    Model.Named_Element.Vectors.Element (Elements.Last);

  --  Current_Package : access Model.Package_Def.Object_T := null;

  Current_Package : constant access Model.Package_Def.Object_T :=
    Self.Get_Current_Package;

begin

  --  if Current_Element.all not in
  --    Model.Package_Def.Object_T'Class
  --  then
  --    raise Constraint_Error with "last element not a package";
  --  end if;

  --  Current_Package := Model.Package_Def.Access_T (Current_Element);

  T_IO.Put_Line ("Add_Child_Package : " & Name &
                   " to " & Current_Package.To_Dbg_String);

  Pkg := Model.Package_Def.Create
    (Name => Name, Parent => Current_Package);

  Current_Package.Add_Child (Pkg);

  return Self;

end Add_Child_Package;
