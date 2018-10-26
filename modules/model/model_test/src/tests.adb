with AUnit.Run;
with AUnit.Reporter.Text;

with Test_Suites;

procedure Tests is

  procedure Run is new AUnit.Run.Test_Runner (Test_suites.Suite);
  Reporter : AUnit.Reporter.Text.Text_Reporter;
  
begin

  Run (Reporter);
  
end Tests;

