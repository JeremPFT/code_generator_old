with Aunit.Assertions;
use Aunit.Assertions;

with Ada.Text_Io;
with Ada.Exceptions;

with Model.Root_Project;
with Model.Project;

with Expected;
with Tests_Impl.Utils; 
use Tests_Impl.Utils;

with Project_Loader;

procedure Tests_Impl.Root_Project
is
   package T_Io renames Ada.Text_Io;
   package Load renames Project_Loader;

   function Root_Project return not null access Model.Root_Project.Object_T'class
     renames Project_Loader.Get_Root_Project;

   Data : Tests_Data;

   procedure Setup;

   procedure Has_Valid_Path;
   procedure Has_Valid_Name;
   procedure Subprojects_Length_Incremented;
   procedure Subproject_By_Name;
   procedure Subproject_By_Index;

   Module_Name : constant String := "module 1";

   procedure Setup
   is
   begin
      Load.Root_Project ( Path => "path", Project_Name => "project" );
      load.Project ( Module_name );
      --  Project_Loader.Class( 
   end Setup;

   procedure Has_Valid_Path
   is
      Name : constant String := "Has_Valid_Path";
   begin
      Assert
        ( Root_Project.all.Get_Directory = Expected.Root_Project.Get_Directory,
         "chemin du projet" );
      Ok ( Name, Data );
   exception
      when E : others =>
         Ko ( Name, Data );
   end Has_Valid_Path;

   procedure Has_Valid_Name
   is
      Name : constant String := "Has_Valid_Name";
   begin
      Assert
        ( Root_Project.all.Get_Name = Expected.Root_Project.Get_Name,
         "nom du projet");
      Ok ( Name, Data );
   exception
      when E : others =>
         Ko ( Name, Data );
   end Has_Valid_Name;

   procedure Subprojects_Length_Incremented
   is
      Name : constant String := "Subprojects_Length_Incremented";
   begin
      Assert 
        ( Integer ( Root_Project.all.Get_Subprojects.Length ) = 1,
         "nombre de sous projets" );
      Ok ( Name, Data );
   exception
      when E : others =>
         Ko ( Name, Data );
   end Subprojects_Length_Incremented;

   procedure Subproject_By_Name
   is
      Name : constant String := "Subproject_By_Name";
   begin
      Assert ( Root_Project.all.Get_Subproject( Module_Name ) /= null, Name );
      Ok ( Name, Data );
   exception
      when E : others =>
         Ko ( Name, Data );
   end Subproject_By_Name;

   procedure Subproject_By_Index
   is
      Name : constant String := "Subproject_By_Index";
   begin
      Assert ( Root_Project.all.Get_Subproject( 1 ) /= null, Name );
      Ok ( Name, Data );
   exception
      when E : others =>
         Ko ( Name, Data );
   end Subproject_By_Index;

   procedure Invalid_Name
   is
      Name : constant String := "invalid_name";
      Project : access Model.Project.Object_T'Class := null;
   begin
      Project := Root_Project.all.Get_Subproject( "$^%*" );
      ko ( Name, data );
   exception
      when E : constraint_error =>
         ko ( Name, Data, E );
      when E : others =>
         Ko (Name, Data, E );
   end invalid_name;

begin

   Data.Name := new String'("root project");
   T_Io.Put_Line ( "tests: " & Data.Name.all );

   Setup;

   Has_Valid_Path;
   Has_Valid_Name;
   Subprojects_Length_Incremented;
   subproject_by_name;
   Subproject_By_Index;
   Invalid_Name;

   T_Io.Put_Line ( "number of tests:   " & Data.Number'Img );
   T_Io.Put_Line ( "number of tests ok:" & Data.Ok'Img );
   T_Io.Put_Line ( "number of tests ko:" & Data.Ko'Img );

end Tests_Impl.Root_Project;
