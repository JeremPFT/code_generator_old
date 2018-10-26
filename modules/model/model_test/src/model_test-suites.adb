with Model_Test.Cases.Project;
--  with model_Test.Cases.Root_Project;

package body Model_Test.Suites is

  Result : aliased AUnit.Test_Suites.Test_Suite;

  --  Test_Root_Project : aliased Model_Test.Cases.Root_Project.Test_Case;
  Test_Project : aliased Model_Test.Cases.Project.Test_Case;


  function Suite
    return AUnit.Test_Suites.Access_Test_Suite
  is
    use AUnit.Test_Suites;
  begin
      --  Add_Test (Result'Access, Test_Root_Project'Access);
      Add_Test (Result'Access, Test_Project'Access);
      return Result'Access;
  end Suite;

end Model_Test.Suites;
