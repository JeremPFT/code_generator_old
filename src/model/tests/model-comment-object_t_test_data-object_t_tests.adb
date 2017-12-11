--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Model.Comment.Object_T_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only

--  begin read only
--  end read only
package body Model.Comment.Object_T_Test_Data.Object_T_Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only

--  begin read only
   procedure Test_Get_Body (Gnattest_T : in out Test_Object_T);
   procedure Test_Get_Body_c908af (Gnattest_T : in out Test_Object_T) renames Test_Get_Body;
--  id:2.2/c908aff62ef31fcf/Get_Body/1/0/
   procedure Test_Get_Body (Gnattest_T : in out Test_Object_T) is
   --  model-comment.ads:32:3:Get_Body
--  end read only


    Obj_Comment : access Object_T'Class := Class_T (Gnattest_T.Fixture);

  begin
    Obj_Comment.all.Comment_Body := new String'("a comment");

    AUnit.Assertions.Assert
      (Obj_Comment.Get_Body = "a comment",
       "on get_body");

--  begin read only
   end Test_Get_Body;
--  end read only

--  begin read only
--  id:2.2/02/
--
--  This section can be used to add elaboration code for the global state.
--
begin
--  end read only
  null;
--  begin read only
--  end read only
end Model.Comment.Object_T_Test_Data.Object_T_Tests;
