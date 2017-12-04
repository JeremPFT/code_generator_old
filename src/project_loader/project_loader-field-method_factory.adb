separate (Project_Loader.Field)

package body Method_Factory is

  -----------------------------------------------------------------------------

  function Self_In
    return not null access Model.Parameter.Object_T'Class;

  function Self_In_Out
    return not null access Model.Parameter.Object_T'Class;

  type Param_Array is array (Positive range <>) of
    not null access Model.Parameter.Object_T'Class;

  function Create_Subprogram
    (Name    : in String;
     Of_Type : in String := "")
    return not null access Model.Subprogram.Object_T'Class;

  procedure Create_Subprogram
    (Name      : in String;
     Of_Type   : in String := "";
     Parameter : not null access Model.Parameter.Object_T'Class);

  procedure Create_Subprogram
    (Name       : in String;
     Of_Type    : in String := "";
     Parameters : in Param_Array);

  function Get_Field
    return not null access Model.Field.Object_T'Class;

  -----------------------------------------------------------------------------

  procedure Add
  is
    Parameter_Object : constant access Model.Parameter.Object_T :=
      Model.Parameter.Create
        (Name    => "object",
         Of_Type => "object_t'class",
         Mode    => Model.Parameter.Mode_Not_Null_Access_Constant);
  begin
    Create_Subprogram (Name      => "add_" & Get_Field.Get_Name,
                       Parameter => Parameter_Object);
  end Add;

  -----------------------------------------------------------------------------

  procedure Get
  is
  begin
    Create_Subprogram (Name      => "get_" & Get_Field.Get_Name,
                       Of_Type   => Get_Field.Get_Type,
                       Parameter => Self_In);
  end Get;

  -----------------------------------------------------------------------------

  procedure Set
  is
    Parameter_Value : constant access Model.Parameter.Object_T :=
      Model.Parameter.Create
        (Name    => "value",
         Of_Type => Get_Field.Get_Type,
         Mode    => Model.Parameter.Mode_Not_Null_Access_Constant);
  begin
    Create_Subprogram
      (Name       =>  "set_" & Get_Field.Get_Name,
       Parameters => (Self_In_Out, Parameter_Value));
  end Set;

  -----------------------------------------------------------------------------

  procedure Number_Of
  is
  begin
    Create_Subprogram
      (Name      => "number_of_" & Get_Field.Get_Name,
       Of_Type   => "natural",
       Parameter => Self_In);
  end Number_Of;

  -----------------------------------------------------------------------------

  procedure Get_I
  is
    Parameter_Index : constant access Model.Parameter.Object_T :=
      Model.Parameter.Create
        (Name    => "index",
         Of_Type => "positive");
  begin
    Create_Subprogram
      (Name       => "get_" & Get_Field.Get_Name,
       Of_Type    => Get_Field.Get_Type,
       Parameters => (Self_In, Parameter_Index));
  end Get_I;

  -----------------------------------------------------------------------------

  procedure Has
  is
    Parameter_Value : constant access Model.Parameter.Object_T :=
      Model.Parameter.Create
        (Name    => "value",
         Of_Type => Get_Field.Get_Type,
         Mode    => Model.Parameter.Mode_Not_Null_Access_Constant);
  begin
    Create_Subprogram
      (Name       => "has_" & Get_Field.Get_Name,
       Of_Type    => "boolean",
       Parameters => (Self_In, Parameter_Value));
  end Has;

  -----------------------------------------------------------------------------

  function Self_In
    return not null access Model.Parameter.Object_T'Class
    is (Model.Parameter.Create
          (Name    => "self",
           Of_Type => "object_t"));

  function Self_In_Out
    return not null access Model.Parameter.Object_T'Class
    is (Model.Parameter.Create
          (Name    => "self",
           Of_Type => "object_t",
           Mode    => Model.Parameter.Mode_In_Out));

  function Create_Subprogram
    (Name    : in String;
     Of_Type : in String := "")
    return not null access Model.Subprogram.Object_T'Class
  is
  begin
    return Model.Subprogram.Create
      (Name          => Name,
       Owner_Package => Current_Class.Owner_Package,
       Of_Type       => Of_Type);
  end Create_Subprogram;

  procedure Create_Subprogram
    (Name      : in String;
     Of_Type   : in String := "";
     Parameter : not null access Model.Parameter.Object_T'Class)
  is
    Subprogram : constant access Model.Subprogram.Object_T :=
      Create_Subprogram (Name, Of_Type);
  begin
    Subprogram.Add_Parameter (Parameter);
    Current_Class.Owner_Package.Add_Public_Subprogram (Subprogram);
  end Create_Subprogram;

  procedure Create_Subprogram
    (Name       : in String;
     Of_Type    : in String := "";
     Parameters : in Param_Array)
  is
    Subprogram : constant access Model.Subprogram.Object_T :=
      Create_Subprogram (Name, Of_Type);
  begin
    for Parameter of Parameters loop
      Subprogram.Add_Parameter (Parameter);
    end loop;

    Current_Class.Owner_Package.Add_Public_Subprogram (Subprogram);
  end Create_Subprogram;

  function Get_Field
    return not null access Model.Field.Object_T'Class
    is (Current_Class.Get_Field (Current_Class.Number_Of_Fields));

  -----------------------------------------------------------------------------

end Method_Factory;
