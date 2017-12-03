with Project_Loader;

package Tests_Impl is

  procedure Initialize
    (Data : Project_Loader.Data_T);

  procedure Check_Project_Has_Valid_Path;
  procedure Check_Project_Has_Valid_Name;

  procedure Check_Module_Has_Valid_Module_Number;
  procedure Check_Module_Has_Valid_Module_Name;
  procedure Check_Module_Error_If_Unknown_Module_Name;

  procedure Check_Class_Has_Valid_Name;

end Tests_Impl;
