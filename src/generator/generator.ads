with Model.Visitor.Template;
with Model.Class_Def;
--  with Model.Interface_Def;
--  with Model.Comment;
--  with Model.Element;
with Model.Field;
with Model.Package_Def;
with Model.Project;
with Model.Module;
with Model.Parameter;
with Model.Operation;
with Project_Loader;

package Generator is

  procedure Generate
    (Project_Data : in Project_Loader.Data_T);

private

  type Object_T is new Model.Visitor.Template.Object_T with null record;

  overriding
  procedure Visit_Module
    (Self   : in out Object_T;
     Object : in     Model.Module.Object_T'Class);

  overriding
  procedure Visit_Package
    (Self   : in out Object_T;
     Object : in     Model.Package_Def.Object_T'Class);

  overriding
  procedure Visit_Class
    (Self   : in out Object_T;
     Object : in     Model.Class_Def.Object_T'Class);

  overriding
  procedure Visit_Field
    (Self   : in out Object_T;
     Object : in     Model.Field.Object_T'Class);

  overriding
  procedure Visit_Operation
    (Self   : in out Object_T;
     Object : in     Model.Operation.Object_T'Class);

  overriding
  procedure Visit_Parameter
    (Self   : in out Object_T;
     Object : in     Model.Parameter.Object_T'Class);

end Generator;
