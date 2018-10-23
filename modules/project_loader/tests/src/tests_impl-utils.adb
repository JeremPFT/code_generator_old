with Ada.Text_Io;

package body Tests_impl.Utils is

   package T_Io renames Ada.Text_Io;

   procedure Ok (Test_Name : in     String;
                 Data      : in out Tests_data)
   is
   begin
      Ada.Text_Io.Put_Line ( Test_Name & " OK" );
      Data.Ok := Data.Ok + 1;
      Data.Number := Data.Number + 1;
   end Ok;

   procedure Ko (Test_Name : in     String;
                 Data      : in out Tests_data)
   is
   begin
      Ada.Text_Io.Put_Line ( Test_Name & " KO" );
      Data.Ko := Data.Ko + 1;
      Data.Number := Data.Number + 1;
   end Ko;

   procedure Ok (Test_Name : in     String;
                 Data      : in out Tests_Data;
                 E         :        Ada.Exceptions.Exception_Occurrence)
   is
   begin
      T_Io.Put (Ada.Exceptions.Exception_Name (E) & ": " );
      T_Io.Put_line (Ada.Exceptions.Exception_Message (E));
      Ada.Text_Io.Put_Line ( Test_Name & " OK" );
      Data.Ok := Data.Ok + 1;
      Data.Number := Data.Number + 1;
   end Ok;

   procedure Ko (Test_Name : in     String;
                 Data      : in out Tests_Data;
                 E         :        Ada.Exceptions.Exception_Occurrence)
   is
   begin
      T_Io.Put (Ada.Exceptions.Exception_Name (E) & ": " );
      T_Io.Put_line (Ada.Exceptions.Exception_Message (E));
      Ada.Text_Io.Put_Line ( Test_Name & " KO" );
      Data.Ko := Data.Ko + 1;
      Data.Number := Data.Number + 1;
   end Ko;


end Tests_impl.Utils;
