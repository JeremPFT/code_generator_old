with Templates;

separate (Generator.Ada_Code.Console)

procedure Makefile_Main_Project
  (Project : not null access constant Model.Project.Object_T)
is
  Template_Name : constant String := "makefile";
  File_Name     : constant String := "makefile";

  Image : constant access Templates.Object_T :=
    Templates.Create (Group         => "",
                      Template_File => Template_Name);

  File_Content : constant String := Image.To_String;
begin
  F_IO.Touch (Path    => File_Name,
              Content => Image.To_String);
end Makefile_Main_Project;
