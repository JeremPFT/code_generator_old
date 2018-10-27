with GNAT.Exception_Traces;
with System.Assertions;

with Ada.Exceptions;
with Ada.Text_IO;

with GNAT.Traceback;
with GNAT.Traceback.Symbolic;

with AUnit.Run;
with AUnit.Reporter.Text;

with Model_Test.Suites;

procedure Model_Test.Run is

  package T_IO renames Ada.Text_IO;

  procedure Run is new AUnit.Run.Test_Runner (Model_Test.Suites.Suite);
  Reporter : AUnit.Reporter.Text.Text_Reporter;

  --  procedure Call_Stack is
  --    Trace  : GNAT.Traceback.Tracebacks_Array (1..1_000);
  --    Length : Natural;
  --  begin
  --    GNAT.Traceback.Call_Chain (Trace, Length);
  --    T_IO.Put_Line (GNAT.Traceback.Symbolic.Symbolic_Traceback (Trace (1..Length)));
  --  end Call_Stack;

  use Ada.Exceptions;

begin
  T_IO.Put_Line ( "HELLO WORLD" );

  GNAT.Exception_Traces.Trace_On (GNAT.Exception_Traces.Unhandled_Raise);

  Run (Reporter);

exception
  when Error: System.Assertions.Assert_Failure =>
    T_IO.Put ("ASSERT exception: ");
    T_IO.Put_Line (Exception_Information(Error));
    raise;

  when Error: others =>
    T_IO.Put ("Unexpected exception: ");
    T_IO.Put_Line (Exception_Information(Error));
    --  Call_Stack;
    raise;
end Model_Test.Run;
