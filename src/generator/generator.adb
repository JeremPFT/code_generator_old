with Ada.Text_IO;

with Model.Visitor.Printer;

with File_IO;

package body Generator is

  package T_IO renames Ada.Text_IO;

  procedure Generate
    (Project_Data : in Project_Loader.Data_T)
  is
    With_Templates : Object_T;

    Project : constant access Model.Project.Object_T'Class :=
      Project_Data.Project;
  begin
    With_Templates.Set_Root_Directory (Project_Data.Path.all);

    T_IO.Put_Line ("created project : " & Project.Get_Name);

    if False then
      declare
        Printer : Model.Visitor.Printer.Object_T;
      begin
        Project.Visit (Printer);
        T_IO.Put_Line (Printer.To_String);
      end;
    end if;

    Project.Visit (With_Templates);

  end Generate;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Module
    (Self   : in out Object_T;
     Object : in     Model.Module.Object_T'Class)
  is
    package F_IO renames File_IO;
  begin
    T_IO.New_Line;
    T_IO.Put_Line ("processing module " & Object.Get_Name);

    F_IO.Set_Working_Directory (F_IO.Compose (Self.Get_Root_Directory, "src"));
    F_IO.Mkdir (Object.Get_Name);
    F_IO.Set_Working_Directory (Object.Get_Name);
    F_IO.Mkdir ("gpr");

    for Element of Object.Get_Elements loop
      Element.Visit (Self);
    end loop;
  end Visit_Module;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Package
    (Self   : in out Object_T;
     Object : in     Model.Package_Def.Object_T'Class)
  is
  begin
    T_IO.Put_Line ("visiting package " & Object.Get_Name);

    for Element of Object.Get_Public_Elements loop
      Element.Visit (Self);
    end loop;

    for Element of Object.Get_Private_Elements loop
      Element.Visit (Self);
    end loop;
  end Visit_Package;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Class
    (Self   : in out Object_T;
     Object : in     Model.Class_Def.Object_T'Class)
  is
    pragma Unreferenced (Self);
  begin
    T_IO.Put_Line ("visiting class " & Object.Get_Name);
  end Visit_Class;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Field
    (Self   : in out Object_T;
     Object : in     Model.Field.Object_T'Class)
  is
    pragma Unreferenced (Self);
  begin
    T_IO.Put_Line ("visiting field " & Object.Get_Name);
  end Visit_Field;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Operation
    (Self   : in out Object_T;
     Object : in     Model.Operation.Object_T'Class)
  is
    pragma Unreferenced (Self);
  begin
    T_IO.Put_Line ("visiting operation " & Object.Get_Name);
  end Visit_Operation;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Parameter
    (Self   : in out Object_T;
     Object : in     Model.Parameter.Object_T'Class)
  is
    pragma Unreferenced (Self);
  begin
    T_IO.Put_Line ("visiting parameter " & Object.Get_Name);
  end Visit_Parameter;

  -----------------------------------------------------------------------------

end Generator;
