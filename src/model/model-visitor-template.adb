with Ada.Text_IO;
with File_IO;

with Model.Element;
with Model.Project;
with Model.Package_Def;
with Model.Class_Def;
with Model.Module;
with Model.Field;
with Model.Parameter;
with Model.Subprogram;

with Template;

package body Model.Visitor.Template is

  package T_IO renames Ada.Text_IO;
  package F_IO renames File_IO;

  use type Ada.Strings.Unbounded.Unbounded_String;

  package Tmpl renames Standard.Template;

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
  procedure Visit_Element
    (Self   : in out Object_T;
     Object : in     Model.Element.Object_T'Class)
  is
    pragma Unreferenced (Self, Object);
  begin
    T_IO.Put_Line ("visit_element");
  end Visit_Element;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Project
    (Self   : in out Object_T;
     Object : in     Model.Project.Object_T'Class)
    is separate;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Module
    (Self   : in out Object_T;
     Object : in     Model.Module.Object_T'Class)
  is
  begin
    F_IO.Set_Working_Directory (F_IO.Compose (Self.Get_Root_Directory, "src"));
    F_IO.Mkdir (Object.Get_Name);
    F_IO.Set_Working_Directory (Object.Get_Name);
    F_IO.Mkdir ("gpr");
  end Visit_Module;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Package
    (Self   : in out Object_T;
     Object : in     Model.Package_Def.Object_T'Class)
  is
    pragma Unreferenced (Self, Object);
  begin
    T_IO.Put_Line ("visit_package TODO");
  end Visit_Package;

  overriding
  procedure Visit_Comment
    (Self   : in out Object_T;
     Object : in     Model.Comment.Object_T'Class)
  is
    pragma Unreferenced (Self, Object);
  begin
    T_IO.Put_Line ("visit_comment");
  end Visit_Comment;

  overriding
  procedure Visit_Class
    (Self   : in out Object_T;
     Object : in     Model.Class_Def.Object_T'Class)
  is
    pragma Unreferenced (Self, Object);
  begin
    T_IO.Put_Line ("visit_class");
  end Visit_Class;

  overriding
  procedure Visit_Interface
    (Self   : in out Object_T;
     Object : in     Model.Interface_Def.Object_T'Class)
  is
    pragma Unreferenced (Self, Object);
  begin
    T_IO.Put_Line ("visit_interface");
  end Visit_Interface;

  overriding
  procedure Visit_Field
    (Self   : in out Object_T;
     Object : in     Model.Field.Object_T'Class)
  is
    pragma Unreferenced (Self, Object);
  begin
    T_IO.Put_Line ("visit_field");
  end Visit_Field;

  overriding
  procedure Visit_Subprogram
    (Self   : in out Object_T;
     Object : in     Model.Subprogram.Object_T'Class)
  is
    pragma Unreferenced (Self, Object);
  begin
    T_IO.Put_Line ("visit_subprogram");
  end Visit_Subprogram;

  overriding
  procedure Visit_Parameter
    (Self   : in out Object_T;
     Object : in     Model.Parameter.Object_T'Class)
  is
    pragma Unreferenced (Self, Object);
  begin
    T_IO.Put_Line ("visit_parameter");
  end Visit_Parameter;

  function To_String
    (Self : in Object_T)
    return String
    is ("");

end Model.Visitor.Template;
