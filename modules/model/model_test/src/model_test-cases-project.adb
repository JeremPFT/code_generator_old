with AUnit.Assertions;

with Model.Project;
with Model.Root_Project;
with Expected;

package body Model_Test.Cases.Project
is

  Parent : access Model.Root_Project.Object_T;
  Child : access Model.Project.Object_T;
  Alone : access Model.Project.Object_T;

  procedure Set_Up
    ( Test : in out Test_Case )
  is
  begin
    Parent := Model.Root_Project.Create ( Name => Expected.Parent_Project_Name,
                                         Kind => Expected.Project_Kind_1,
                                        In_Directory => "" );

    Child := Model.Project.Create ( Name  => Expected.Child_Project_Name,
                                   Kind   => Expected.Project_Kind_2,
                                   Parent => parent);

    Alone := Model.Project.Create ( Name  => Expected.Child_Project_Name,
                                   Kind   => Expected.Project_Kind_1);
  end Set_Up;

  procedure Register_Tests ( T: in out Test_Case ) is
    use AUnit.Test_Cases.Registration;
  begin

    Register_Routine (T,
                      Test_Create_With_Parent_Has_Parent'Access,
                      "Test_Create_With_Parent_Has_Parent");
    Register_Routine (T,
                      Test_Create_No_Parent_Has_No_Parent'Access,
                      "Test_Create_No_Parent_Has_No_Parent");

    Register_Routine (T,
                      Test_Has_Given_Name'Access,
                      "Test_Has_Given_Name");
  end Register_Tests;

  use AUnit.Assertions;

  procedure Assert_Expected
    ( Got : in String;
     Expected : in String )
  is
    Message : constant String := "unexpected value: " &
      "expected '" & Expected & "', got '" & Got & "'";
  begin
    Assert ( Got = Expected, Message );
  end Assert_Expected;

  procedure Assert_Expected
    ( Got : in Boolean;
     Expected : in Boolean )
  is
    Message : constant String := "unexpected value: " &
      "expected '" & Expected'Img & "', got '" & Got'Img & "'";
  begin
    Assert ( Got = Expected, Message );
  end Assert_Expected;

  procedure Test_Create_With_Parent_Has_Parent
    ( T : in out aunit.Test_Cases.Test_Case'Class )
  is
  begin
    Assert_Expected ( Got => child.Has_Parent,
                     Expected => True );
  end Test_Create_With_Parent_Has_Parent;

  procedure Test_Create_No_Parent_Has_No_Parent
    ( T : in out aunit.Test_Cases.Test_Case'Class )
  is
  begin
    Assert_Expected ( Got => alone.Has_Parent,
                     Expected => False );
  end Test_Create_No_Parent_Has_No_Parent;

  procedure Test_Has_Given_Name
    ( T : in out aunit.Test_Cases.Test_Case'Class )
  is
  begin
    Assert_Expected (Got => child.Get_Name,
                     Expected => Expected.Child_Project_Name );
  end Test_Has_Given_Name;

end Model_Test.Cases.Project;
