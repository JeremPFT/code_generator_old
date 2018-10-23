with Tests_Impl;
with Tests_Impl.Root_project;
with Tests_Impl.project;


procedure Tests is

   package Test renames Tests_Impl;

begin
   --  Tests_Impl.Init_Check_Project;
   --  Tests_Impl.Check_Project_Has_Valid_Path;
   --  Tests_Impl.Check_Project_Has_Valid_Name;
   Test.Root_Project;
   --  Test.Project;
end Tests;

