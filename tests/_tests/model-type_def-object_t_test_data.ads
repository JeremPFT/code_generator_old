--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

with Model.Named_Element.Object_T_Test_Data.Object_T_Tests;

with GNATtest_Generated;

package Model.Type_Def.Object_T_Test_Data is

--  begin read only
   type Test_Object_T is abstract new
     GNATtest_Generated.GNATtest_Standard.Model.Named_Element.Object_T_Test_Data.Object_T_Tests.Test_Object_T
--  end read only
   with null record;

end Model.Type_Def.Object_T_Test_Data;
