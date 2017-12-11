package Project_Loader.Operation_Factory is

  function Self_In
    return not null access Model.Parameter.Object_T'Class;

  function Self_In_Out
    return not null access Model.Parameter.Object_T'Class;

  function Create_Operation_And_Add_To_Namespace
    (Name    : in String;
     Of_Type : in String := "")
    return not null access Model.Parameter.Object_T'Class;

end Project_Loader.Operation_Factory;
