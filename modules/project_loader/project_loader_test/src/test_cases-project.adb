with AUnit.Assertions;

with Project_Loader;
with Model.Project;
with Expected;

package body Test_Cases.Project
is
  package Load renames Project_Loader;

  procedure Set_Up
    ( Test : in out Test_Case )
  is
  begin
    Load.Root_Project ( Path => "path", Project_Name => Expected.Default_Project_Name );
    Load.Project ( Expected.Default_Module_Name );
  end Set_Up;

  procedure Register_Tests ( T: in out Test_Case ) is
    use AUnit.Test_Cases.Registration;
  begin
    Register_Routine (T,
                      Test_Has_Valid_Name'Access,
                      "Test_Has_Valid_Name");
  end Register_Tests;

  use AUnit.Assertions;

  procedure Test_Has_Valid_Name
    ( T : in out aunit.Test_Cases.Test_Case'Class )
  is
    Got     : constant String := Current_Project.Get_Name;
    Expect  : constant String := Expected.Default_Module_Name;
    Message : constant String := "unexpected module name: " &
      "expected '" & Expect & "', got '" & Got & "'";
  begin
    Assert ( got = expect, Message );
  end Test_Has_Valid_Name;

end Test_Cases.Project;
