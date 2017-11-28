separate (Ada_Console_Project)

function Add_Subproject
  (Self : access Object_T;
   Name : in     String;
   Kind : in     String)
  return not null access Object_T
is
  package T_IO renames Ada.Text_IO;

  Child : constant access Model.Project.Object_T :=
    Model.Project.Create
      (Name           => Name,
       Kind           => Kind,
       Root_Directory => Self.Project.Get_Root_Directory &
         "/src/" & Name,
       Parent         => Model.Project.Access_T (Self.Project));
begin
  T_IO.Put_Line ("Add_Subproject : " & Name &
                   " to " & Self.Project.To_Dbg_String);

  Self.Project.Add_Subproject (Child);
  return Self;
end Add_Subproject;
