with AUnit;
with AUnit.Test_Cases;

with Model.Root_Project;
with Model.Project;
with Project_Loader;

package Test_cases.Project
is

  type Test_Case is new AUnit.Test_Cases.Test_Case with private;
  
  overriding
  function Name
    (Test : Test_Case)
    return AUnit.Message_String
    is ( AUnit.Format ( "Project" ) ) ;

  overriding
  procedure Register_Tests
    ( T: in out Test_Case );

  overriding
  procedure Set_Up
    ( Test : in out Test_Case );
  
  procedure Test_Has_Valid_Name 
    ( T : in out aunit.Test_Cases.Test_Case'Class );
  
  --  procedure Test_has

private
  
  type Test_Case is new AUnit.Test_Cases.Test_Case with
    null record;

  function Root_Project return not null access Model.Root_Project.Object_T'Class
    renames Project_Loader.Get_Root_Project;

  function Current_Project
    return not null access Model.Project.Object_T'Class
    is ( Root_Project.Get_Subproject ( 1 ) );

end Test_Cases.Project;
