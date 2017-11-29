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

      Opt_Create,
        Opt_Add
        : Boolean := False;

      Options_Coll : String_Vectors.Vector := String_Vectors.Empty_Vector;
    end record;

  Parsed_Data : Parsed_Data_T;

  -----------------------------------------------------------------------------

  procedure Main;
  procedure Check_Global_Input;
  procedure Separate_Data_From_Options;
  procedure Set_Field_Data;
  procedure Fill_Options_Coll;
  procedure Process_Options;
  procedure Build_Object;
  procedure Debug (Fld : in Model.Field.Object_T);

  -----------------------------------------------------------------------------

  procedure Main
  is
  begin
    Check_Global_Input;
    Separate_Data_From_Options;
    Set_Field_Data;
    Fill_Options_Coll;
    Process_Options;
    Build_Object;
  end Main;

  -----------------------------------------------------------------------------

  procedure Check_Semi_Colons;

  Bad_Input : exception renames Bad_Field_Input_Format;

  package F_Str renames Ada.Strings.Fixed;

  procedure Check_Global_Input
  is
  begin
    Check_Semi_Colons;
  end Check_Global_Input;

  procedure Check_Semi_Colons
  is
    Error_Message : constant String :=
      "there at least 2 semi-colons in """ & Input & """";
  begin
    if F_Str.Count (Source => Input, Pattern => ";") > 1 then
      raise Bad_Input
        with Error_Message;
    end if;
  end Check_Semi_Colons;

  -----------------------------------------------------------------------------

  procedure Separate_Data_From_Options
  is
    Vector : constant String_Vectors.Vector :=
      Split (Source => Input, Separator => ";");
  begin
    Parsed_Data.Field_Data := new String'(Vector.First_Element);

    if Vector.Length = 2 then
      Parsed_Data.Options := new String'(Vector.Last_Element);
    end if;
  end Separate_Data_From_Options;

  -----------------------------------------------------------------------------

  procedure Set_Field_Data
  is
    On_Equal : constant String_Vectors.Vector :=
      Split (Source    => Parsed_Data.Field_Data.all,
             Separator => ":=");
    On_Colon : constant String_Vectors.Vector :=
      Split (Source    => On_Equal.First_Element,
             Separator => ":");
  begin
    Parsed_Data.Field_Name := new String'(On_Colon.First_Element);
    Parsed_Data.Field_Type := new String'(On_Colon.Last_Element);

    if On_Equal.Length = 2 then
      Parsed_Data.Field_Default := new String'(On_Equal.Last_Element);
    end if;
  end Set_Field_Data;

  -----------------------------------------------------------------------------

  procedure Fill_Options_Coll
  is
  begin
    if Parsed_Data.Options /= null then
      Parsed_Data.Options_Coll :=
        Split (Source    => Parsed_Data.Options.all,
               Separator => ",");
    end if;
  end Fill_Options_Coll;

  -----------------------------------------------------------------------------

  package Options is

    type Option_T
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

    type Get_Option_T is new Option_T with null record;

    overriding
    procedure Process (Self : in Get_Option_T);

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
      (Name          => Parsed_Data.Field_Name.all,
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
