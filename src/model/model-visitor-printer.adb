with Ada.Characters.Latin_1;

with Model.Element;
with Model.Comment;
with Model.Named_Element;
with Model.Project;
with Model.Package_Def;
with Model.Class_Def;
with Model.Field;
with Model.Parameter;
with Model.Subprogram;

package body Model.Visitor.Printer is

  package U_Str renames Ada.Strings.Unbounded;

  subtype U_String is U_Str.Unbounded_String;
  use type U_String;

  package Latin_1 renames Ada.Characters.Latin_1;
  EOL : constant String := Latin_1.CR & Latin_1.LF;

  --  package Prj renames Model.Project;
  --  package Pkg renames Model.Package_Def;
  --  package Cls renames Model.Class_Def;
  --  package Fld renames Model.Field;
  --  package Prm renames Model.Parameter;
  --  package Spg renames Model.Subprogram;

  overriding
  procedure Visit_Element
    (Self   : in out Object_T;
     Object : in Model.Element.Object_T'Class)
  is
    pragma Unreferenced (Object);

    Result : U_String := U_Str.Null_Unbounded_String;
  begin
    Result := Result & "unknown element" & EOL;

    Self.Content := Self.Content & Result;
  end Visit_Element;

  overriding
  procedure Visit_Comment
    (Self   : in out Object_T;
     Object : in     Model.Comment.Object_T'Class)
  is
  begin
    Self.Content := Self.Content & "--  " &
      Object.Get_Body & EOL;
  end Visit_Comment;

  overriding
  procedure Visit_Project
    (Self   : in out Object_T;
     Object : in     Model.Project.Object_T'Class)
  is
  begin
    Self.Content := Self.Content &
      "project " & Object.Get_Name & EOL;

    Self.Content := Self.Content &
      "  in " & Object.Get_Root_Directory & EOL;

    for Obj of Object.Get_Elements loop
      Obj.Visit (Self);
    end loop;

    for Obj of Object.Get_Subprojects loop
      Obj.Visit (Self);
    end loop;
  end Visit_Project;

  overriding
  procedure Visit_Package
    (Self   : in out Object_T;
     Object : in     Model.Package_Def.Object_T'Class)
  is
    Result : U_String := U_Str.Null_Unbounded_String;
  begin
    Result := Result & "package " & Object.Get_Name & EOL;

    for Elm of Object.Get_Public_Elements loop
      Elm.Visit (Self);
    end loop;

    for Child of Object.Get_Children loop
      Child.Visit (Self);
    end loop;

    Self.Content := Self.Content & Result;
  end Visit_Package;

  overriding
  procedure Visit_Class
    (Self   : in out Object_T;
     Object : in Model.Class_Def.Object_T'Class)
  is
  begin
    Self.Content := Self.Content &
      "class " & Object.Get_Name;

    if Object.Is_Abstract then
      Self.Content := Self.Content & " (abstract)";
    end if;

    Self.Content := Self.Content & EOL;

    for Obj of Object.Get_Fields loop
      Obj.Visit (Self);
    end loop;
  end Visit_Class;

  overriding
  procedure Visit_Interface
    (Self   : in out Object_T;
     Object : in     Model.Interface_Def.Object_T'Class)
  is
  begin
    Self.Content := Self.Content &
      "interface " & Object.Get_Name;
  end Visit_Interface;

  overriding
  procedure Visit_Field
    (Self   : in out Object_T;
     Object : in     Model.Field.Object_T'Class)
  is
  begin
    Self.Content := Self.Content &
      "field " & Object.Get_Name & " : " & Object.Get_Type &
      (if Object.Has_Default_Value then
         " := " & Object.Get_Default_Value
       else "") &
      EOL;
  end Visit_Field;

  overriding
  procedure Visit_Subprogram
    (Self   : in out Object_T;
     Object : in     Model.Subprogram.Object_T'Class)
  is
    Result : U_String := U_Str.Null_Unbounded_String;
  begin
    Result := Result & "subprogram " & Object.Get_Name & EOL;

    Self.Content := Self.Content & Result;
  end Visit_Subprogram;

  overriding
  procedure Visit_Parameter
    (Self   : in out Object_T;
     Object : in     Model.Parameter.Object_T'Class)
  is
  begin
    Self.Content := Self.Content &
      "parameter " & Object.Get_Name & " : " & Object.Get_Type &
      (if Object.Has_Default_Value then
         " := " & Object.Get_Default_Value
       else "") &
      EOL;
  end Visit_Parameter;

  function To_String
    (Self : in Object_T)
    return String
  is
  begin
    return U_Str.To_String (Self.Content);
  end To_String;

end Model.Visitor.Printer;
