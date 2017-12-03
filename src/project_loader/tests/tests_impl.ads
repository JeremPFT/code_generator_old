with Project_Loader;

package Tests_Impl is

  procedure Init_Check_Project;
  procedure Init_Check_Module;
  procedure Init_Check_Class;
  procedure Init_Check_Field;

  procedure Check_Project_Has_Valid_Path;
  procedure Check_Project_Has_Valid_Name;

  procedure Check_Module_Only_Its_Root_Package;
  procedure Check_Module_Has_Valid_Module_Number;
  procedure Check_Module_Has_Valid_Module_Name;
  procedure Check_Module_Error_If_Unknown_Module_Name;

  procedure Check_Class_Is_Added;
  procedure Check_Class_Package_Is_Created;
  procedure Check_Class_Has_Valid_Name;

  procedure Check_Field_Number;
  procedure Check_Field_Add_2_Basic_Fields;
  procedure Check_Field_With_Get;
  procedure Check_Field_With_Set;
  procedure Check_Field_With_Get_Set;
  procedure Check_Field_Unkown_Option;
  procedure Check_Vector_Field_Same_Class;
  procedure Check_Vector_Field_Other_Class;

end Tests_Impl;
