with GNAT.Source_Info;

with Model.Parameter;

package Fixtures is

  procedure Check
    (Test   : in String;
     Check  : in Boolean;
     Source : in String  := GNAT.Source_Info.File;
     Line   : in Natural := GNAT.Source_Info.Line);

  procedure Check
    (Test             : in String;
     Actual, Expected : in String;
     Source           : in String  := GNAT.Source_Info.File;
     Line             : in Natural := GNAT.Source_Info.Line);

  procedure Check
    (Test             : in String;
     Actual, Expected : in Boolean;
     Source           : in String  := GNAT.Source_Info.File;
     Line             : in Natural := GNAT.Source_Info.Line);

  procedure Check
    (Test             : in String;
     Actual, Expected : in Integer;
     Source           : in String  := GNAT.Source_Info.File;
     Line             : in Natural := GNAT.Source_Info.Line);

  Named_Element_1_Name : constant String := "a_name";

  Comment_1_Body : constant String := "a comment to show nothing";

  Field_1_Name    : constant String  := "a_field_1";
  Field_1_Type    : constant String  := "natural";
  Field_1_Default : constant String  := "";
  Field_1_Getter  : constant Boolean := False;
  Field_1_Setter  : constant Boolean := True;

  Field_2_Name    : constant String  := "a_field_2";
  Field_2_Type    : constant String  := "text";
  Field_2_Default : constant String  := """default_string""";
  Field_2_Getter  : constant Boolean := True;
  Field_2_Setter  : constant Boolean := False;

  Field_3_Name    : constant String  := "a_boolean_field_3";
  Field_3_Type    : constant String  := "boolean";
  Field_3_Default : constant String  := "false";
  Field_3_Getter  : constant Boolean := True;
  Field_3_Setter  : constant Boolean := True;

  Class_1_Name : constant String := "class_1_name";

  subtype Param_Mode_T is Model.Parameter.Param_Mode_T;

  P_Mode_In                       : Param_Mode_T
    renames Model.Parameter.P_Mode_In;
  P_Mode_In_Out                   : Param_Mode_T
    renames Model.Parameter.P_Mode_In_Out;
  P_Mode_Not_Null_Access_Constant : Param_Mode_T
    renames Model.Parameter.P_Mode_Not_Null_Access_Constant;

  Parameter_1_Name    : constant String := "a_natural_parameter_1";
  Parameter_1_Type    : constant String := "natural";
  Parameter_1_Default : constant String := "";
  --  Parameter_1_Mode    : constant Param_Mode_T := P_Mode_In;

  Parameter_2_Name    : constant String := "a_string_parameter_2";
  Parameter_2_Type    : constant String := "string";
  Parameter_2_Default : constant String := """default_string""";
  --  Parameter_2_Mode    : constant Param_Mode_T := P_Mode_In_Out;

  Parameter_3_Name    : constant String := "a_boolean_parameter_3";
  Parameter_3_Type    : constant String := "boolean";
  Parameter_3_Default : constant String := "false";
  --  Parameter_3_Mode    : constant Param_Mode_T := P_Mode_Not_Null_Access_Constant;

  Subprogram_1_Name        : constant String  := "sub_1_procedure_wo_param";
  Subprogram_2_Name        : constant String  := "sub_2_procedure_w_param";
  Subprogram_3_Name        : constant String  := "sub_3_function_wo_param";
  Subprogram_3_Type        : constant String  := "boolean";
  Subprogram_3_Is_Abstract : constant Boolean := True;
  Subprogram_3_Is_Separate : constant Boolean := True;
  Subprogram_4_Name        : constant String  := "sub_4_function_w_param";
  Subprogram_4_Type        : constant String  := "integer";

  Declaration_1 : constant String := "une_variable : string := truc;";
  Declaration_2 : constant String := "une_variable_2 : natural := 0;";
  Instruction_1 : constant String := "une_variable := une_variable & ""x"";";
  Instruction_2 : constant String := "return une_variable_2;";

  Package_1_Name : constant String := "package_name_1";
  Package_2_Name : constant String := "package_name_2";
  Package_3_Name : constant String := "package_name_3";

  Array_1_Name           : constant String := "an_array";
  Array_1_Contained_Type : constant String := "string_acc";
  Array_1_Index_Type     : constant String := "positive";
  Array_1_Range          : constant String := "1 .. 10";

  --  function Array_1
  --    return not null access Model.Core.Array_T;

  --  function Field_1
  --   (Class_1 : not null access Model.Core.Class_T'Class)
  --   return not null access Model.Core.Field_T;

  --  function Field_2
  --   (Class_1 : not null access Model.Core.Class_T'Class)
  --   return not null access Model.Core.Field_T;

  --  function Field_3
  --   (Class_1 : not null access Model.Core.Class_T'Class)
  --   return not null access Model.Core.Field_T;

  --  function Class_1
  --   (Package_1 : not null access Model.Core.Package_T'Class)
  --   return not null access Model.Core.Class_T;

  --  function Parameter_1
  --    return not null access Model.Core.Parameter_T;

  --  function Parameter_2
  --    return not null access Model.Core.Parameter_T;

  --  function Parameter_3
  --    return not null access Model.Core.Parameter_T;

  --  function Subprogram_1
  --   (Package_1 : access Model.Core.Package_T'Class := null)
  --   return not null access Model.Core.Subprogram_T;

  --  function Subprogram_2
  --   (Package_1 : access Model.Core.Package_T'Class := null)
  --   return not null access Model.Core.Subprogram_T;

  --  function Subprogram_3
  --   (Package_1 : access Model.Core.Package_T'Class := null)
  --   return not null access Model.Core.Subprogram_T;

  --  function Subprogram_4
  --   (Package_1 : access Model.Core.Package_T'Class := null)
  --   return not null access Model.Core.Subprogram_T;

  --  function Package_1
  --    return not null access Model.Core.Package_T;

end Fixtures;
