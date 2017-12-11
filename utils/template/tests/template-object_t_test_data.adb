--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Template.Object_T_Test_Data is

   Local_Object_T : aliased GNATtest_Generated.GNATtest_Standard.Template.Object_T;
   procedure Set_Up (Gnattest_T : in out Test_Object_T) is
   begin
      Gnattest_T.Fixture := Local_Object_T'Access;
   end Set_Up;

   procedure Tear_Down (Gnattest_T : in out Test_Object_T) is
   begin
      null;
   end Tear_Down;

end Template.Object_T_Test_Data;
