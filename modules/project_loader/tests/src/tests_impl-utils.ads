with Ada.Exceptions;

package Tests_impl.Utils is

   type Tests_Data is record
      Name   : access String := null;
      Number : Natural       := 0;
      Ok     : Natural       := 0;
      Ko     : Natural       := 0;
   end record;

   procedure Ok (Test_Name : in     String;
                 Data      : in out Tests_data);

   procedure Ok (Test_Name : in     String;
                 Data      : in out Tests_Data;
                 E         :        Ada.Exceptions.Exception_Occurrence);

   procedure Ko (Test_Name : in     String;
                 Data      : in out Tests_data);

   procedure Ko (Test_Name : in     String;
                 Data      : in out Tests_Data;
                 E         :        Ada.Exceptions.Exception_Occurrence);

end Tests_impl.Utils;
