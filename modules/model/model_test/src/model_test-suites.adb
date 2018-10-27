with Model_Test.Cases.Project;
--  with model_Test.Cases.Parent_Project;

package body Model_Test.Suites is

  Result : aliased AUnit.Test_Suites.Test_Suite;

  Test_Project : aliased Model_Test.Cases.Project.Test_Case;
  Test_Comment : aliased Model_Test.Cases.Comment.Test_Case;


  function Suite
    return AUnit.Test_Suites.Access_Test_Suite
  is
    use AUnit.Test_Suites;
    Project : access Model_Test.Cases.Project.Test_Case := Test_Project'Access;
    Comment : access Model_Test.Cases.Comment.Test_Case := Test_Comment'Access;
  begin
      Add_Test (Result'Access, Project);
      Add_Test (Result'Access, Comment);

      return Result'Access;
  end Suite;

end Model_Test.Suites;
