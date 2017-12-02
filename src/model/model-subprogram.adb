package body Model.Subprogram is

  procedure Initialize
    (Self        : in out Object_T'Class;
     Name        : in     String;
     Of_Type     : in     String  := "";
     Is_Abstract : in     Boolean := False;
     Is_Separate : in     Boolean := False)
  is
  begin
    Named_Element.Initialize (Self, Name);

    if Name /= "" then
      Self.Of_Type := new String'(Of_Type);
    end if;

    Self.Is_Abstract := Is_Abstract;
    Self.Is_Separate := Is_Separate;
  end Initialize;

  function Create
    (Owner_Package  : access Package_Def.Object_T'Class := null;
     Parent_Package : access Package_Def.Object_T'Class := null;
     Name           : in     String;
     Of_Type        : in     String                     := "";
     Is_Abstract    : in     Boolean                    := False;
     Is_Separate    : in     Boolean                    := False)
    return not null access Object_T'Class
  is
    Object : constant access Object_T :=
      new Object_T (Owner_Package  => Owner_Package,
                    Parent_Package => Parent_Package);
  begin
    Object.Initialize (Name, Of_Type, Is_Abstract, Is_Separate);
    return Object;
  end Create;

  not overriding
  procedure Add_Parameter
    (Self          : in out          Object_T;
     Obj_Parameter : not null access Parameter.Object_T'Class)
  is
  begin
    Self.Parameters.Append (Obj_Parameter);
  end Add_Parameter;

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
