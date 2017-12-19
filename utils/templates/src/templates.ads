--  with ada files

--  with others libraries
with Templates_Parser;

--  with project files
--  with Model.Element;

package Templates is

  package TP renames Templates_Parser;

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
    (Template_File : in String;
     Tag_Names     : in Tag_Names_Array_T := No_Tag)
    return not null access Object_T
  with
    Test_Case =>
      (Name   => "nominal",
       Mode   => Nominal),
    Test_Case =>
      (Name   => "not_existing_file",
       Mode   => Robustness);

  procedure Free (Object : in out Reference_T);

  function Get_Template_Filename
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

  function Get_Value
    (Self     : in Object_T;
     Tag_Name : in String;
     Index    : in Positive)
    return String;

  function Number_Of_Elements_In_Tag
    (Self     : in Object_T;
     Tag_Name : in String)
    return Natural;

  function To_String
    (Self : in Object_T)
    return String;

private

  type Tag_Array_T is array (Positive range <>) of TP.Tag;

  type Object_T is tagged
    record
      Template_File   : access String             := null;
      Tag_Names       : access Tag_Names_Array_T  := null;
      Tags            : access Tag_Array_T        := null;
      Translate_Table : access TP.Translate_Table := null;
    end record;

end Templates;
