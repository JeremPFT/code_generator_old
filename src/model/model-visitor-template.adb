with Ada.Characters.Latin_1;
with Ada.Text_IO;
with File_IO;

with Model.Element;
with Model.Project;
with Model.Package_Def;
with Model.Class_Def;
with Model.Field;
with Model.Parameter;
with Model.Subprogram;

with Template;

package body Model.Visitor.Template is

  package T_IO renames Ada.Text_IO;
  package F_IO renames File_IO;

  package Latin_1 renames Ada.Characters.Latin_1;
  EOL : constant String := Latin_1.CR & Latin_1.LF;
  use type Ada.Strings.Unbounded.Unbounded_String;

  package Tmpl renames Standard.Template;

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

  package Visit_Project_Impl is
    procedure Initialize
      (Visitor_Object : in out Object_T;
       Project_Object : in     Model.Project.Object_T'Class);

    procedure Generate_Main_Project;
    procedure Generate_Subproject;
  end Visit_Project_Impl;

  package body Visit_Project_Impl is separate;

  overriding
  procedure Visit_Project
    (Self   : in out Object_T;
     Object : in     Model.Project.Object_T'Class)
  is
    use Visit_Project_Impl;

  begin
    Initialize (Self, Object);

    if not Object.Has_Parent then
      Generate_Main_Project;
    else
      Generate_Subproject;
    end if;
  end Visit_Project;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Package
    (Self   : in out Object_T;
     Object : in     Model.Package_Def.Object_T'Class)
  is
    pragma Unreferenced (Self, Object);
  begin
    T_IO.Put_Line ("visit_package");
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
