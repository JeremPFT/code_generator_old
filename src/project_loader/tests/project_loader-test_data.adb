--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Project_Loader.Test_Data is

  procedure Set_Up (Gnattest_T : in out Test) is
  begin
    null;

    --  Project (Path => "path", Project_Name => "project");

    --  Module ("module_1");

    --  Class ("class_1");

    --  Class ("class_2; abstract");

    --  Class ("class_3");

    --  Module ("module_2");

    --  Close;

    --  Tests_Impl.Initialize (Get_Data);
  end Set_Up;

  procedure Tear_Down (Gnattest_T : in out Test) is
    pragma Unreferenced (Gnattest_T);
  begin
    null;
  end Tear_Down;

end Project_Loader.Test_Data;
