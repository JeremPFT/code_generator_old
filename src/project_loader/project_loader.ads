with String_Utils;

package Project_Loader is

  Bad_Class_Input_Format : exception;
  Bad_Field_Input_Format : exception;

  subtype String_Array is String_Utils.String_Array;

  procedure Console_Project
    (Path : in String);
  --  initialize a new project given it's path.
  --  the project name is the last element of path.
  --
  --  usage:
  --  Console_Project ("/full/path/to/workspace/" & project_name)

  procedure Module
    (Name : in String);
  --  add a module to the project

  procedure Class
    (Input : in String);
  --  add a class to the project
  --
  --  input_format     <- class_data, options | class_data
  --  class_data       <- class_main : heritage | class_main
  --  class_main       <- class_name (discriminant) | class_name
  --  discriminant    <- name : type := default | name : type
  --  heritage        <- parent_name and interface_names
  --  heritage        <- parent_name
  --  heritage        <- interface_names
  --  interface_names <- interface_name and interface_names
  --  interface_names <- interface_name
  --  options         <- option, options
  --  options         <- option
  --  option          <- "abstract"
  --
  --  Fields is given with a call to Fields procedure
  --  Methods is given with a call to Methods procedure

  procedure Field
    (Input : in String);

  procedure Fields
    (Inputs : in String_Array);
  --  build an vector of model.field.object_t given a string array
  --  each element of input follows the format :
  --  "field_name : field_type \( := field_default_value \)? \(, option\)*"

  --  known field_type:
  --  vector => it is a vector of current class element
  --  other_class.vector

  --  option depends of field_type
  --  vector => has    (is the vector empty)
  --            number (vector length)
  --            get_i  (return an vector element given its index)
  --            add    (add an element to the vector)
  --  any    => get
  --            set

  procedure Method
    (Input : in String);

  procedure Methods
    (Input : in String_Array);

  procedure Process_Project;

end Project_Loader;
