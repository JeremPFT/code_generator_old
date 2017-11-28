with Ada.Text_IO;

package body Model.Core is

  pragma Check_Policy (Debug, On);

  -----------------------------------------------------------------------------

  procedure Add_Comment
    (Self    : in out Element_T;
     Comment : in String)
  is
    New_Comment : constant Comment_Ref :=
      Create (Text => Comment);
  begin
    Self.Owned_Comments.Append (New_Comment);
  end Add_Comment;

  -----------------------------------------------------------------------------

  function Number_Of_Comments
    (Self : in Element_T)
    return Natural
    is
    (Integer (Self.Owned_Comments.Length));

  -----------------------------------------------------------------------------

  function Get_Comment
    (Self  : in Element_T;
     Index : in Positive)
    return String
    is
    (Self.Owned_Comments (Index).Comment_Body.all);

  -----------------------------------------------------------------------------

  function Create
    (Text : in String)
    return not null access Comment_T'Class
    is
    (new Comment_T'(Comment_Body   => new String'(Text),
                    Owned_Comments => <>));

  -----------------------------------------------------------------------------

  procedure Set_Comment_Body
    (Self  : in out Comment_T;
     Value : in     String)
  is
  begin
    if Self.Comment_Body /= null then
      null;
      --  TODO delete current comment
    end if;

    Self.Comment_Body := new String'(Value);
  end Set_Comment_Body;

  -----------------------------------------------------------------------------

  procedure Set_Name
    (Self  : in out Named_Element_T;
     Value : in     String)
  is
  begin
    Self.Name := new String'(Value);
  end Set_Name;

  -----------------------------------------------------------------------------

  function Create
    (Name           : in     String;
     Parent         : access Package_T'Class := null;
     Owned_Comments : in     Comment_Vector  := Comment_Vectors.Empty_Vector)
    return not null access Package_T'Class
    is (new Package_T'(Name           => new String'(Name),
                       Parent         => Parent,
                       Qualified_Name =>
                         new String'((if Parent /= null then
                                        Parent.Get_Qualified_Name & "::" & Name
                                      else Name)),
                       Children         => <>,
                       Public_Elements  => <>,
                       Private_Elements => <>,
                       Body_Local_Decl  => <>,
                       Body_Public_Def  => <>,
                       Body_Private_Def => <>,
                       Body_Local_Def   => <>,
                       Owned_Comments   => Owned_Comments));

  -----------------------------------------------------------------------------

  procedure Set_Qualified_Name
    (Self  : in out Package_T;
     Value : in     String)
  is
  begin
    Self.Qualified_Name := new String'(Value);
  end Set_Qualified_Name;

  -----------------------------------------------------------------------------

  procedure Add_Class
    (Self   : in out          Package_T;
     Object : not null access constant Class_T'Class)
  is
  begin
    Self.Public_Elements.Append (Object);

    --  for Subprogram of Object.Subprograms loop
    --    Self.Public_Elements.Append (Named_Element_Cref (Subprogram));
    --  end loop;
  end Add_Class;

  -----------------------------------------------------------------------------

  procedure Add_Public_Subprogram
    (Self   : in out          Package_T;
     Object : not null access Subprogram_T'Class)
  is
  begin
    Self.Public_Elements.Append (Object);
  end Add_Public_Subprogram;

  -----------------------------------------------------------------------------

  function Get_Class
    (Self       : in Package_T;
     Class_Name : in String)
    return Get_Class_Result
  is
    Obj_Class : access Class_T'Class := null;
  begin
    On_Public_Elements :
    for Element of Self.Public_Elements loop
      if Element.all in Class_T'Class then
        declare
          Cur_Class : constant access Class_T'Class := Class_Cref (Element);
        begin
          if Cur_Class.Get_Name = Class_Name then
            Obj_Class := Cur_Class;
            exit On_Public_Elements;
          end if;
        end;
      end if;
    end loop On_Public_Elements;

    if Obj_Class = null then
      return (Has_Result => False);
    else
      return (Has_Result => True, Obj_Class => Obj_Class);
    end if;
  end Get_Class;

  -----------------------------------------------------------------------------

  function Create
    (Name           : in String;
     Of_Type        : in String;
     Default_Value  : in String         := "";
     Mode           : in Param_Mode_T   := P_Mode_In;
     Owned_Comments : in Comment_Vector := Comment_Vectors.Empty_Vector)
    return not null access Parameter_T'Class
    is (new Parameter_T'(Name           => new String'(Name),
                         Of_Type        => new String'(Of_Type),
                         Default_Value  => new String'(Default_Value),
                         Mode           => Mode,
                         Owned_Comments => Owned_Comments));

  -----------------------------------------------------------------------------

  procedure Set_Type
    (Self  : in out Parameter_T;
     Value : in     String)
  is
  begin
    Self.Of_Type := new String'(Value);
  end Set_Type;

  -----------------------------------------------------------------------------

  procedure Set_Default_Value
    (Self  : in out Parameter_T;
     Value : in     String)
  is
  begin
    Self.Default_Value := new String'(Value);
  end Set_Default_Value;

  -----------------------------------------------------------------------------

  function Create
    (Owner_Package  : access Package_T'Class;
     Name           : in     String;
     Of_Type        : in     String         := "";
     Is_Abstract    : in     Boolean        := False;
     Is_Separate    : in     Boolean        := False;
     Owned_Comments : in     Comment_Vector := Comment_Vectors.Empty_Vector)
    return not null access Subprogram_T'Class
    is (new Subprogram_T'(Owner_Package  => Owner_Package,
                          Name           => new String'(Name),
                          Of_Type        => new String'(Of_Type),
                          Is_Abstract    => Is_Abstract,
                          Is_Separate    => Is_Separate,
                          Owned_Comments => Owned_Comments,
                          Parameters     => <>,
                          Declarations   => <>,
                          Instructions   => <>));

  -----------------------------------------------------------------------------

  procedure Set_Type
    (Self  : in out Subprogram_T;
     Value : in     String)
  is
  begin
    Self.Of_Type := new String'(Value);
  end Set_Type;

  -----------------------------------------------------------------------------

  function Create
    (Owner_Package  : not null access Package_T'Class;
     Name           : in              String;
     Contained_Type : in              String;
     Index_Type     : in              String;
     Defined_Range  : in              String;
     Owned_Comments :                 Comment_Vector :=
       Comment_Vectors.Empty_Vector)
    return not null access Array_T'Class
  is
  begin
    return new Model.Core.Array_T'
      (Owner_Package  => Owner_Package,
       Name           => new String'(Name),
       Owned_Comments => Owned_Comments,
       Contained_Type => new String'(Contained_Type),
       Index_Type     => new String'(Index_Type),
       Defined_Range  => new String'(Defined_Range));
  end Create;

  -----------------------------------------------------------------------------

  procedure Set_Contained_Type
    (Self  : in out Array_T;
     Value : in     String)
  is
  begin
    Self.Contained_Type := new String'(Value);
  end Set_Contained_Type;

  -----------------------------------------------------------------------------

  procedure Set_Index_Type
    (Self  : in out Array_T;
     Value : in     String)
  is
  begin
    Self.Index_Type := new String'(Value);
  end Set_Index_Type;

  -----------------------------------------------------------------------------

  procedure Set_Range
    (Self  : in out Array_T;
     Value : in     String)
  is
  begin
    Self.Defined_Range := new String'(Value);
  end Set_Range;

  -----------------------------------------------------------------------------

  function Create
    (Owner_Class    : not null access Class_T'Class;
     Name           : in              String;
     Of_Type        : in              String;
     Default_Value  : in              String         := "";
     Owned_Comments : in              Comment_Vector :=
       Comment_Vectors.Empty_Vector)
    return not null access Field_T'Class
  is
    Result : access Field_T'Class;
  begin
    Result := new Field_T'(Owner_Class    => Owner_Class,
                           Name           => new String'(Name),
                           Of_Type        => new String'(Of_Type),
                           Default_Value  => new String'(Default_Value),
                           Owned_Comments => Owned_Comments);

    return Result;
  end Create;

  -----------------------------------------------------------------------------

  procedure Set_Type
    (Self  : in out Field_T;
     Value : in     String)
  is
  begin
    Self.Of_Type := new String'(Value);
  end Set_Type;

  -----------------------------------------------------------------------------

  procedure Set_Default_Value
    (Self  : in out Field_T;
     Value : in     String)
  is
  begin
    Self.Default_Value := new String'(Value);
  end Set_Default_Value;

  -----------------------------------------------------------------------------

  function Create
    (Owner_Package  : not null access Package_T'Class;
     Name           : in              String;
     Parents        : in              Interface_Vector :=
       Interface_Vectors.Empty_Vector;
     Owned_Comments : in              Comment_Vector   :=
       Comment_Vectors.Empty_Vector)
    return not null access Interface_T'Class
    is (new Interface_T'(Name           => new String'(Name),
                         Owner_Package  => Owner_Package,
                         Parents        => Parents,
                         Owned_Comments => Owned_Comments,
                         Subprograms    => <>));

  -----------------------------------------------------------------------------

  procedure Add_Subprogram
    (Self       : in out          Interface_T;
     Subprogram : not null access Subprogram_T'Class)
  is
  begin
    Self.Subprograms.Append (Subprogram);
  end Add_Subprogram;

  -----------------------------------------------------------------------------

  function Create
    (Owner_Package  : not null access Package_T'Class;
     Name           : in              String;
     Parents        : in              Interface_Vector :=
       Interface_Vectors.Empty_Vector;
     Parent         : access          Class_T'Class    := null;
     Is_Abstract    : in              Boolean          := False;
     Owned_Comments : in              Comment_Vector   :=
       Comment_Vectors.Empty_Vector)
    return not null access Class_T'Class
    is (new Class_T'(Owner_Package  => Owner_Package,
                     Name           => new String'(Name),
                     Parents        => Parents,
                     Parent         => Parent,
                     Owned_Comments => Owned_Comments,
                     Fields         => <>,
                     Subprograms    => <>,
                     Is_Abstract    => Is_Abstract));

  -----------------------------------------------------------------------------

  procedure Add_Field
    (Self  : in out          Class_T;
     Field : not null access Field_T'Class)
  is
  begin
    Self.Fields.Append (Field);
  end Add_Field;

  -----------------------------------------------------------------------------

  function Create
    (Owner_Package : not null access Package_T'Class;
     Name          : in              String;
     Access_Mode   : in              Acc_Mode_T)
    return not null access Access_T
    is (new Access_T'(Name           => +Name,
                      Owned_Comments => <>,
                      Owner_Package  => Owner_Package,
                      Access_Mode    => Access_Mode));

  -----------------------------------------------------------------------------

end Model.Core;
