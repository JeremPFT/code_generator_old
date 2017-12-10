--  with Ada.Exceptions;
with Model.Namespace;

separate (Project_Loader.Field)

package body Method_Factory is

  -----------------------------------------------------------------------------
  --  predefined parameters

  function Self_In
    return not null access Model.Parameter.Object_T'Class;
  --  "Self : in Object_T"

  function Self_In_Out
    return not null access Model.Parameter.Object_T'Class;
  --   "Self : in out Object_T"

  -----------------------------------------------------------------------------
  --  utilities to create subprogram

  type Param_Array is array (Positive range <>) of
    not null access Model.Parameter.Object_T'Class;

  procedure Create_Subprogram
    (Name      : in String;
     Of_Type   : in String := "";
     Parameter : not null access Model.Parameter.Object_T'Class);
  --  with 1 parameter

  procedure Create_Subprogram
    (Name       : in String;
     Of_Type    : in String := "";
     Parameters : in Param_Array);
  --  with at least 2 parameters

  Current_Field : constant access Model.Field.Object_T'Class :=
    (Current_Class.Get_Field (Current_Class.Number_Of_Fields));

  -----------------------------------------------------------------------------

  procedure Add
  is
    Parameter_Object : constant access Model.Parameter.Object_T :=
      Model.Parameter.Create
        (Name            => "object",
         Owner_Namespace => Current_Package.Get_Defined_Namespace,
         Of_Type         => "object_t'class",
         Mode            => Model.Parameter.Mode_Not_Null_Access_Constant);
  begin
    Create_Subprogram (Name      => "add_" & Current_Field.Get_Name,
                       Parameter => Parameter_Object);
  end Add;

  -----------------------------------------------------------------------------

  procedure Get
  is
  begin
    Create_Subprogram (Name      => "get_" & Current_Field.Get_Name,
                       Of_Type   => Current_Field.Get_Type,
                       Parameter => Self_In);
  end Get;

  -----------------------------------------------------------------------------

  procedure Set
  is
    Parameter_Value : constant access Model.Parameter.Object_T :=
      Model.Parameter.Create
        (Name            => "value",
         Owner_Namespace => Current_Package.Get_Defined_Namespace,
         Of_Type         => Current_Field.Get_Type,
         Mode            => Model.Parameter.Mode_Not_Null_Access_Constant);
  begin
    Create_Subprogram
      (Name       =>  "set_" & Current_Field.Get_Name,
       Parameters => (Self_In_Out, Parameter_Value));
  end Set;

  -----------------------------------------------------------------------------

  procedure Number_Of
  is
  begin
    Create_Subprogram
      (Name      => "number_of_" & Current_Field.Get_Name,
       Of_Type   => "natural",
       Parameter => Self_In);
  end Number_Of;

  -----------------------------------------------------------------------------

  procedure Get_I
  is
    Parameter_Index : constant access Model.Parameter.Object_T :=
      Model.Parameter.Create
        (Name            => "index",
         Owner_Namespace => Current_Package.Get_Defined_Namespace,
         Of_Type         => "positive");
  begin
    Create_Subprogram
      (Name       => "get_" & Current_Field.Get_Name,
       Of_Type    => Current_Field.Get_Type,
       Parameters => (Self_In, Parameter_Index));
  end Get_I;

  -----------------------------------------------------------------------------

  procedure Has
  is
    Parameter_Value : constant access Model.Parameter.Object_T :=
      Model.Parameter.Create
        (Name            => "value",
         Owner_Namespace => Current_Package.Get_Defined_Namespace,
         Of_Type         => Current_Field.Get_Type,
         Mode            => Model.Parameter.Mode_Not_Null_Access_Constant);
  begin
    Create_Subprogram
      (Name       => "has_" & Current_Field.Get_Name,
       Of_Type    => "boolean",
       Parameters => (Self_In, Parameter_Value));
  end Has;

  -----------------------------------------------------------------------------
  --  utilities definitions

  function Self_In
    return not null access Model.Parameter.Object_T'Class
    is (Model.Parameter.Create
          (Name            => "self",
           Owner_Namespace => Current_Package.Get_Defined_Namespace,
           Of_Type         => "object_t"));

  function Self_In_Out
    return not null access Model.Parameter.Object_T'Class
    is (Model.Parameter.Create
          (Name            => "self",
           Owner_Namespace => Current_Package.Get_Defined_Namespace,
           Of_Type         => "object_t",
           Mode            => Model.Parameter.Mode_In_Out));

  function Create_Subprogram_And_Add_To_Namespace
    (Name    : in String;
     Of_Type : in String := "")
    return not null access Model.Subprogram.Object_T'Class;

  procedure Create_Subprogram
    (Name      : in String;
     Of_Type   : in String := "";
     Parameter : not null access Model.Parameter.Object_T'Class)
  is
    Subprogram : constant access Model.Subprogram.Object_T :=
      Create_Subprogram_And_Add_To_Namespace (Name, Of_Type);
  begin
    Subprogram.Add_Parameter (Parameter);
  end Create_Subprogram;

  procedure Create_Subprogram
    (Name       : in String;
     Of_Type    : in String := "";
     Parameters : in Param_Array)
  is
    Subprogram : constant access Model.Subprogram.Object_T :=
      Create_Subprogram_And_Add_To_Namespace (Name, Of_Type);
  begin
    for Parameter of Parameters loop
      Subprogram.Add_Parameter (Parameter);
    end loop;
  end Create_Subprogram;

  function Create_Subprogram_And_Add_To_Namespace
    (Name    : in String;
     Of_Type : in String := "")
    return not null access Model.Subprogram.Object_T'Class
  is
    Result : access Model.Subprogram.Object_T'Class := null;
  begin
    Result := Model.Subprogram.Create
      (Name    => Name,
       Of_Type => Of_Type);

    Current_Class.Get_Owner_Namespace.Add_Member
      (Object     => Result,
       Visibility => Model.Namespace.Public_Visibility);

    return Result;
  end Create_Subprogram_And_Add_To_Namespace;

  -----------------------------------------------------------------------------

end Method_Factory;
