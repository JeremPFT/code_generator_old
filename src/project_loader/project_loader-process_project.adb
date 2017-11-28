with Ada.Text_IO;
with Model.Visitor.Printer;

separate (Project_Loader)

procedure Process_Project
is
  package T_IO renames Ada.Text_IO;

  Printer : Model.Visitor.Printer.Object_T;
begin

  T_IO.Put_Line ("created project : " & Project.Get_Name);

  Project.Visit (Printer);

  T_IO.Put_Line (Printer.To_String);

end Process_Project;
