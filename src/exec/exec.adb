with String_Utils;

with Project_Loader;
use Project_Loader;

with Generator;

procedure Exec is

  function "+"
    (Item : in String)
    return String_Utils.String_Access
    is (new String'(Item));

  package Load renames Project_Loader;

begin

  Load.Project
    (Path         => "/tmp",
     Project_Name => "test_gen_code_generator");

  --  Console_Project
  --    ("/home/jeremy/workspace/ada/" &
  --       "test_gen_code_generator");

  Load.Module
    ("model");

  Load.Class
    ("element; abstract, create");
  Load.Field
    ("owned_comment : vector := empty; " &
       "treat_as_string, add, has, number");
  Load.Method
    ("visit (object : in out visitor.object_t'class)");

  Load.Class
    ("named_element : element and test and chose; abstract, init, create");
  Load.Field
    ("name : access string := null; treat_as_string, get, create");

  Load.Class
    ("packageable_element " &
       "(owner_package : access package_def.object_t'class)" &
       " : named_element; abstract");

  Load.Class
    ("subprogram : packageable_element");
  Load.Fields
    ((+"of_type : access string := null",
      +"is_abstract : boolean := false",
      +"is_separate : boolean := false"));
  Load.Method
    ("has_return");

  Load.Class
    ("type_def : packageable_element; abstract");

  Load.Class
    ("interface_def : type_def");
  Load.Fields
    ((+("parent_interfaces : vector := empty, " &
          "has, number, get_i, add "),
      +("Public_Subprograms : subprogram.vector := empty, " &
          "has, number, get_i, get, add")));

  Load.Class
    ("class_def : interface_def");
  Load.Fields
    ((+("parent_interfaces : vector := empty, " &
          "has, number, get_i, add "),
      +("Subprograms : subprogram.vector := empty, " &
          "has, number, get_i, get, add")));

  Load.Module
    ("exec");

  Load.Module
    ("ada_utils");

  Load.Module
    ("file_io");

  Load.Close;

  Generator.Generate (Load.Get_Data);

end Exec;
