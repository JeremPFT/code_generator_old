with File_IO;
with Model.Project;

package Generator.Ada_Code.Console is

  package F_IO renames File_IO;

  procedure Makefile_Main_Project
    (Project : not null access constant Model.Project.Object_T);

  procedure Makefile_Common
    (Project : not null access constant Model.Project.Object_T);

  procedure Makefile_Config
    (Project : not null access constant Model.Project.Object_T);

  procedure Generate_Project
    (Project : not null access constant Model.Project.Object_T)
  is
    Working_Directory : constant String :=
      F_IO.Current_Directory;
  begin
    F_IO.Mkdir (Project.Get_Root_Directory);

    F_IO.Set_Working_Directory (Project.Get_Root_Directory);

    F_IO.Mkdir ("bin");
    F_IO.Mkdir ("src");
    F_IO.Mkdir ("gpr");

    Generate_Main_Makefile (Project);

    Generate_Main_Makefile_Common (Project);

    Generate_Main_Makefile_Config (Project);

    for Subproject of Project.Get_Subprojects loop
      Generate_Subproject
        (Target => Project,
         Object => Model.Project.Access_T (Subproject));
    end loop;

    F_IO.Set_Working_Directory (Working_Directory);
  end Generate_Project;

  procedure Makefile_Main_Project
    (Project : not null access constant Model.Project.Object_T)
    is separate;

  procedure Makefile_Common
    (Project : not null access constant Model.Project.Object_T)
    is separate;

  procedure Makefile_Config
    (Project : not null access constant Model.Project.Object_T)
    is separate;

end Generator.Ada_Code.Console;
