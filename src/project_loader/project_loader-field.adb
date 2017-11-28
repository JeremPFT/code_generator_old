with Ada.Text_IO;
with Ada.Containers;
use type Ada.Containers.Count_Type;

with Ada.Strings.Fixed;
with Model.Field;

separate (Project_Loader)
procedure Field
(Input : in String)
is

-----------------------------------------------------------------------------

type Parsed_Data_T is
record
Field_Data : access String := null;
Options    : access String := null;

Field_Name,
Field_Type,
Field_Default : access String := null;

is abstract tagged null record;
procedure Process (Self : in Option_T) is abstract;

---------------------------------------------------------------------------

type Treat_As_String_Option_T is new Option_T with null record;

overriding
procedure Process (Self : in Treat_As_String_Option_T);

---------------------------------------------------------------------------

type Create_Option_T is new Option_T with null record;

overriding
procedure Process (Self : in Create_Option_T);

---------------------------------------------------------------------------

type Get_I_Option_T is new Option_T with null record;

overriding
procedure Process (Self : in Get_I_Option_T);

---------------------------------------------------------------------------

type Has_Option_T is new Option_T with null record;

overriding
procedure Process (Self : in Has_Option_T);

---------------------------------------------------------------------------

type Number_Option_T is new Option_T with null record;

overriding
procedure Process (Self : in Number_Option_T);

---------------------------------------------------------------------------

type Add_Option_T is new Option_T with null record;

overriding
procedure Process (Self : in Add_Option_T);

---------------------------------------------------------------------------

function Option_Factory
(Key : in String)
return access Option_T'Class;

---------------------------------------------------------------------------

end Options;

package body Options is separate;

procedure Process_Options
is
I : Integer := 1;
use Options;
begin
loop
exit when I > Integer (Parsed_Data.Options_Coll.Length);

Option_Factory (Parsed_Data.Options_Coll (I)).Process;

I := I + 1;
end loop;
end Process_Options;

-----------------------------------------------------------------------------

procedure Build_Object
is
package Mdl_Fld renames Model.Field;

Default : constant String :=
(if Parsed_Data.Field_Default /= null then
Parsed_Data.Field_Default.all
else "");

Fld : constant access Mdl_Fld.Object_T := Mdl_Fld.Create
(Name         => Parsed_Data.Field_Name.all,
Owner_Class   => Last_Class,
Of_Type       => Parsed_Data.Field_Type.all,
Default_Value => Default);
begin
Last_Class.Add_Field (Fld);

if False then
Debug (Fld.all);
end if;
end Build_Object;

-----------------------------------------------------------------------------

procedure Debug (Fld : in Model.Field.Object_T)
is
package T_IO renames Ada.Text_IO;
begin
T_IO.Put_Line ("add field from");
T_IO.Put_Line (Input);
T_IO.Put_Line ("""" & Fld.Get_Name &
""" : """ & Fld.Get_Type &
(if Fld.Has_Default_Value then
""" := """ & Fld.Get_Default_Value & """"
else ""));

if Parsed_Data.Options_Coll.Length = 0 then
T_IO.Put_Line ("  no options");
else
T_IO.Put ("  options : ");
for I in 1 .. Parsed_Data.Options_Coll.Length loop
T_IO.Put ("""" & Parsed_Data.Options_Coll (Integer (I)) & """" &
(if I < Parsed_Data.Options_Coll.Length then
", "
else ""));
end loop;
T_IO.New_Line;
end if;
end Debug;

-----------------------------------------------------------------------------

begin
Main;
end Field;
