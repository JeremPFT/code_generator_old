with Ada.Text_IO;
with Ada.Directories;

with Reflection;

package body File_IO is

  -----------------------------------------------------------------------------

  package A_Dir renames Ada.Directories;
  package T_IO renames Ada.Text_IO;

  package Unit is new Reflection;

  -----------------------------------------------------------------------------

  procedure Mkdir
    (Path : in String)
  is
  begin
    T_IO.Put_Line (Unit.Name & ": " & "Mkdir " & Path);

    A_Dir.Create_Path (New_Directory => Path);
  end Mkdir;

  -----------------------------------------------------------------------------

  procedure Touch
    (Path    : in String;
     Content : in String)
  is
    Dir      : constant String := A_Dir.Containing_Directory (Path);
    Filename : constant String := A_Dir.Simple_Name (Path);

    File : T_IO.File_Type;

  begin
    T_IO.Put_Line (Unit.Name & ": " & "Touch " & Path);

    if not Exists (Dir) then
      Mkdir (Path => Dir);
    end if;

    T_IO.Create (File => File,
                 Name => Path);

    T_IO.Put_Line (File => File,
                   Item => Content);

    T_IO.Close (File => File);
  end Touch;

  -----------------------------------------------------------------------------

  function Compose
    (Left, Right : in String)
    return String
  is
  begin
    return A_Dir.Compose (Containing_Directory => Left,
                          Name                 => Right);
  end Compose;

  -----------------------------------------------------------------------------

  procedure Set_Working_Directory
    (Path : in String)
  is
  begin
    T_IO.Put_Line (Unit.Name & ": " &
                     "Set_Working_Directory " & Path);

    A_Dir.Set_Directory (Directory => Path);
  end Set_Working_Directory;

  -----------------------------------------------------------------------------

  function Current_Directory
    return String
  is
  begin
    return A_Dir.Current_Directory;
  end Current_Directory;

  -----------------------------------------------------------------------------

  function Exists
    (Name : in String)
    return Boolean
  is
  begin
    return A_Dir.Exists (Name);
  end Exists;

  -----------------------------------------------------------------------------

  function Dirname
    (Name : String)
    return String
    is (A_Dir.Containing_Directory (Name => Name));

  -----------------------------------------------------------------------------

  function Filename
    (Name : String)
    return String
    is (A_Dir.Simple_Name (Name => Name));

  -----------------------------------------------------------------------------

end File_IO;
