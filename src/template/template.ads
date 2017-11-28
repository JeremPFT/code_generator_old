--  with ada files
with Ada.Exceptions;

--  with others libraries
with Templates_Parser;
with Templates_Parser.Utils;

--  with project files
--  with Model.Element;

package Template is

  Template_Directory : constant String :=
    "/home/jeremy/workspace/ada/code_generator/templates_files/";

  type Tag_Names_Array_T is
    array (Positive range <>)
    of access String;

  Tag_Not_Found : exception;

  No_Tag : constant Tag_Names_Array_T (2 .. 1) := (others => null);

  function "+" (Item : String) return not null access String
    is (new String'(Item));

  type Object_T is tagged private;

  type Reference_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  function Create
    (Group         : in String;
     Template_File : in String;
     Tag_Names     : in Tag_Names_Array_T := No_Tag)
    return not null access Object_T;

  --  procedure Set_Element
  --    (Self    : in out          Object_T;
  --     Element : not null access Model.Element.Object_T'Class);

  function Get_Group
    (Self : in Object_T)
    return String;

  function Get_Template_File
    (Self : in Object_T)
    return String;

  procedure Add_Value
    (Self     : in out Object_T;
     Tag_Name : in     String;
     Value    : in     String);

  procedure Add_Value
    (Self     : in out Object_T;
     Tag_Name : in     String;
     Value    : in     Integer);

  procedure Add_Value
    (Self     : in out Object_T;
     Tag_Name : in     String;
     Value    : in     Boolean);

  function To_String
    (Self : in Object_T)
    return String;

  function To_Dbg_String
    (Self : in Object_T)
    return String;

private

  package TP renames Templates_Parser;

  type Tag_Array_T is array (Positive range <>) of TP.Tag;

  type Object_T is tagged
    record
      Group           : access String             := null;
      Template_File   : access String             := null;
      Tag_Names       : access Tag_Names_Array_T  := null;
      Tags            : access Tag_Array_T        := null;
      Translate_Table : access TP.Translate_Table := null;

      --  Element : access Model.Element.Object_T'Class := null;
    end record;

end Template;
