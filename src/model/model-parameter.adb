package body Model.Parameter is

  procedure Initialize
    (Self          : in out Object_T'Class;
     Name          : in     String;
     Of_Type       : in     String;
     Default_Value : in     String       := "";
     Mode          : in     Param_Mode_T := P_Mode_In)
  is
  begin
    Parent_Pkg.Initialize (Self, Name);

    if Of_Type /= "" then
      Self.Of_Type := new String'(Of_Type);
    else
      raise Constraint_Error with "the parameter """ & Name & """ has no type";
    end if;

    if Default_Value /= "" then
      Self.Default_Value := new String'(Default_Value);
    end if;

    Self.Mode := Mode;
  end Initialize;

  function Create
    (Name          : in String;
     Of_Type       : in String;
     Default_Value : in String       := "";
     Mode          : in Param_Mode_T := P_Mode_In)
    return not null access Object_T'Class
  is
    Object : constant access Object_T := new Object_T;
  begin
    Object.Initialize (Name, Of_Type, Default_Value, Mode);
    return Object;
  end Create;

  overriding
  procedure Visit
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class)
  is
  begin
    Object.Visit_Parameter (Self);
  end Visit;

end Model.Parameter;
