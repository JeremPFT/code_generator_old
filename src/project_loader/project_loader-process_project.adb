with Ada.Text_IO;
with Model.Visitor.Printer;
with Model.Visitor.Template;

separate (Project_Loader)

procedure Process_Project
is
  package T_IO renames Ada.Text_IO;

  Printer        : Model.Visitor.Printer.Object_T;
  With_Templates : Model.Visitor.Template.Object_T;

begin

  With_Templates.Set_Root_Directory (Root_Directory.all);

  T_IO.Put_Line ("created project : " & Project.Get_Name);

  Project.Visit (Printer);
  Project.Visit (With_Templates);

  T_IO.Put_Line (Printer.To_String);

end Process_Project;
