with Ada.Text_IO;

with Model.Visitor.Printer;
with Model_Visitor;

procedure Generate
  (Object : not null access Model.Root_Project.Object_T'Class)
is
  Visitor : Model_Visitor.Object_T;

  package T_IO renames Ada.Text_IO;

begin
  Visitor.Set_Root_Directory (Object.Get_Directory);

  T_IO.Put_Line ("created project : " & Object.Get_Name);

  if False then
    declare
      Printer : Model.Visitor.Printer.Object_T;
    begin
      Object.Visit (Printer);
      T_IO.Put_Line (Printer.To_String);
    end;
  end if;

  Object.Visit (Visitor);

end Generate;
