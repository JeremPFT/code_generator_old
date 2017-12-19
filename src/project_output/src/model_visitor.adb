with Ada.Text_IO;
with File_IO;

with Model_Visitor.Visit_Root_Project_Impl;

with Templates;

package body Model_Visitor is

  package T_IO renames Ada.Text_IO;
  package F_IO renames File_IO;

  use type Ada.Strings.Unbounded.Unbounded_String;

  package Tmpl renames Standard.Templates;

  -----------------------------------------------------------------------------

  procedure Set_Root_Directory
    (Self           : in out Object_T;
     Root_Directory : in     String)
  is
  begin
    Self.Root_Directory := new String'(Root_Directory);
  end Set_Root_Directory;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Class
    (Self   : in out Object_T;
     Object : in out Model.Types.Class_Def.Object_T'Class)
  is
  begin
    T_IO.Put_Line ("visit_class """ & Object.Get_Name & """");

    for I in 1 .. Object.Number_Of_Fields loop
      declare
        Current_Field : constant not null access Model.Field.Object_T'Class :=
          Object.Get_Field (I);
      begin
        Current_Field.Visit (Self);
      end;
    end loop;

  end Visit_Class;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Comment
    (Self   : in out Object_T;
     Object : in out Model.Comment.Object_T'Class)
  is
    pragma Unreferenced (Self, Object);
  begin
    T_IO.Put_Line ("visit_comment");
  end Visit_Comment;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Dependency
    (Self   : in out Object_T;
     Object : in out Model.Dependency.Object_T'Class)
  is
    pragma Unreferenced (Self, Object);
  begin
    T_IO.Put_Line ("visit_dependency");
  end Visit_Dependency;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Element
    (Self   : in out Object_T;
     Object : in out Model.Element.Object_T'Class)
  is
    pragma Unreferenced (Self, Object);
  begin
    T_IO.Put_Line ("visit_element");
  end Visit_Element;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Field
    (Self   : in out Object_T;
     Object : in out Model.Field.Object_T'Class)
    is separate;
  --    pragma Unreferenced (Self, Object);
  --  begin
  --    T_IO.Put_Line ("visit_field");
  --  end Visit_Field;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Interface
    (Self   : in out Object_T;
     Object : in out Model.Types.Interface_Def.Object_T'Class)
  is
    pragma Unreferenced (Self, Object);
  begin
    T_IO.Put_Line ("visit_interface");
  end Visit_Interface;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Namespace
    (Self   : in out Object_T;
     Object : in out Model.Namespace.Object_T'Class)
  is
    pragma Unreferenced (Self, Object);
  begin
    T_IO.Put_Line ("visit_namespace");
  end Visit_Namespace;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Operation
    (Self   : in out Object_T;
     Object : in out Model.Operation.Object_T'Class)
  is
    pragma Unreferenced (Self, Object);
  begin
    T_IO.Put_Line ("visit_operation");
  end Visit_Operation;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Package
    (Self   : in out Object_T;
     Object : in out Model.Package_Def.Object_T'Class)
    is separate;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Parameter
    (Self   : in out Object_T;
     Object : in out Model.Parameter.Object_T'Class)
  is
    pragma Unreferenced (Self, Object);
  begin
    T_IO.Put_Line ("visit_parameter");
  end Visit_Parameter;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Project
    (Self   : in out Object_T;
     Object : in out Model.Project.Object_T'Class)
  is
    Directory : constant String :=
      F_IO.Compose (Self.Get_Root_Directory, "src");
  begin
    F_IO.Set_Working_Directory (Directory);
    F_IO.Mkdir (Object.Get_Name);
    F_IO.Set_Working_Directory (Object.Get_Name);
    F_IO.Mkdir ("gpr");

    for Element of Object.Get_Elements loop
      Element.Visit (Self);
    end loop;
  end Visit_Project;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Root_Project
    (Self   : in out Object_T;
     Object : in out Model.Root_Project.Object_T'Class)
  is
    use Model_Visitor.Visit_Root_Project_Impl;
  begin
    Self.Set_Root_Directory
      (F_IO.Compose (Left  => Self.Get_Root_Directory,
                     Right => Object.Get_Name));

    Init_Impl (Self, Object'Unchecked_Access);
    Debug_Flag_Begin;
    Create_Directories;
    Create_Files;
    Process_Modules;
    Debug_Flag_End;
  end Visit_Root_Project;

  -----------------------------------------------------------------------------

  function To_String
    (Self : in Object_T)
    return String
    is ("");

  -----------------------------------------------------------------------------

end Model_Visitor;
