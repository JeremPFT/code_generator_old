with Ada.Exceptions;

with Model.Project;
with Ada_Utils;

separate (Ada_Console_Project)

procedure Generate_Package
  (Target     : access Object_T;
   Object_Pkg : access Model.Package_Def.Object_T)
is
  package T_IO renames Ada.Text_IO;

  Template_Name : constant String := "package_spec.tads";

  Package_Name_Tag : constant String := "PACKAGE_NAME";

  Package_Qualified_Name : constant String :=
    Ada_Utils.Qualified_Name (Object_Pkg);

  Tags : constant Templates.Imager.Tag_Names_Array_T (1 .. 1) :=
    (1 => new String'(Package_Name_Tag));

  Image : constant access Templates.Imager.Object_T :=
    Templates.Imager.Create
      (Group         => "",
       Template_File => Template_Name,
       Tag_Names     => Tags);

  Modules : constant Model.Project.Vector_T := Target.Project.Get_Subprojects;

  Current_Module : constant Model.Project.Access_T :=
    Model.Project.Access_T (Model.Project.Vectors.Element
                              (Modules.Last));
begin
  T_IO.Put_Line ("Generate_Package : " & Object_Pkg.Get_Name &
                   " in module " & Current_Module.Get_Name);

  T_IO.Put_Line
    ((if Object_Pkg.Has_Parent then
        "has parent"
      else "no parent"));

  Image.Add_Value (Tag_Name => Package_Name_Tag,
                   Value    => Package_Qualified_Name);

  declare
    File_Name : String (1 .. Package_Qualified_Name'Length + 4) :=
      Package_Qualified_Name & "    ";
  begin
    for I in File_Name'Range loop
      if File_Name (I) = '.' then
        File_Name (I) := '-';
      end if;
    end loop;
    File_Name (File_Name'Last - 3 .. File_Name'Last) := ".ads";

    Touch (Path    => File_Name,
           Content => Image.To_String);
  end;

  for Child of Object_Pkg.Get_Children loop
    Generate_Package (Target     => Target,
                      Object_Pkg => Model.Package_Def.Access_T (Child));
  end loop;

exception
  when E : others =>
    T_IO.Put_Line (Ada.Exceptions.Exception_Information (E));

end Generate_Package;
