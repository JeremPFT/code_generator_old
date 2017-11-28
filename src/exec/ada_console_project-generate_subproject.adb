with Model.Named_Element;

separate (Ada_Console_Project)

procedure Generate_Subproject
  (Target : access Object_T;
   Object : access Model.Project.Object_T)
is
  package T_IO renames Ada.Text_IO;

  Subprojects : constant Model.Project.Vector_T :=
    Object.Get_Subprojects;

  Elements : constant Model.Named_Element.Vector_T :=
    Object.Get_Elements;
begin
  T_IO.Put_Line ("generating subproject " & Object.Get_Name);

  Subprojects_Elements :
  for Object of Elements loop
    if Object.all in Model.Package_Def.Object_T'Class then
      Generate_Package
        (Target     => Target,
         Object_Pkg => Model.Package_Def.Access_T (Object));
    end if;
  end loop Subprojects_Elements;

  Module_Children :
  for Object of Subprojects loop
    Generate_Subproject (Target => Target,
                         Object => Model.Project.Access_T (Object));
  end loop Module_Children;

end Generate_Subproject;
