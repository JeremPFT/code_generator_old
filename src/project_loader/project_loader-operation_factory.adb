package body Project_Loader.Operation_Factory is

  function Self_In
    return not null access Model.Parameter.Object_T'Class
  is
  begin
  end Self_In;

  function Self_In_Out
    return not null access Model.Parameter.Object_T'Class
  is
  begin
  end Self_In_Out;

  function Create_Operation_And_Add_To_Namespace
    (Name         : in     String;
     Of_Type      : in     String                          := "";
     In_Namespace : access Model.Namespace.Object_T'Class;
     Visibility   : in     Model.Namespace.Visibility_Kind :=
       Model.Namespace.Public_Visibility;
     Is_Separate  : in     Boolean                         := False;
     Is_Abstract  : in     Boolean                         := False)
    return not null access Model.Parameter.Object_T'Class
  is
    Result : access Model.Operation.Object_T'Class := null;
  begin
    Result := Model.Operation.Create
      (Name       => Name,
       Of_Type    => Of_Type,
       In_Package => Current_Package);
  end Create_Operation_And_Add_To_Namespace;

end Project_Loader.Operation_Factory;
