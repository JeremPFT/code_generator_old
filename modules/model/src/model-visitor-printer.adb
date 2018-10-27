with Ada.Characters.Latin_1;
with Ada.Strings.Fixed;

with Model.Comment;
with Model.Dependency;
with Model.Element;
with Model.Field;
with Model.Named_Element;
with Model.Namespace;
with Model.Operation;
with Model.Package_Def;
with Model.Parameter;
with Model.Project;
with Model.Types.Class_Def;
with Model.Types.Interface_Def;
with Model.Parent_Project;

package body Model.Visitor.Printer is

  -----------------------------------------------------------------------------
  --
  --  local declarations
  --
  -----------------------------------------------------------------------------

  package U_Str renames Ada.Strings.Unbounded;

  subtype U_String is U_Str.Unbounded_String;
  use type U_String;

  package Latin_1 renames Ada.Characters.Latin_1;
  EOL : constant String := Latin_1.CR & Latin_1.LF;

  -----------------------------------------------------------------------------
  --
  --  public operations definitions
  --
  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Class
    (Self   : in out Object_T;
     Object : in out Model.Types.Class_Def.Object_T'Class)
  is
  begin
    Self.Indent;
    Self.Add ("class " & Object.Get_Name);

    if Object.Is_Abstract then
      Self.Add (" (abstract)");
    end if;

    Self.Add (EOL);

    Object.Get_Defined_Namespace.Visit (Self);

    Self.Decr_Indent;
  end Visit_Class;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Comment
    (Self   : in out Object_T;
     Object : in out Model.Comment.Object_T'Class)
  is
  begin
    Self.Add ("-- " & Object.Get_Body & EOL);
  end Visit_Comment;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Dependency
    (Self   : in out Object_T;
     Object : in out Model.Dependency.Object_T'Class)
  is
  begin
    Self.Add ("dependency between" & EOL &
                " client : " & Object.Get_Client.Get_Name & EOL &
                " provider : " & Object.Get_Provider.Get_Name & EOL);
  end Visit_Dependency;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Element
    (Self   : in out Object_T;
     Object : in out Model.Element.Object_T'Class)
  is
    pragma Unreferenced (Object);
  begin
    Self.Add ("unknown element" & EOL);
  end Visit_Element;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Field

    (Self   : in out Object_T;
     Object : in out Model.Field.Object_T'Class)
  is
  begin
    Self.Indent;
    Self.Add
      ("field " & Object.Get_Name & " : " & Object.Get_Type &
         (if Object.Has_Default_Value then
            " := " & Object.Get_Default_Value
          else "") &
         EOL);
  end Visit_Field;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Interface
    (Self   : in out Object_T;
     Object : in out Model.Types.Interface_Def.Object_T'Class)
  is
  begin
    Self.Add
      ("interface " & Object.Get_Name);
  end Visit_Interface;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Namespace
    (Self   : in out Object_T;
     Object : in out Model.Namespace.Object_T'Class)
  is
  begin
    Self.Add
      ("namespace " & Object.Get_Name & EOL);

    Self.Incr_Indent;

    for I in 1 .. Object.Number_Of_Members loop
      Object.Get_Member (I).Visit (Self);
    end loop;

    Self.Decr_Indent;

  end Visit_Namespace;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Operation
    (Self   : in out Object_T;
     Object : in out Model.Operation.Object_T'Class)
  is
  begin
    Self.Indent;
    Self.Add ("operation " & Object.Get_Name);

    if Object.Has_Return then
      Self.Add (" return " & Object.Get_Type);
    end if;

    Self.Add (EOL);

    Self.Incr_Indent;

    for I in 1 .. Object.Number_Of_Parameters loop
      Self.Visit_Parameter (Object.Get_Parameter (I).all);
    end loop;

    Self.Decr_Indent;
  end Visit_Operation;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Package
    (Self   : in out Object_T;
     Object : in out Model.Package_Def.Object_T'Class)
  is
  begin
    Self.Incr_Indent;

    Self.Add ("package " & Object.Get_Name & EOL);

    Object.Get_Defined_Namespace.Visit (Self);

    Self.Decr_Indent;

    --  TODO

    --  for Child of Object.Get_Children loop
    --    Child.Visit (Self);
    --  end loop;
  end Visit_Package;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Parameter
    (Self   : in out Object_T;
     Object : in out Model.Parameter.Object_T'Class)
  is
  begin
    Self.Indent;
    Self.Add
      ("parameter " & Object.Get_Name & " : " &
         Parameter.Mode_Str (Object.Get_Mode).all & " " &
         Object.Get_Type &
         (if Object.Has_Default_Value then
            " := " & Object.Get_Default_Value
          else "") &
         EOL);
  end Visit_Parameter;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Project
    (Self   : in out Object_T;
     Object : in out Model.Project.Object_T'Class)
  is
  begin
    Self.Add
      ("project " & Object.Get_Name & EOL);

    for Obj of Object.Get_Elements loop
      Obj.Visit (Self);
    end loop;
  end Visit_Project;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit_Parent_Project
    (Self   : in out Object_T;
     Object : in out Model.Parent_Project.Object_T'Class)
  is
  begin
    Self.Add
      ("------------------- VISITOR PRINTER BEG ------------------" &
         EOL);

    Self.Add
      ("root_project " & Object.Get_Name & EOL);

    for Obj of Object.Get_Elements loop
      Obj.Visit (Self);
    end loop;

    for Obj of Object.Get_Subprojects loop
      Obj.Visit (Self);
    end loop;

    Self.Add
      ("------------------- VISITOR PRINTER END ------------------" &
         EOL);
  end Visit_Parent_Project;

  -----------------------------------------------------------------------------

  function To_String
    (Self : in Object_T)
    return String
  is
  begin
    return U_Str.To_String (Self.Content);
  end To_String;

  -----------------------------------------------------------------------------
  --
  --  private operations definitions
  --
  -----------------------------------------------------------------------------

  not overriding
  procedure Add
    (Self : in out Object_T;
     Text : in     String)
  is
  begin
    Self.Content := Self.Content & Text;
  end Add;

  -----------------------------------------------------------------------------

  not overriding
  procedure Indent
    (Self : in out Object_T)
  is
  begin
    Self.Add
      (Ada.Strings.Fixed."*" (Self.Current_Indent, ' '));
  end Indent;

  -----------------------------------------------------------------------------

  not overriding
  procedure Incr_Indent
    (Self : in out Object_T)
  is
  begin
    Self.Current_Indent := Self.Current_Indent + Self.Incr;
  end Incr_Indent;

  -----------------------------------------------------------------------------

  not overriding
  procedure Decr_Indent
    (Self : in out Object_T)
  is
  begin
    Self.Current_Indent := Self.Current_Indent - Self.Incr;
  end Decr_Indent;

  -----------------------------------------------------------------------------

end Model.Visitor.Printer;
