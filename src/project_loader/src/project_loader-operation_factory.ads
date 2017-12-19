with Model.Operation;
with Model.Named_Element;
with Model.Parameter;

package Project_Loader.Operation_Factory is

  function Self_In
    return not null access Model.Parameter.Object_T'Class;

  function Self_In_Out
    return not null access Model.Parameter.Object_T'Class;

  function Create_Operation_And_Add_To_Namespace
    (Name       : in     String;
     Of_Type    : in     String                           := "";
     --  In_Namespace : access Model.Namespace.Object_T'Class;
     Visibility : in     Model.Named_Element.Visibility_T :=
       Model.Named_Element.Public_Visibility;
     Properties : in     Model.Operation.Property_T)
    return not null access Model.Operation.Object_T'Class;

end Project_Loader.Operation_Factory;
