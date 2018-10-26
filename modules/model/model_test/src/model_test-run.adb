with Aunit.Run;
with Aunit.Reporter.Text;

with Model_Test.Suites;

procedure Model_Test.Run is

  procedure Run is new Aunit.Run.Test_Runner (Model_Test.Suites.Suite);
  Reporter : Aunit.Reporter.Text.Text_Reporter;

begin

  Run (Reporter);

end Model_Test.Run;
