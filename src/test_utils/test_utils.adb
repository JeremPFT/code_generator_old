with Ada.Text_IO;
with Ada.Strings.Fixed;

package body Test_Utils is

  package T_IO renames Ada.Text_IO;

  function "*"
    (Left  : Natural;
     Right : Character) return String
    renames Ada.Strings.Fixed."*";

  procedure Section
    (Text      : in String := Section_Prefix;
     Unit_Name : in String)
  is
    New_Text : constant String := Text &
      (if Text /= "" then
         (if Text (Text'Last) = ' ' then "" else " ")
       else Text);

    Size : constant Natural :=
      New_Text'Length + Unit_Name'Length;
  begin
    T_IO.New_Line;
    T_IO.Put_Line (Size * '-');
    T_IO.Put_Line (New_Text & Unit_Name);
    T_IO.Put_Line (Size * '-');
  end Section;

end Test_Utils;
