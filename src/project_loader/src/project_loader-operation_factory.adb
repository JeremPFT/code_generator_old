package body Project_Loader.Operation_Factory is

  function Self_In
    return not null access Model.Parameter.Object_T'Class
  is
  begin
    return Model.Parameter.Create
      (Name            => "self",
       Owner_Namespace => Current_Namespace,
       Of_Type         => "object_t");
  end Self_In;

  function Self_In_Out
    return not null access Model.Parameter.Object_T'Class
  is
  begin
    return Model.Parameter.Create
      (Name            => "self",
       Owner_Namespace => Current_Namespace,
       Of_Type         => "object_t",
       Mode            => Model.Parameter.Mode_In_Out);
  end Self_In_Out;

  function Create_Operation_And_Add_To_Namespace
    (Name       : in     String;
     Of_Type    : in     String                           := "";
     --  In_Namespace : access Model.Namespace.Object_T'Class;
     Visibility : in     Model.Named_Element.Visibility_T :=
       Model.Named_Element.Public_Visibility;
     Properties : in     Model.Operation.Property_T)
    return not null access Model.Operation.Object_T'Class
  is
    Result : access Model.Operation.Object_T'Class := null;
  begin
    Result := Model.Operation.Create
      (Name       => Name,
       Of_Type    => Of_Type,
       In_Package => Current_Package,
       Properties => Properties,
       Visibility => Visibility);

    Current_Namespace.Add_Member
      (Object => Result);

    return Result;
  end Create_Operation_And_Add_To_Namespace;

end Project_Loader.Operation_Factory;
