with Ada.Strings.Fixed;
with Ada.Containers;
use type Ada.Containers.Count_Type;

with Split;

with Model.Class_Def;
with Model.Package_Def;

separate (Project_Loader)

procedure Class
  (Input : in String)
is

  -----------------------------------------------------------------------------

  type Parsed_Data_T is
    record
      Class_Data : access String := null;
      Options    : access String := null;

      Class_Name : access String         := null;
      Heritage   : String_Vectors.Vector := String_Vectors.Empty_Vector;

      Options_Coll : String_Vectors.Vector := String_Vectors.Empty_Vector;

      Opt_Abstract : Boolean := False;
      --  Has_Create  : Boolean := False;
    end record;

  Parsed_Data : Parsed_Data_T;

  -----------------------------------------------------------------------------

  procedure Main;
  procedure Check_Global_Input;
  procedure Separate_Data_From_Options;
  procedure Set_Class_Name_And_Heritage;
  procedure Fill_Options_Coll;
  procedure Process_Options;
  procedure Build_Objects;

  -----------------------------------------------------------------------------

  procedure Main
  is
  begin
    Close_Current_Class;
    Close_Current_Package;

    Check_Global_Input;
    Separate_Data_From_Options;
    Set_Class_Name_And_Heritage;
    Fill_Options_Coll;
    Process_Options;
    Build_Objects;
  end Main;

  -----------------------------------------------------------------------------

  procedure Check_Semi_Colons;
  procedure Check_Colons;

  Bad_Input : exception renames Bad_Class_Input_Format;

  procedure Check_Global_Input
  is
  begin
    Check_Semi_Colons;
    Check_Colons;
  end Check_Global_Input;

  package F_Str renames Ada.Strings.Fixed;

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

  procedure Check_Colons
  is
    Error_Message : constant String :=
      "there at least 3 colons in """ & Input & """";
  begin
    if F_Str.Count (Source => Input, Pattern => ":") > 2 then
      raise Bad_Input
        with Error_Message;
    end if;
  end Check_Colons;

  -----------------------------------------------------------------------------

  procedure Separate_Data_From_Options
  is
    Vector : constant String_Vectors.Vector :=
      Split (Source => Input, Separator => ";");
  begin
    Parsed_Data.Class_Data := new String'(Vector.First_Element);

    if Vector.Length = 2 then
      Parsed_Data.Options := new String'(Vector.Last_Element);
    end if;
  end Separate_Data_From_Options;

  -----------------------------------------------------------------------------

  procedure Set_Class_Name_And_Heritage
  is
    Tmp : constant String_Vectors.Vector :=
      Split (Source    => Parsed_Data.Class_Data.all,
             Separator => ":");
  begin
    Parsed_Data.Class_Name := new String'(Tmp.First_Element);

    Fill_Heritage :
    declare
      I : Integer := 2;
    begin
      On_Others_Elements :
      loop
        exit On_Others_Elements when I > Integer (Tmp.Length);

        Parsed_Data.Heritage.Append (Tmp (I));
        I := I + 1;
      end loop On_Others_Elements;
    end Fill_Heritage;
  end Set_Class_Name_And_Heritage;

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

    type Abstract_Option_T is new Option_T with null record;

    overriding
    procedure Process (Self : in Abstract_Option_T);

    type Create_Option_T is new Option_T with null record;

    overriding
    procedure Process (Self : in Create_Option_T);

    type Init_Option_T is new Option_T with null record;

    overriding
    procedure Process (Self : in Init_Option_T);

    function Option_Factory
      (Key : in String)
      return access Option_T'Class;

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

  procedure Build_Objects
  is
  begin
    Current_Package :=
      Model.Package_Def.Create
        (Name   => Parsed_Data.Class_Name.all,
         Parent => Model.Package_Def.Class_T
           (Current_Module.Get_Elements.First_Element));

    Current_Class := Model.Class_Def.Create
      (Owner_Package => Current_Package,
       Name          => "object_t",
       Is_Abstract   => Parsed_Data.Opt_Abstract);

    Current_Package.Add_Public_Class (Current_Class);

    Current_Module.Add_Package (Current_Package);

    --  if Parsed_Data.Has_Create then
    --    declare
    --      Create_Function : access Model.Subprogram.Object_T := null;
    --    begin
    --      Create_Function :=
    --        Model.Subprogram.Create
    --          (Name           => "create",
    --           Of_Type        => "not null access object_t",
    --           Parent_Package => Built_Pkg);
    --    end;
    --  end if;

  end Build_Objects;

  -----------------------------------------------------------------------------

begin

  Main;

end Class;
