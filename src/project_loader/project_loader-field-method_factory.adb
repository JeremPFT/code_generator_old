--  with Ada.Exceptions;
with Model.Namespace;
with Project_Loader.Operation_Factory;

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
  --  utilities to create operation

  type Param_Array is array (Positive range <>) of
    not null access Model.Parameter.Object_T'Class;

  procedure Create_Operation_With_One_Parameter
    (Name      : in String;
     Of_Type   : in String := "";
     Parameter : not null access Model.Parameter.Object_T'Class);
  --  with 1 parameter

  procedure Create_Operation_With_Some_Parameters
    (Name       : in String;
     Of_Type    : in String := "";
     Parameters : in Param_Array);
  --  with at least 2 parameters

  function Current_Field
    return access Model.Field.Object_T'Class;
  --  Current_Field : constant access Model.Field.Object_T'Class :=
  --    (Current_Class.Get_Field (Current_Class.Number_Of_Fields));

  -----------------------------------------------------------------------------

  procedure Add
  is
    Parameter_Object : constant access Model.Parameter.Object_T :=
      Model.Parameter.Create
        (Name            => "object",
         Owner_Namespace => Current_Namespace,
         Of_Type         => "object_t'class",
         Mode            => Model.Parameter.Mode_Not_Null_Access_Constant);
  begin
    Create_Operation (Name      => "add_" & Current_Field.Get_Name,
                      Parameter => Parameter_Object);
  end Add;

  -----------------------------------------------------------------------------

  procedure Get
  is
  begin
    Create_Operation (Name      => "get_" & Current_Field.Get_Name,
                      Of_Type   => Current_Field.Get_Type,
                      Parameter => Self_In);
  end Get;

  -----------------------------------------------------------------------------

  procedure Set
  is
    Parameter_Value : constant access Model.Parameter.Object_T :=
      Model.Parameter.Create
        (Name            => "value",
         Owner_Namespace => Current_Namespace,
         Of_Type         => Current_Field.Get_Type,
         Mode            => Model.Parameter.Mode_Not_Null_Access_Constant);
  begin
    Create_Operation
      (Name       =>  "set_" & Current_Field.Get_Name,
       Parameters => (Self_In_Out, Parameter_Value));
  end Set;

  -----------------------------------------------------------------------------

  procedure Number_Of
  is
  begin
    Create_Operation
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
         Owner_Namespace => Current_Namespace,
         Of_Type         => "positive");
  begin
    Create_Operation
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
         Owner_Namespace => Current_Namespace,
         Of_Type         => Current_Field.Get_Type,
         Mode            => Model.Parameter.Mode_Not_Null_Access_Constant);
  begin
    Create_Operation
      (Name       => "has_" & Current_Field.Get_Name,
       Of_Type    => "boolean",
       Parameters => (Self_In, Parameter_Value));
  end Has;

  -----------------------------------------------------------------------------
  --  utilities definitions

  function Current_Field
    return access Model.Field.Object_T'Class
  is
    Result        : access Model.Field.Object_T'Class           := null;
    The_Class     : access Model.Types.Class_Def.Object_T'Class := null;
    Fields_Number : Natural                                     := 0;
  begin
    The_Class     := Current_Class;
    Fields_Number := The_Class.Number_Of_Fields;
    Result        := The_Class.Get_Field (Fields_Number);

    return Result;
  end Current_Field;

  function Self_In
    return not null access Model.Parameter.Object_T'Class
    renames Project_Loader.Operation_Factory.Self_In;
  --  is (Model.Parameter.Create
  --        (Name            => "self",
  --         Owner_Namespace => Current_Namespace,
  --         Of_Type         => "object_t"));

  function Self_In_Out
    return not null access Model.Parameter.Object_T'Class
    renames Project_Loader.Operation_Factory.Self_In_Out;
  --  is (Model.Parameter.Create
  --        (Name            => "self",
  --         Owner_Namespace => Current_Namespace,
  --         Of_Type         => "object_t",
  --         Mode            => Model.Parameter.Mode_In_Out));

  function Create_Operation_And_Add_To_Namespace
    (Name    : in String;
     Of_Type : in String := "")
    return not null access Model.Operation.Object_T'Class;

  procedure Create_Operation
    (Name      : in String;
     Of_Type   : in String := "";
     Parameter : not null access Model.Parameter.Object_T'Class)
  is
    Operation : constant access Model.Subprogram.Object_T :=
      Create_Operation_And_Add_To_Namespace (Name, Of_Type);
  begin
    Operation.Add_Parameter (Parameter);
  end Create_Operation;

  procedure Create_Operation
    (Name       : in String;
     Of_Type    : in String := "";
     Parameters : in Param_Array)
  is
    Operation : constant access Model.Subprogram.Object_T :=
      Create_Operation_And_Add_To_Namespace (Name, Of_Type);
  begin
    for Parameter of Parameters loop
      Operation.Add_Parameter (Parameter);
    end loop;
  end Create_Operation;

  function Create_Operation_And_Add_To_Namespace
    (Name    : in String;
     Of_Type : in String := "")
    return not null access Model.Operation.Object_T'Class
  is
    Result : access Model.Operation.Object_T'Class := null;
  begin
    Result := Model.Operation.Create
      (Name       => Name,
       Of_Type    => Of_Type,
       In_Package => Current_Package);

    Current_Namespace.Add_Member
      (Object     => Result,
       Visibility => Model.Namespace.Public_Visibility);

    return Result;
  end Create_Operation_And_Add_To_Namespace;

  -----------------------------------------------------------------------------

end Method_Factory;
