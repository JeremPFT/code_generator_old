with Templates;

with Model.Field;

package Model_Visitor.Visit_Field_Impl is

  --  with Test_Case
  --    => (Name     => "nominal",
  --        Mode     => Nominal,
  --        Requires => Arg < 10000,
  --        Ensures  => Sqrt'Result < 10);

  procedure Init
    (Field   : not null access Model.Field.Object_T'Class;
     Visitor : in out          Model_Visitor.Object_T);
  pragma Test_Case (Name => "nominal",
                    Mode => Nominal);

  procedure Set_Name;
  pragma Test_Case (Name => "nominal",
                    Mode => Nominal);
  pragma Test_Case (Name => "not_initialized",
                    Mode => Robustness);

  procedure Set_Type;
  pragma Test_Case (Name => "nominal",
                    Mode => Nominal);
  pragma Test_Case (Name => "not_initialized",
                    Mode => Robustness);

  procedure Set_Default_Value;
  pragma Test_Case (Name => "nominal_with_default",
                    Mode => Nominal);
  pragma Test_Case (Name => "without_default",
                    Mode => Robustness);
  pragma Test_Case (Name => "not_initialized",
                    Mode => Robustness);

  procedure Set_Image;
  pragma Test_Case (Name => "nominal",
                    Mode => Nominal);
  pragma Test_Case (Name => "not_initialized",
                    Mode => Robustness);

private

  package Tmpl renames Standard.Templates;

  Visitor      : Model_Visitor.Object_T;
  Field        : access Model.Field.Object_T'Class := null;
  Obj_Template : access Tmpl.Object_T'Class        := null;

end Model_Visitor.Visit_Field_Impl;
