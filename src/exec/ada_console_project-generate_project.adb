separate (Ada_Console_Project)

procedure Generate_Project
  (Self : access Object_T)
is
  Working_Directory : constant String :=
    Current_Directory;
begin
  Set_Working_Directory (Working_Directory);

  Mkdir (Self.Project.Get_Root_Directory);

  Set_Working_Directory (Self.Project.Get_Root_Directory);

  Mkdir ("bin");
  Mkdir ("src");
  Mkdir ("gpr");

  Generate_Main_Makefile (Self);

  Generate_Main_Makefile_Common (Self);

  Generate_Main_Makefile_Config (Self);

  for Subproject of Self.Project.Get_Subprojects loop
    Generate_Subproject (Target => Self,
                         Object => Model.Project.Access_T (Subproject));
  end loop;
end Generate_Project;
