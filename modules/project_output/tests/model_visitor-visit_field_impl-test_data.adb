--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Model_Visitor.Visit_Field_Impl.Test_Data is

  procedure Set_Up (Gnattest_T : in out Test) is

    Obj_Package : constant not null access Model.Package_Def.Object_T'Class :=
      Model.Package_Def.Create (Name       => "a_package",
                                Visibility => Model.Named_Element.Undefined_Visibility);

    Obj_Class : constant not null access Model.Types.Class_Def.Object_T'Class :=
      Model.Types.Class_Def.Create (Name          => "a_class",
                                    Owner_Package => Obj_Package,
                                    Visibility    => Model.Named_Element.Undefined_Visibility);

  begin
    Gnattest_T.Field_With_Default := Model.Field.Create
      (Name          => "field_with_default",
       Owner_Class   => Obj_Class,
       Of_Type       => "a_type",
       Default_Value => "default",
       Visibility    => Model.Named_Element.Undefined_Visibility);

    Gnattest_T.Field_Without_Default := Model.Field.Create
      (Name        => "field_without_default",
       Owner_Class => Obj_Class,
       Of_Type     => "a_type",
       Visibility  => Model.Named_Element.Undefined_Visibility);
  end Set_Up;

  procedure Tear_Down (Gnattest_T : in out Test) is
    pragma Unreferenced (Gnattest_T);
  begin
    null;
  end Tear_Down;

end Model_Visitor.Visit_Field_Impl.Test_Data;
