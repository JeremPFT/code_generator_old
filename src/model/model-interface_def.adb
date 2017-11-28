with Model.Package_Def;

package body Model.Interface_Def is

  function Create
    (Owner_Package     : not null access Package_Def.Object_T'Class;
     Name              : in              String;
     Parent_Interfaces : in              Vector_T :=
       Vectors.Empty_Vector)
    return not null access Object_T'Class
  is
    Obj_Interface : constant access Object_T :=
      new Object_T'(Type_Def.Object_T
                    with
                    Owner_Package => Owner_Package,
                    others        => <>);
  begin
    Obj_Interface.Set_Name (Name);

    for Itf of Parent_Interfaces loop
      Obj_Interface.Add_Parent_Interface (Itf);
    end loop;

    return Obj_Interface;
  end Create;

  procedure Add_Parent_Interface
    (Self   : in out Object_T;
     Parent : access Object_T'Class)
  is
  begin
    Self.Parent_Interfaces.Append (Parent);
  end Add_Parent_Interface;

  procedure Add_Public_Subprogram
    (Self   : in out Object_T;
     Object : access Subprogram.Object_T)
  is
  begin
    Self.Public_Subprograms.Append (Object);
  end Add_Public_Subprogram;

  overriding
  procedure Visit
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class)
  is
  begin
    Object.Visit_Interface (Self);
  end Visit;

  --  begin

  --    declare
  --      package T_IO renames Ada.Text_IO;

  --      Obj_Package : constant access Package_Def.Object_T :=
  --        Package_Def.Create (Name => "package_a");

  --      Obj_Interface_A : constant access Object_T :=
  --        Create (Owner_Package => Obj_Package,
  --                Name          => "interface_a");
  --      Obj_Interface_B : constant access Object_T :=
  --        Create (Owner_Package => Obj_Package,
  --                Name          => "interface_b");
  --      Obj_Interface_C : constant access Object_T :=
  --        Create (Owner_Package => Obj_Package,
  --                Name          => "interface_c");
  --      Obj_Interface_D : constant access Object_T :=
  --        Create (Owner_Package => Obj_Package,
  --                Name          => "interface_d");
  --    begin
  --      T_IO.New_Line;
  --      T_IO.Put_Line ("--------------------------------------");
  --      T_IO.Put_Line ("debut des tests de model.interface_def");
  --      T_IO.New_Line;
  --      T_IO.Put_Line ("interface créée");
  --      T_IO.Put_Line (Obj_Interface_A.Owner_Package.Get_Name & "." &
  --                       Obj_Interface_A.Get_Name);

  --      Obj_Interface_D.Add_Parent_Interface (Obj_Interface_A);
  --      Obj_Interface_D.Add_Parent_Interface (Obj_Interface_B);
  --      Obj_Interface_D.Add_Parent_Interface (Obj_Interface_C);

  --      declare
  --        Number : constant Natural :=
  --          Obj_Interface_D.Number_Of_Parent_Interfaces;
  --      begin
  --        T_IO.Put_Line ("# parents : " & Number'Img);
  --      end;

  --      for I in 1 .. Obj_Interface_D.Number_Of_Parent_Interfaces loop
  --        declare
  --          Parent : constant access Object_T :=
  --            Obj_Interface_D.Get_Parent_Interface (I);
  --        begin
  --          T_IO.Put_Line ("parent " & I'Img & " : " &
  --                           Parent.Owner_Package.Get_Name
  --                           & "." &
  --                           Parent.Get_Name);
  --        end;
  --      end loop;

  --    end;

end Model.Interface_Def;
