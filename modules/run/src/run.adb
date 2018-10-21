with String_Utils;

with Project_Loader;

with Generate;

procedure Run is

  function "+"
    (Item : in String)
    return String_Utils.String_Access
    is (new String'(Item));

begin

  Load_Project :
  declare
    use Project_Loader;
  begin
    Root_Project
      (Path         => "/tmp",
       Project_Name => "test_gen_code_generator");

    Project
      ("model");

    Class
      ("element; abstract, create");
    Field
      ("owned_comment : vector; " &
         "treat_as_string, add, has, number");
    Operation
      ("visit (object : in out visitor.object_t'class)");

    Class
      ("named_element : element and test and chose; abstract, init, create");
    Field
      ("name : access string := null; treat_as_string, get, create");

    Class
      ("subprogram : named_element");
    Fields
      ((+"of_type : access string := null",
        +"is_abstract : boolean := false",
        +"is_separate : boolean := false"));
    Operations
      ((+("create_as_unit : not null access object_t'class;" &
            "(name : in string;" &
            "parent_package : access package_def.object_t'class := null;" &
            "of_type : in string := """";);" &
            "separate"),
        +("create_in_package : not null access object_t'class;" &
            "(name : in string;" &
            "in_package  : access package_def.object_t'class := null;" &
            "of_type     : in     string                     := """";" &
            "is_separate : in     boolean                    := false);" &
            "separate"),
        +("create_in_class : not null access object_t'class;" &
            "(name : in string;" &
            "in_class : access class_def.object_t'class := null;" &
            "of_type : in string := "";" &
            "is_separate : in boolean := false);" &
            "separate"))
      );

    Operation
      ("has_return : boolean");

    Class
      ("type_def : named_element; abstract");

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

    Project
      ("exec");

    Project
      ("ada_utils");

    Project
      ("file_io");

    Close;
  end Load_Project;

  Generate_Project :
  begin
    Generate (Project_Loader.Get_Root_Project);
  end Generate_Project;

end Run;
