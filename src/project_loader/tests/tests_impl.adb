with Ada.Text_IO;
with Ada.Tags;

with AUnit.Assertions;
use AUnit.Assertions;

with Model.Field;
with Model.Module;
with Model.Named_Element;
with Model.Package_Def;
with Model.Project;
with Model.Subprogram;
with Model.Types.Class_Def;
with Model.Visitor.Printer;
with Expected;

package body Tests_Impl is

  -----------------------------------------------------------------------------

  Data : Project_Loader.Data_T;
  package Load renames Project_Loader;

  --  function "="
  --    (Left, Right : not null access Subprogram.Object_T)
  --    return Boolean;

  -----------------------------------------------------------------------------

  package Init is
    procedure Check_Project;
    procedure Check_Module;
    procedure Check_Class;
    procedure Check_Field;
  end Init;

  package body Init is separate;

  procedure Init_Check_Project renames Init.Set_Up_Project;
  procedure Init_Check_Module renames Init.Set_Up_Module;
  procedure Init_Check_Class renames Init.Set_Up_Class;
  procedure Init_Check_Field renames Init.Set_Up_Field;

  Class_1_Number_Of_Fields : constant Positive := 7;

  -----------------------------------------------------------------------------

  function Get_Module_1
    return not null access Model.Module.Object_T
    is (Model.Module.Class_T (Data.Project.Get_Subproject (1)));

  function Get_Class_1_Package
    return not null access Model.Package_Def.Object_T
    is (Model.Package_Def.Class_T (Get_Module_1.Get_Element (2)));

  function Get_Class_1
    return not null access Model.Types.Class_Def.Object_T
    is (Model.Types.Class_Def.Class_T
          (Get_Class_1_Package.Get_Defined_Namespace.Get_Member (Index => 1)));
  --  (Get_Class_1_Package.Get_Public_Elements.First_Element));

  function Get_Class_1_Field
    (Index : in Positive)
    return not null access Model.Field.Object_T
    is (Model.Field.Class_T
          (Get_Class_1.Get_Defined_Namespace.Get_Member (Index => Index)));
  --  is (Get_Class_1.Get_Field (Index));

  -----------------------------------------------------------------------------

  package Check_Project is
    procedure Has_Valid_Path;
    procedure Has_Valid_Name;
  end Check_Project;
  package body Check_Project is separate;

  procedure Check_Project_Has_Valid_Path
    renames Check_Project.Has_Valid_Path;

  procedure Check_Project_Has_Valid_Name
    renames Check_Project.Has_Valid_Name;

  -----------------------------------------------------------------------------

  package Check_Module is
    procedure Only_Its_Root_Package;
    procedure Has_Valid_Module_Number;
    procedure Has_Valid_Module_Name;
    procedure Error_If_Unknown_Module_Name;
  end Check_Module;
  package body Check_Module is separate;

  procedure Check_Module_Only_Its_Root_Package
    renames Check_Module.Only_Its_Root_Package;
  procedure Check_Module_Has_Valid_Module_Number
    renames Check_Module.Has_Valid_Module_Number;
  procedure Check_Module_Has_Valid_Module_Name
    renames Check_Module.Has_Valid_Module_Name;
  procedure Check_Module_Error_If_Unknown_Module_Name
    renames Check_Module.Error_If_Unknown_Module_Name;

  -----------------------------------------------------------------------------

  package Check_Class is
    procedure Is_Added;
    procedure Package_Is_Created;
    procedure Has_Valid_Name;
  end Check_Class;

  package body Check_Class is separate;

  procedure Check_Class_Is_Added
    renames Check_Class.Is_Added;
  procedure Check_Class_Package_Is_Created
    renames Check_Class.Package_Is_Created;
  procedure Check_Class_Has_Valid_Name
    renames Check_Class.Has_Valid_Name;

  -----------------------------------------------------------------------------

  package Check_Field is
    procedure Number;
    procedure Add_2_Basic_Fields;
    procedure With_Get;
    procedure With_Set;
    procedure With_Get_Set;
    procedure Unkown_Option;
    procedure Vector_Same_Class;
    procedure Vector_Other_Class;
  end Check_Field;

  package body Check_Field is separate;

  procedure Check_Field_Number
    renames Check_Field.Number;
  procedure Check_Field_Add_2_Basic_Fields
    renames Check_Field.Add_2_Basic_Fields;
  procedure Check_Field_With_Get
    renames Check_Field.With_Get;
  procedure Check_Field_With_Set
    renames Check_Field.With_Set;
  procedure Check_Field_With_Get_Set
    renames Check_Field.With_Get_Set;
  procedure Check_Field_Unkown_Option
    renames Check_Field.Unkown_Option;
  procedure Check_Field_Vector_Same_Class
    renames Check_Field.Vector_Same_Class;
  procedure Check_Field_Vector_Other_Class
    renames Check_Field.Vector_Other_Class;

end Tests_Impl;
