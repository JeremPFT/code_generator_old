with Aunit.Assertions;
use Aunit.Assertions;

with Ada.Text_Io;
with Ada.Exceptions;

with Model.root_project;

with Expected;
with Tests_impl.Utils; 
use Tests_impl.Utils;

with Project_Loader;

procedure Tests_Impl.Project
is
   package T_Io renames Ada.Text_Io;
   package Load renames Project_Loader;

   function Root_Project return not null access Model.Root_Project.Object_T'class
     renames Project_Loader.Get_Root_Project;

   Data : Tests_Data;

   procedure Setup;

   procedure Has_Valid_Name;

   Module_Name : constant String := "module 1";

   procedure Setup
   is
   begin
      Load.Project ( Name => "module 1" );
   end Setup;

   procedure Has_Valid_Name
   is
      Name : constant String := "Has_Valid_Name";
   begin
      Assert
        ( Root_Project.Get_Name = Expected.Project.Get_Name,
         "nom du projet");
      Ok ( Name, data );
   exception
      when E : others =>
         Ko ( Name, data );
   end Has_Valid_Name;



begin

   Data.Name := new String'("project");
   T_Io.Put_Line ( "tests: " & Data.Name.all );

   Setup;

   Has_Valid_Name;
   
   T_Io.Put_Line ( "number of tests:   " & Data.Number'Img );
   T_Io.Put_Line ( "number of tests ok:" & Data.Ok'Img );
   T_Io.Put_Line ( "number of tests ko:" & Data.Ko'Img );

end Tests_Impl.Project;
