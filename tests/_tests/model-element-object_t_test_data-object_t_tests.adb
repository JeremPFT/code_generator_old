--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Model.Element.Object_T_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only

with Ada.Text_IO;

--  begin read only
--  end read only
package body Model.Element.Object_T_Test_Data.Object_T_Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

  package T_IO renames Ada.Text_IO;

--  begin read only
--  end read only

--  begin read only
   procedure Test_Add_Comment (Gnattest_T : in out Test_Object_T);
   procedure Test_Add_Comment_e58dfe (Gnattest_T : in out Test_Object_T) renames Test_Add_Comment;
--  id:2.2/e58dfe645bca6ddb/Add_Comment/1/0/
   procedure Test_Add_Comment (Gnattest_T : in out Test_Object_T) is
   --  model-element.ads:28:3:Add_Comment
--  end read only

  begin

    T_IO.Put_Line (">> add_comment");

    if Gnattest_T.Fixture /= null then
      Gnattest_T.Fixture.Add_Comment ("comment 1");

      AUnit.Assertions.Assert
        (Integer (Gnattest_T.Fixture.Owned_Comments.Length) = 1,
         "bad comment number.");

      AUnit.Assertions.Assert
        (Gnattest_T.Fixture.Get_Comment (Index => 1) = "comment 1",
         "bad comment value 1.");
    end if;

    T_IO.Put_Line ("<< add_comment");

--  begin read only
   end Test_Add_Comment;
--  end read only


--  begin read only
   procedure Test_Number_Of_Comments (Gnattest_T : in out Test_Object_T);
   procedure Test_Number_Of_Comments_e75ee0 (Gnattest_T : in out Test_Object_T) renames Test_Number_Of_Comments;
--  id:2.2/e75ee093da7f18dc/Number_Of_Comments/1/0/
   procedure Test_Number_Of_Comments (Gnattest_T : in out Test_Object_T) is
   --  model-element.ads:35:3:Number_Of_Comments
--  end read only

    --  pragma Unreferenced (Gnattest_T);

  begin

    T_IO.Put_Line (">> Number_Of_Comments");

    if Gnattest_T.Fixture /= null then
      Gnattest_T.Fixture.Add_Comment ("comment 1");
      Gnattest_T.Fixture.Add_Comment ("comment 2");

      AUnit.Assertions.Assert
        (Integer (Gnattest_T.Fixture.Owned_Comments.Length) = Gnattest_T.Fixture.Number_Of_Comments,
         "bad number_of_comments.");
    end if;
    --  AUnit.Assertions.Assert
    --    (Gnattest_Generated.Default_Assert_Value,
    --     "Test not implemented.");

    T_IO.Put_Line ("<< Number_Of_Comments");

--  begin read only
   end Test_Number_Of_Comments;
--  end read only


--  begin read only
   procedure Test_Get_Comment (Gnattest_T : in out Test_Object_T);
   procedure Test_Get_Comment_6d199b (Gnattest_T : in out Test_Object_T) renames Test_Get_Comment;
--  id:2.2/6d199b95e5dbe7b4/Get_Comment/1/0/
   procedure Test_Get_Comment (Gnattest_T : in out Test_Object_T) is
   --  model-element.ads:42:3:Get_Comment
--  end read only

    --  pragma Unreferenced (Gnattest_T);

  begin

    T_IO.Put_Line (">> Get_Comments");

    if Gnattest_T.Fixture /= null then
      Gnattest_T.Fixture.Add_Comment ("comment 1");
      Gnattest_T.Fixture.Add_Comment ("comment 2");

      AUnit.Assertions.Assert
        (Gnattest_T.Fixture.Get_Comment (Index => 1) = "comment 1",
         "bad comment value 1.");
      AUnit.Assertions.Assert
        (Gnattest_T.Fixture.Get_Comment (Index => 2) = "comment 2",
         "bad comment value 2.");
    end if;

    T_IO.Put_Line ("<< Get_Comment");

    --  AUnit.Assertions.Assert
    --    (Gnattest_Generated.Default_Assert_Value,
    --     "Test not implemented.");

--  begin read only
   end Test_Get_Comment;
--  end read only


--  begin read only
   procedure Test_Clear_Memory (Gnattest_T : in out Test_Object_T);
   procedure Test_Clear_Memory_973cfd (Gnattest_T : in out Test_Object_T) renames Test_Clear_Memory;
--  id:2.2/973cfd8ea84e1cb4/Clear_Memory/1/0/
   procedure Test_Clear_Memory (Gnattest_T : in out Test_Object_T) is
   --  model-element.ads:50:3:Clear_Memory
--  end read only

    pragma Unreferenced (Gnattest_T);

  begin

    AUnit.Assertions.Assert
      (Gnattest_Generated.Default_Assert_Value,
       "Test not implemented.");

--  begin read only
   end Test_Clear_Memory;
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
end Model.Element.Object_T_Test_Data.Object_T_Tests;
