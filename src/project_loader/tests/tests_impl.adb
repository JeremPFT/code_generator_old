with Ada.Text_IO;
with Ada.Tags;

with AUnit.Assertions;
use AUnit.Assertions;

with Model.Named_Element;
with Model.Field;
with Model.Module;
with Model.Class_Def;
with Model.Package_Def;
with Model.Project;
with Expected;

package body Tests_Impl is

  -----------------------------------------------------------------------------

  Data : Project_Loader.Data_T;
  package Load renames Project_Loader;

  -----------------------------------------------------------------------------

  procedure Init_Check_Project is
  begin
    Load.Project (Path => "path", Project_Name => "project");
    Data := Load.Get_Data;
  end;

  procedure Init_Check_Module is
  begin
    Init_Check_Project;
    Load.Module ("module_1");
  end;

  procedure Init_Check_Class is
  begin
    Init_Check_Module;
    Load.Class ("class_1");
  end;

  procedure Init_Check_Field is
  begin
    Init_Check_Class;
    Load.Field ("cls_1_fld_1 : cls_1_fld_1_type := cls_1_fld_1_default");
    Load.Field ("cls_1_fld_2 : cls_1_fld_2_type");
    Load.Field ("cls_1_fld_3 : cls_1_fld_3_type := cls_1_fld_3_default; get");
    Load.Field ("cls_1_fld_4 : cls_1_fld_4_type; set");
    Load.Field ("cls_1_fld_5 : cls_1_fld_5_type; get, set");
    Load.Field ("cls_1_fld_6 : vector");
    Load.Field ("cls_1_fld_7 : class_2.vector");
  end;

  Class_1_Number_Of_Fields : constant Positive := 7;

  -----------------------------------------------------------------------------

  function Get_Module_1
    return not null access Model.Module.Object_T
    is (Model.Module.Class_T (Data.Project.Get_Subproject (1)));

  function Get_Class_1_Package
    return not null access Model.Package_Def.Object_T
    is (Model.Package_Def.Class_T (Get_Module_1.Get_Element (2)));

  function Get_Class_1
    return not null access Model.Class_Def.Object_T
    is (Model.Class_Def.Class_T (Get_Class_1_Package.Get_Public_Elements.First_Element));

  function Get_Class_1_Field
    (Index : in Positive)
    return not null access Model.Field.Object_T
    is (Get_Class_1.Get_Field (Index));

  -----------------------------------------------------------------------------

  procedure Check_Project_Has_Valid_Path
  is
  begin
    Assert
      (Data.Path.all = Expected.Path,
       "chemin du projet");
  exception
    when Assertion_Error => null;
  end Check_Project_Has_Valid_Path;

  -----------------------------------------------------------------------------

  procedure Check_Project_Has_Valid_Name
  is
  begin
    Assert
      (Data.Project.Get_Name = Expected.Project.Get_Name,
       "nom du projet");
  exception
    when Assertion_Error => null;
  end Check_Project_Has_Valid_Name;

  -----------------------------------------------------------------------------

  procedure Check_Module_Only_Its_Root_Package
  is
    Module : access Model.Module.Object_T'Class :=
      Model.Module.Class_T (Data.Project.Get_Subproject (1));
  begin
    Assert (Module.Number_Of_Elements = 1,
            "module should only have its root package");
  exception
    when Assertion_Error => null;
  end Check_Module_Only_Its_Root_Package;

  -----------------------------------------------------------------------------

  procedure Check_Module_Has_Valid_Module_Number
  is
  begin
    Assert
      (Integer (Data.Project.Get_Subprojects.Length) = 1,
       "nombre de modules");
  exception
    when Assertion_Error => null;
  end Check_Module_Has_Valid_Module_Number;

  -----------------------------------------------------------------------------

  procedure Check_Module_Has_Valid_Module_Name
  is
    Name : constant String :=
      Data.Project.Get_Subproject ("module_1").Get_Name;
  begin
    Assert
      (Name = "module_1",
       "get_subproject");
  exception
    when Assertion_Error => null;
  end Check_Module_Has_Valid_Module_Name;

  -----------------------------------------------------------------------------

  procedure Try_With_Bad_Module_Name;

  procedure Check_Module_Error_If_Unknown_Module_Name
  is
  begin
    Assert_Exception
      (Try_With_Bad_Module_Name'Access,
       "pas d'exception pour un nom de module non défini");
  exception
    when Assertion_Error => null;
  end Check_Module_Error_If_Unknown_Module_Name;

  procedure Try_With_Bad_Module_Name
  is
    Tmp  : access Model.Project.Object_T := null;
    Name : constant String               := "an inexistant name";
  begin
    Tmp := Data.Project.Get_Subproject (Name);
  end Try_With_Bad_Module_Name;


  -----------------------------------------------------------------------------

  procedure Check_Class_Is_Added
  is
    Module : access Model.Module.Object_T'Class :=
      Model.Module.Class_T (Data.Project.Get_Subproject (1));
  begin
    Assert (Module.Number_Of_Elements = 2,
            "subproject should have 2 elements : its root package and a class."
              & " It has " & Module.Number_Of_Elements'Img & " elements");
  exception
    when Assertion_Error => null;
  end Check_Class_Is_Added;

  -----------------------------------------------------------------------------

  procedure Check_Class_Package_Is_Created
  is
  begin
    Assert (Get_Class_1_Package.Get_Name = "class_1",
            "bad package name");
    Assert (Get_Class_1.Get_Name = "object_t",
            "bad class name");
  exception
    when Assertion_Error => null;
  end Check_Class_Package_Is_Created;

  -----------------------------------------------------------------------------

  procedure Check_Class_Has_Valid_Name
  is
    Module : access Model.Module.Object_T'Class :=
      Model.Module.Class_T (Data.Project.Get_Subproject (1));

    Obj_Package : access Model.Package_Def.Object_T'Class :=
      Model.Package_Def.Class_T (Module.Get_Element (2));

    Obj_Class : access Model.Class_Def.Object_T'Class :=
      Model.Class_Def.Class_T (Obj_Package.Get_Public_Elements.First_Element);
  begin
    Assert (Obj_Package.Get_Name = "class_1",
            "bad package name");
    Assert (Obj_Class.Get_Name = "object_t",
            "bad class name");
  exception
    when Assertion_Error => null;
  end Check_Class_Has_Valid_Name;

  -----------------------------------------------------------------------------

  procedure Check_Field_Number
  is
  begin
    Assert (Get_Class_1.Number_Of_Fields = Class_1_Number_Of_Fields,
            "bad number of fields");
  exception
    when Assertion_Error => null;
  end Check_Field_Number;

  -----------------------------------------------------------------------------

  procedure Try_When_No_Default;

  procedure Check_Field_Add_2_Basic_Fields
  is
  begin
    Assert (Get_Class_1_Field (1).Get_Name = "cls_1_fld_1",
            "bad field name 1");
    Assert (Get_Class_1_Field (1).Get_Type = "cls_1_fld_1_type",
            "bad field type 1");
    Assert (Get_Class_1_Field (1).Get_Default_Value = "cls_1_fld_1_default",
            "bad default value 1");

    Assert (Get_Class_1_Field (2).Get_Name = "cls_1_fld_2",
            "bad field name 2");
    Assert (Get_Class_1_Field (2).Get_Type = "cls_1_fld_2_type",
            "bad field type 2");
    Assert_Exception
      (Try_When_No_Default'Access,
       "asking empty default value should raise");

  exception
    when Assertion_Error => null;
  end Check_Field_Add_2_Basic_Fields;

  procedure Try_When_No_Default
  is
    Tmp : constant String := Get_Class_1_Field (2).Get_Default_Value;
  begin
    null;
  end;

  -----------------------------------------------------------------------------

  procedure Check_Field_With_Get
  is
  begin
    Assert (Get_Class_1_Field (3).Get_Name = "cls_1_fld_3",
            "bad field name 3");
    Assert (Get_Class_1_Field (3).Get_Type = "cls_1_fld_3_type",
            "bad field type 3");
    Assert (Get_Class_1_Field (3).Get_Default_Value = "cls_1_fld_3_default",
            "bad default value 3");
  exception
    when Assertion_Error => null;
  end Check_Field_With_Get;

  -----------------------------------------------------------------------------

  procedure Check_Field_With_Set
  is
    Pkg : access Model.Package_Def.Object_T renames
      Get_Class_1_Package;
  begin
    Assert (Get_Class_1_Field (4).Get_Name = "cls_1_fld_4",
            "bad field name 4");
    Assert (Get_Class_1_Field (4).Get_Type = "cls_1_fld_4_type",
            "bad field type 4");

    declare
      Set_Method_Found : Boolean := False;
    begin
      Ada.Text_IO.Put_Line ("in package " & Pkg.Get_Name);

      for I in 1 .. Pkg.Get_Number_Of_Public_Elements loop
        Ada.Text_IO.Put_Line ("  element " & Pkg.Get_Public_Element (I).Get_Name);

        if Pkg.Get_Public_Element (I).Get_Name = "set_cls_1_fld_4" then
          Set_Method_Found := True;
        end if;
      end loop;
      Assert (Set_Method_Found,
              "method set for field " & Get_Class_1_Field (4).Get_Name & " not found");
    end;
  exception
    when Assertion_Error => null;
  end Check_Field_With_Set;

  -----------------------------------------------------------------------------

  procedure Check_Field_With_Get_Set
  is
  begin
    Assert (Get_Class_1_Field (5).Get_Name = "cls_1_fld_5",
            "bad field name 5");
    Assert (Get_Class_1_Field (5).Get_Type = "cls_1_fld_5_type",
            "bad field type 5");
  exception
    when Assertion_Error => null;
  end Check_Field_With_Get_Set;

  -----------------------------------------------------------------------------

  procedure Try_With_Unknown_Option;

  procedure Check_Field_Unkown_Option
  is
  begin
    Assert_Exception (Try_With_Unknown_Option'Access,
                      "unknown_option should raise an error");
  exception
    when Assertion_Error => null;
  end Check_Field_Unkown_Option;

  procedure Try_With_Unknown_Option
  is
  begin
    Load.Field ("field : type; another_option");
  end;

  -----------------------------------------------------------------------------

  procedure Check_Vector_Field_Same_Class
  is
  begin
    Assert (Get_Class_1_Field (6).Get_Name = "cls_1_fld_6",
            "bad field name 6");
    Assert (Get_Class_1_Field (6).Get_Type = "vector",
            "bad field type 6");
    null;
  exception
    when Assertion_Error => null;
  end Check_Vector_Field_Same_Class;

  -----------------------------------------------------------------------------

  procedure Check_Vector_Field_Other_Class
  is
  begin
    Assert (Get_Class_1_Field (7).Get_Name = "cls_1_fld_7",
            "bad field name 7");
    Assert (Get_Class_1_Field (7).Get_Type = "class_2.vector",
            "bad field type 7");
    null;
  exception
    when Assertion_Error => null;
  end Check_Vector_Field_Other_Class;

  -----------------------------------------------------------------------------

end Tests_Impl;
