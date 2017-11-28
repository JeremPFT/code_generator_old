package body Model.Subprogram is

  function Create
    (Owner_Package  : access Package_Def.Object_T'Class := null;
     Parent_Package : access Package_Def.Object_T'Class := null;
     Name           : in     String;
     Of_Type        : in     String                     := "";
     Is_Abstract    : in     Boolean                    := False;
     Is_Separate    : in     Boolean                    := False)
    return not null access Object_T'Class
  is
    Of_Type_Val : constant access String :=
      (if Of_Type /= "" then
         new String'(Of_Type)
       else null);

    Obj_Subprogram : constant access Object_T :=
      new Object_T'(Named_Element.Object_T with
                    Owner_Package  => Owner_Package,
                    Parent_Package => Parent_Package,
                    Of_Type        => Of_Type_Val,
                    Is_Abstract    => Is_Abstract,
                    Is_Separate    => Is_Separate,
                    others         => <>);
  begin
    Obj_Subprogram.Set_Name (Name);
    return Obj_Subprogram;
  end Create;

  procedure Set_Type
    (Self  : in out Object_T;
     Value : in     String)
  is
  begin
    Self.Of_Type := new String'(Value);
  end Set_Type;

  overriding
  procedure Visit
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class)
  is
  begin
    Object.Visit_Subprogram (Self);
  end Visit;

  --  begin

  --    declare
  --      package T_IO renames Ada.Text_IO;

  --      Obj_Subprogram : constant access Object_T :=
  --        Create (Owner_Package => null,
  --                Name          => "subprogram_a");
  --    begin
  --      T_IO.New_Line;
  --      T_IO.Put_Line ("-----------------------------------");
  --      T_IO.Put_Line ("debut des tests de model.subprogram");
  --      T_IO.New_Line;
  --      T_IO.Put_Line ("subprogram créé : " & Obj_Subprogram.Get_Name);

  --    end;

end Model.Subprogram;
