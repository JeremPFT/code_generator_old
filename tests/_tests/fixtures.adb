with AUnit.Assertions;

--  with Model.Core;

--  with String_Utils; use String_Utils;

package body Fixtures is

  -----------------------------------------------------------------------------

  procedure Check
    (Test   : in String;
     Check  : in Boolean;
     Source : in String  := GNAT.Source_Info.File;
     Line   : in Natural := GNAT.Source_Info.Line)
  is
    Message : constant String := ASCII.LF &
      "error on " & Test;
    Tmp     : Boolean;
  begin
    Tmp := AUnit.Assertions.Assert
      (Check, Message, Source => Source, Line => Line);
  end Check;

  procedure Check
    (Test             : in String;
     Actual, Expected : in String;
     Source           : in String  := GNAT.Source_Info.File;
     Line             : in Natural := GNAT.Source_Info.Line)
  is
    Message : constant String := ASCII.LF &
      "error on " & Test & ", expects : " & ASCII.LF &
      "----" & ASCII.LF &
      Expected & ASCII.LF &
      "----" & ASCII.LF &
      "got" & ASCII.LF &
      "----" & ASCII.LF &
      Actual & ASCII.LF &
      "----" & ASCII.LF;

    Tmp : Boolean;
  begin
    Tmp :=  AUnit.Assertions.Assert
      (Actual = Expected, Message, Source => Source, Line => Line);
  end Check;

  -----------------------------------------------------------------------------

  procedure Check
    (Test             : in String;
     Actual, Expected : in Boolean;
     Source           : in String  := GNAT.Source_Info.File;
     Line             : in Natural := GNAT.Source_Info.Line)
  is
    Message : constant String := ASCII.LF &
      "error on " & Test & ", expects : " & ASCII.LF &
      "----" & ASCII.LF &
      Expected'Img & ASCII.LF &
      "----" & ASCII.LF &
      "got" & ASCII.LF &
      "----" & ASCII.LF &
      Actual'Img & ASCII.LF &
      "----" & ASCII.LF;

    Tmp : Boolean;
  begin
    Tmp :=  AUnit.Assertions.Assert
      (Actual = Expected, Message, Source => Source, Line => Line);
  end Check;

  -----------------------------------------------------------------------------

  procedure Check
    (Test             : in String;
     Actual, Expected : in Integer;
     Source           : in String  := GNAT.Source_Info.File;
     Line             : in Natural := GNAT.Source_Info.Line)
  is
    Message : constant String := ASCII.LF &
      "error on " & Test & ", expects : " & ASCII.LF &
      "----" & ASCII.LF &
      Expected'Img & ASCII.LF &
      "----" & ASCII.LF &
      "got" & ASCII.LF &
      "----" & ASCII.LF &
      Actual'Img & ASCII.LF &
      "----" & ASCII.LF;

    Tmp : Boolean;
  begin
    Tmp :=  AUnit.Assertions.Assert
      (Actual = Expected, Message, Source => Source, Line => Line);
  end Check;

  --  -----------------------------------------------------------------------------
  --  --
  --  --  Array
  --  --
  --  -----------------------------------------------------------------------------

  --  function Array_1
  --    return not null access Model.Core.Array_T
  --    is (Model.Core.Create (Owner_Package  => Package_1,
  --                           Name           => Array_1_Name,
  --                           Contained_Type => Array_1_Contained_Type,
  --                           Index_Type     => Array_1_Index_Type,
  --                           Defined_Range  => Array_1_Range));

  --  -----------------------------------------------------------------------------
  --  --
  --  --  Field
  --  --
  --  -----------------------------------------------------------------------------

  --  function Field_1
  --    (Class_1 : not null access Model.Core.Class_T'Class)
  --    return not null access Model.Core.Field_T
  --  is
  --    Result : access Model.Core.Field_T := null;
  --  begin
  --    Result := Model.Core.Create (Owner_Class   => Class_1,
  --                                 Name          => Field_1_Name,
  --                                 Of_Type       => Field_1_Type,
  --                                 Default_Value => Field_1_Default);

  --    return Result;
  --  end Field_1;
  --  -----------------------------------------------------------------------------

  --  function Field_2
  --    (Class_1 : not null access Model.Core.Class_T'Class)
  --    return not null access Model.Core.Field_T
  --    is (Model.Core.Create (Owner_Class   => Class_1,
  --                           Name          => Field_2_Name,
  --                           Of_Type       => Field_2_Type,
  --                           Default_Value => Field_2_Default));

  --  -----------------------------------------------------------------------------

  --  function Field_3
  --    (Class_1 : not null access Model.Core.Class_T'Class)
  --    return not null access Model.Core.Field_T
  --    is (Model.Core.Create (Owner_Class   => Class_1,
  --                           Name          => Field_3_Name,
  --                           Of_Type       => Field_3_Type,
  --                           Default_Value => Field_3_Default));

  --  -----------------------------------------------------------------------------
  --  --
  --  --  Class
  --  --
  --  -----------------------------------------------------------------------------

  --  function Class_1
  --    (Package_1 : not null access Model.Core.Package_T'Class)
  --    return not null access Model.Core.Class_T
  --  is
  --    Result : not null access Model.Core.Class_T :=
  --      Model.Core.Create (Owner_Package => Package_1,
  --                         Name          => Class_1_Name);
  --  begin
  --    return Result;
  --  end Class_1;

  --  -----------------------------------------------------------------------------
  --  --
  --  --  Parameter
  --  --
  --  -----------------------------------------------------------------------------

  --  function Parameter_1
  --    return not null access Model.Core.Parameter_T
  --    is (Model.Core.Create (Name          => Parameter_1_Name,
  --                           Of_Type       => Parameter_1_Type,
  --                           Default_Value => Parameter_1_Default,
  --                           Mode          => Parameter_1_Mode));

  --  -----------------------------------------------------------------------------

  --  function Parameter_2
  --    return not null access Model.Core.Parameter_T
  --    is (Model.Core.Create (Name          => Parameter_2_Name,
  --                           Of_Type       => Parameter_2_Type,
  --                           Default_Value => Parameter_2_Default,
  --                           Mode          => Parameter_2_Mode));

  --  -----------------------------------------------------------------------------

  --  function Parameter_3
  --    return not null access Model.Core.Parameter_T
  --    is (Model.Core.Create (Name          => Parameter_3_Name,
  --                           Of_Type       => Parameter_3_Type,
  --                           Default_Value => Parameter_3_Default,
  --                           Mode          => Parameter_3_Mode));

  --  -----------------------------------------------------------------------------
  --  --
  --  --  Subprogram
  --  --
  --  -----------------------------------------------------------------------------

  --  function "+"
  --    (Text : in String)
  --    return Model.Core.String_Ref
  --    is (Model.Core."+" (Text));

  --  function Subprogram_1
  --    (Package_1 : access Model.Core.Package_T'Class := null)
  --    return not null access Model.Core.Subprogram_T
  --  is
  --    Result : not null access Model.Core.Subprogram_T :=
  --      Model.Core.Create (Name          => Subprogram_1_Name,
  --                         Owner_Package => Package_1);
  --  begin
  --    Result.Declarations.Append (+Declaration_1);
  --    Result.Declarations.Append (+Declaration_2);

  --    Result.Instructions.Append (+Instruction_1);
  --    Result.Instructions.Append (+Instruction_2);

  --    return Result;
  --  end Subprogram_1;

  --  -----------------------------------------------------------------------------

  --  function Subprogram_2
  --    (Package_1 : access Model.Core.Package_T'Class := null)
  --    return not null access Model.Core.Subprogram_T
  --  is
  --    Result : not null access Model.Core.Subprogram_T :=
  --      Model.Core.Create (Name          => Subprogram_2_Name,
  --                         Owner_Package => Package_1);
  --  begin
  --    --  Result.Parameters.Append (Parameter_1);
  --    --  Result.Parameters.Append (Parameter_2);
  --    --  Result.Parameters.Append (Parameter_3);

  --    Result.Declarations.Append (+Declaration_1);
  --    Result.Declarations.Append (+Declaration_2);

  --    Result.Instructions.Append (+Instruction_1);
  --    Result.Instructions.Append (+Instruction_2);

  --    return Result;
  --  end Subprogram_2;

  --  -----------------------------------------------------------------------------

  --  function Subprogram_3
  --    (Package_1 : access Model.Core.Package_T'Class := null)
  --    return not null access Model.Core.Subprogram_T
  --  is
  --    Result : not null access Model.Core.Subprogram_T :=
  --      Model.Core.Create (Name          => Subprogram_3_Name,
  --                         Of_Type       => Subprogram_3_Type,
  --                         Owner_Package => Package_1);
  --  begin
  --    Result.Declarations.Append (+Declaration_1);
  --    Result.Declarations.Append (+Declaration_2);

  --    Result.Instructions.Append (+Instruction_1);
  --    Result.Instructions.Append (+Instruction_2);

  --    return Result;
  --  end Subprogram_3;

  --  -----------------------------------------------------------------------------

  --  function Subprogram_4
  --    (Package_1 : access Model.Core.Package_T'Class := null)
  --    return not null access Model.Core.Subprogram_T
  --  is
  --    Result : not null access Model.Core.Subprogram_T :=
  --      Model.Core.Create (Name          => Subprogram_4_Name,
  --                         Of_Type       => Subprogram_4_Type,
  --                         Owner_Package => Package_1);
  --  begin
  --    --  Result.Parameters.Append (Parameter_1);
  --    --  Result.Parameters.Append (Parameter_2);
  --    --  Result.Parameters.Append (Parameter_3);

  --    Result.Declarations.Append (+Declaration_1);
  --    Result.Declarations.Append (+Declaration_2);

  --    Result.Instructions.Append (+Instruction_1);
  --    Result.Instructions.Append (+Instruction_2);

  --    return Result;
  --  end Subprogram_4;

  --  -----------------------------------------------------------------------------
  --  --
  --  --  Package
  --  --
  --  -----------------------------------------------------------------------------

  --  function Package_1
  --    return not null access Model.Core.Package_T
  --  is
  --    Result : not null access Model.Core.Package_T :=
  --      Model.Core.Create (Name => Package_1_Name);
  --  begin
  --    --  Result.Public_Elements.Append (Class_1);

  --    return Result;
  --  end Package_1;

  --  -----------------------------------------------------------------------------

end Fixtures;
