--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

with Model.Named_Element.Object_T_Test_Data.Object_T_Tests;

with GNATtest_Generated;

package Model.Subprogram.Object_T_Test_Data is

--  begin read only
   type Test_Object_T is new
     GNATtest_Generated.GNATtest_Standard.Model.Named_Element.Object_T_Test_Data.Object_T_Tests.Test_Object_T
--  end read only
   with null record;

   procedure Set_Up (Gnattest_T : in out Test_Object_T);
   procedure Tear_Down (Gnattest_T : in out Test_Object_T);

end Model.Subprogram.Object_T_Test_Data;
