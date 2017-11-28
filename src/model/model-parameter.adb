package body Model.Parameter is

  --  type Object_T is abstract new Named_Element.Object_T with private;

  --  type Reference_T is access all Object_T;

  --  type Class_T is access all Object_T'Class;

  --  package Vectors is new Ada.Containers.Vectors
  --    (Element_Type => Class_T,
  --     Index_Type   => Positive);

  --  subtype Vector_T is Vectors.Vector;

  --  type Param_Mode_T is
  --    (P_Mode_In,
  --     P_Mode_Out,
  --     P_Mode_In_Out,
  --     P_Mode_Access,
  --     P_Mode_Access_Constant,
  --     P_Mode_Not_Null_Access,
  --     P_Mode_Not_Null_Access_Constant);

  --  type Object_T is
  --    new Named_Element_T with record
  --      Of_Type       : access String := null;
  --      Default_Value : access String := null;
  --      Mode          : Param_Mode_T  := P_Mode_In;
  --    end record;

  --  type Mode_Str_T is
  --    array (Param_Mode_T) of String_Ref;

  --  not overriding
  --  function "+"(Text : in String) return String_Ref
  --    is
  --    (new String'(Text));

  --  Mode_Str : constant Mode_Str_T :=
  --    (
  --     P_Mode_In                       => +"in",
  --     P_Mode_Out                      => +"out",
  --     P_Mode_In_Out                   => +"in out",
  --     P_Mode_Access                   => +"access",
  --     P_Mode_Access_Constant          => +"access constant",
  --     P_Mode_Not_Null_Access          => +"not null access",
  --     P_Mode_Not_Null_Access_Constant => +"not null access constant"
  --    );

  function Create
    (Name          : in String;
     Of_Type       : in String;
     Default_Value : in String       := "";
     Mode          : in Param_Mode_T := P_Mode_In)
    return not null access Object_T'Class
  is
    Of_Type_Val : constant access String :=
      (if Of_Type /= "" then
         new String'(Of_Type)
       else null);

    Default_Value_Val : constant access String :=
      (if Default_Value /= "" then
         new String'(Default_Value)
       else null);

    Obj_Parameter : constant access Object_T :=
      new Object_T'(Named_Element.Object_T with
                    Of_Type       => Of_Type_Val,
                    Default_Value => Default_Value_Val,
                    Mode          => Mode);
  begin
    Obj_Parameter.Set_Name (Name);
    return Obj_Parameter;
  end Create;

  overriding
  procedure Visit
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class)
  is
  begin
    Object.Visit_Parameter (Self);
  end Visit;

  --  procedure Set_Type
  --    (Self  : in out Object_T;
  --     Value : in     String)
  --  is
  --  begin
  --    Self.Of_Type := new String'(Value);
  --  end Set_Type;

  --  procedure Set_Default_Value
  --    (Self  : in out Object_T;
  --     Value : in     String)
  --  is
  --  begin
  --    Self.Default_Value := new String'(Value);
  --  end Set_Default_Value;

  --  begin

  --    declare
  --      package T_IO renames Ada.Text_IO;
  --      Obj_Comment : constant access Object_T := Create
  --        (Name          => "parameter_a",
  --         Of_Type       => "type_a",
  --         Default_Value => "aaa");
  --    begin
  --      T_IO.New_Line;
  --      T_IO.Put_Line ("--------------------------------");
  --      T_IO.Put_Line ("debut des tests de model.parameter");
  --      T_IO.New_Line;
  --      T_IO.Put_Line ("parametre créé : ");
  --      T_IO.Put_Line (Obj_Comment.Get_Name);
  --    end;

end Model.Parameter;
