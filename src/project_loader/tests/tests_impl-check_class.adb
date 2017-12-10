
--  with ada files

--  with others libraries

--  with project files

separate (Tests_Impl)

package body Check_Class is

  ----------------------------------------------------------------------------

  procedure Is_Added
  is
    Module : access Model.Module.Object_T'Class :=
      Model.Module.Class_T (Data.Project.Get_Subproject (1));
  begin
    Assert (Module.Number_Of_Elements = 2,
            "subproject should have 2 elements : its root package and a class."
              & " It has " & Module.Number_Of_Elements'Img & " elements");
  exception
    when Assertion_Error => null;
  end Is_Added;

  ----------------------------------------------------------------------------

  procedure Package_Is_Created
  is
  begin
    Assert (Get_Class_1_Package.Get_Name = "class_1",
            "bad package name");
    Assert (Get_Class_1.Get_Name = "object_t",
            "bad class name");
  exception
    when Assertion_Error => null;
  end Package_Is_Created;

  ----------------------------------------------------------------------------

  procedure Has_Valid_Name
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
  end Has_Valid_Name;

  ----------------------------------------------------------------------------

end Check_Class;
