with Model_Visitor.Visit_Field_Impl;
use Model_Visitor.Visit_Field_Impl;

separate (Model_Visitor)

overriding
procedure Visit_Field
  (Self   : in out Object_T;
   Object : in out Model.Field.Object_T'Class)
is
begin
  T_IO.Put_Line ("visit_field """ & Object.Get_Name & """");

  Init (Field   => Object'Unchecked_Access,
        Visitor => Self);

  Set_Name;
  Set_Type;
  Set_Default_Value;

end Visit_Field;
