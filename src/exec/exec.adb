with String_Utils;

with Project_Loader;

with Generator;

procedure Exec is

  function "+"
    (Item : in String)
    return String_Utils.String_Access
    is (new String'(Item));

begin

  Load_Project :
  declare
    use Project_Loader;
  begin
    Project
      (Path         => "/tmp",
       Project_Name => "test_gen_code_generator");

    --  Console_Project
    --    ("/home/jeremy/workspace/ada/" &
    --       "test_gen_code_generator");

    Module
      ("model");

    Class
      ("element; abstract, create");
    Field
      ("owned_comment : vector; " &
         "treat_as_string, add, has, number");
    Method
      ("visit (object : in out visitor.object_t'class)");

    Class
      ("named_element : element and test and chose; abstract, init, create");
    Field
      ("name : access string := null; treat_as_string, get, create");

    Class
      ("packageable_element " &
         "(owner_package : access package_def.object_t'class)" &
         " : named_element; abstract");

    Class
      ("subprogram : packageable_element");
    Fields
      ((+"of_type : access string := null",
        +"is_abstract : boolean := false",
        +"is_separate : boolean := false"));
    Method
      ("has_return");

    Class
      ("type_def : packageable_element; abstract");

    Class
      ("interface_def : type_def");
    Fields
      ((+("parent_interfaces : vector, " &
            "has, number, get_i, add "),
        +("Public_Subprograms : subprogram.vector, " &
            "has, number, get_i, get, add")));

    Class
      ("class_def : interface_def");
    Fields
      ((+("parent_interfaces : vector, " &
            "has, number, get_i, add "),
        +("Subprograms : subprogram.vector, " &
            "has, number, get_i, get, add")));

    Module
      ("exec");

    Module
      ("ada_utils");

    Module
      ("file_io");

    Close;
  end Load_Project;

  Generate_Project :
  declare
    use Generator;
  begin
    Generate (Project_Loader.Get_Data);
  end Generate_Project;

end Exec;
