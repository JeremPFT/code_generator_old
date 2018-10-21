separate (Model_Visitor)

overriding
procedure Visit_Package
  (Self   : in out Object_T;
   Object : in out Model.Package_Def.Object_T'Class)
is
  function "+" (Item : String) return not null access String
    renames Tmpl."+";

  subtype Tag_Names_Array_T is Tmpl.Tag_Names_Array_T (1 .. 1);

  Package_Name_Tag : constant String := "PACKAGE_NAME";

  Tags : constant Tag_Names_Array_T :=
    (1 => +Package_Name_Tag);

  Spec_Name  : constant String               := Object.Get_Name & ".ads";
  Spec_Image : constant access Tmpl.Object_T :=
    Tmpl.Create (Template_File => "package.tads", Tag_Names => Tags);

  Body_Name  : constant String               := Object.Get_Name & ".adb";
  Body_Image : constant access Tmpl.Object_T :=
    Tmpl.Create (Template_File => "package.tadb", Tag_Names => Tags);

begin
  for I in 1 .. Object.Get_Defined_Namespace.Number_Of_Members loop
    Object.Get_Defined_Namespace.Get_Member (I).Visit (Self);
  end loop;

  Spec_Image.Add_Value (Tag_Name => Package_Name_Tag,
                        Value    => Object.Get_Name);

  Body_Image.Add_Value (Tag_Name => Package_Name_Tag,
                        Value    => Object.Get_Name);

  F_IO.Touch (Path    => Spec_Name,
              Content => Spec_Image.To_String);

  F_IO.Touch (Path    => Body_Name,
              Content => Body_Image.To_String);

end Visit_Package;
