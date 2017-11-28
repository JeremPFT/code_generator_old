--  with ada files
with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Characters.Latin_1;

--  with others libraries
with Templates_Parser;

--  with project files
with File_IO;

package body Template is

  package T_IO renames Ada.Text_IO;

  function Tag_Position
    (Object   : in Object_T;
     Tag_Name : in String)
    return Positive;

  function Create
    (Group         : in String;
     Template_File : in String;
     Tag_Names     : in Tag_Names_Array_T := No_Tag)
    return not null access Object_T
  is
    Result : constant access Object_T :=
      new Object_T'(Group           => new String'(Group),
                    Template_File   => new String'(Template_File),
                    Tag_Names       => new Tag_Names_Array_T'(Tag_Names),
                    Tags            => <>,
                    --  Element         => <>,
                    Translate_Table => <>);

    Tag_Number : constant Integer := Tag_Names'Length;

    Tags            : Tag_Array_T (1 .. Tag_Number);
    Translate_Table : TP.Translate_Table (1 .. Tag_Number);
  begin
    Result.Tags            := new Tag_Array_T'(Tags);
    Result.Translate_Table := new TP.Translate_Table
      (1 .. Tag_Number);
    return Result;
  end Create;

  --  procedure Set_Element
  --    (Self    : in out          Object_T;
  --     Element : not null access Model.Element.Object_T'Class)
  --  is
  --  begin
  --    Self.Element := Element;
  --  end Set_Element;

  function Get_Group
    (Self : in Object_T)
    return String
    is (Self.Group.all);

  function Get_Template_File
    (Self : in Object_T)
    return String
    is (Self.Template_File.all);

  procedure Add_Value
    (Self     : in out Object_T;
     Tag_Name : in     String;
     Value    : in     String)
  is
    Position : constant Positive := Tag_Position (Self, Tag_Name);
  begin
    TP.Append (Self.Tags (Position), Value);
  end Add_Value;

  procedure Add_Value
    (Self     : in out Object_T;
     Tag_Name : in     String;
     Value    : in     Integer)
  is
    Position : constant Positive := Tag_Position (Self, Tag_Name);
  begin
    TP.Append (Self.Tags (Position), Value);
  end Add_Value;

  procedure Add_Value
    (Self     : in out Object_T;
     Tag_Name : in     String;
     Value    : in     Boolean)
  is
    Position : constant Positive := Tag_Position (Self, Tag_Name);
  begin
    TP.Append (Self.Tags (Position), Value);
  end Add_Value;

  function To_Dbg_String
    (Self : in Object_T)
    return String
  is
    package U_Str renames Ada.Strings.Unbounded;
    package Latin_1 renames Ada.Characters.Latin_1;

    Eol : constant String := Latin_1.CR & Latin_1.LF;

    Result : U_Str.Unbounded_String := U_Str.Null_Unbounded_String;

    use type U_Str.Unbounded_String;
  begin
    T_IO.Put_Line ("templates.imager.to_string for " &
                     Self.Get_Template_File);

    Result := Result & Self.Template_File.all;

    T_IO.Put_Line ("nbr tags : " & Self.Tags.all'Length'Img);

    for I in Self.Tag_Names.all'Range loop
      Result := Result & ", " & Self.Tag_Names (I).all & "(";

      for J in 1 .. TP.Size (Self.Tags (I)) loop
        Result := Result & TP.Item (Self.Tags (I), J) &
          (if J < TP.Size (Self.Tags (I)) then ", " else ")");
      end loop;

    end loop;

    return U_Str.To_String (Result);
  end To_Dbg_String;

  function To_String
    (Self : in Object_T)
    return String
  is
  begin
    for I in 1 .. Self.Tag_Names'Length loop
      Self.Translate_Table (I) := TP.Assoc
        (Self.Tag_Names (I).all,
         Self.Tags (I));
    end loop;

    return TP.Parse (File_IO.Compose (Template_Directory,
                                      Self.Template_File.all),
                     Self.Translate_Table.all);
  end To_String;

  function Tag_Position
    (Object   : in Object_T;
     Tag_Name : in String)
    return Positive
  is
    Found    : Boolean  := False;
    Position : Positive := 1;

  begin
    if Object.Tag_Names'Length > 0 then
      while Position <= Object.Tag_Names'Last
        and then
        not Found
      loop
        if Object.Tag_Names (Position).all = Tag_Name then
          Found := True;
        else
          Position := Position + 1;
        end if;
      end loop;
    end if;

    if not Found then
      raise Tag_Not_Found;
    end if;

    return Position;
  end Tag_Position;

end Template;
