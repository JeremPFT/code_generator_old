with Split;
with Ada.Strings.Fixed;

with Model.Named_Element;
with Project_Loader.Class_Impl.Options;

package body Project_Loader.Class_Impl is

  procedure Check_Semi_Colons (Input : in String);
  procedure Check_Colons (Input : in String);

  Bad_Input : exception renames Bad_Class_Input_Format;

  procedure Check_Global_Input (Input : in String)
  is
  begin
    Check_Semi_Colons (Input);
    Check_Colons (Input);
  end Check_Global_Input;

  package F_Str renames Ada.Strings.Fixed;

  procedure Check_Semi_Colons (Input : in String)
  is
    Error_Message : constant String :=
      "there at least 2 semi-colons in """ & Input & """";
  begin
    if F_Str.Count (Source => Input, Pattern => ";") > 1 then
      raise Bad_Input
        with Error_Message;
    end if;
  end Check_Semi_Colons;

  procedure Check_Colons (Input : in String)
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

  --  procedure Separate_Data_From_Options
  --  is
  --    Vector : constant String_Vectors.Vector :=
  --      Split (Source => Input, Separator => ";");
  --  begin
  --    Parsed_Data.Class_Data := new String'(Vector.First_Element);

  --    if Vector.Length = 2 then
  --      Parsed_Data.Options := new String'(Vector.Last_Element);
  --    end if;
  --  end Separate_Data_From_Options;

  procedure Separate_Data_From_Options (Input : in String)
  is
    package Str_F renames Ada.Strings.Fixed;

    Backward : Ada.Strings.Direction renames Ada.Strings.Backward;
    Both     : Ada.Strings.Trim_End renames Ada.Strings.Both;

    Has_Semi_Colon : constant Boolean :=
      Str_F.Count (Source => Input, Pattern => ";") > 0;

    Last_Index : constant Integer := Str_F.Index
      (Source  => Input,
       Pattern => ";",
       Going   => Backward);

    Class_Start : constant Integer := Input'First;
    Class_Stop  : constant Integer := (if Has_Semi_Colon then
                                         Last_Index - 1
                                       else Input'Last);

    Option_Start : constant Integer := (if Has_Semi_Colon then Last_Index + 1
                                        else 1);
    Option_Stop : constant Integer := (if Has_Semi_Colon then Input'Last
                                       else 0);

  begin
    Parsed_Data.Class_Data :=
      new String'(Str_F.Trim (Source => Input (Class_Start .. Class_Stop),
                              Side   => Both));
    Parsed_Data.Options    :=
      new String'(Str_F.Trim (Source => Input (Option_Start .. Option_Stop),
                              Side   => Both));

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
    Properties : Model.Types.Class_Def.Property_T :=
      Model.Types.Class_Def.None;
    use type Model.Types.Class_Def.Property_T;
  begin
    Current_Package :=
      Model.Package_Def.Create
        (Name           => Parsed_Data.Class_Name.all,
         Parent_Package => Model.Package_Def.Class_T
           (Current_Project.Get_Elements.First_Element),
         Visibility     => Model.Named_Element.Public_Visibility);

    Current_Namespace := Current_Package.Get_Defined_Namespace;

    if Parsed_Data.Opt_Abstract then
      Properties := Properties or Model.Types.Class_Def.Abstract_Prop;
    end if;

    Current_Class := Model.Types.Class_Def.Create
      (Owner_Package => Current_Package,
       Name          => "object_t",
       Properties    => Properties,
       Visibility    => Model.Named_Element.Public_Visibility);

    Current_Namespace.Add_Member (Current_Class);

    Current_Project.Add_Package (Current_Package);

    --  if Parsed_Data.Has_Create then
    --    declare
    --      Create_Function : access Model.Operation.Object_T := null;
    --    begin
    --      Create_Function :=
    --        Model.Operation.Create
    --          (Name           => "create",
    --           Of_Type        => "not null access object_t",
    --           Parent_Package => Built_Pkg);
    --    end;
    --  end if;

  end Build_Objects;

end Project_Loader.Class_Impl;
