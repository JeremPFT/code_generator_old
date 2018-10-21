package body Model.Comment is

  -----------------------------------------------------------------------------

  procedure Initialize
    (Self : in out Object_T'Class;
     Text : in     String)
  is
  begin
    Parent_Pkg.Initialize (Self);

    Self.Comment_Body := new String'(Text);
  end Initialize;

  -----------------------------------------------------------------------------

  function Create
    (Text : in String)
    return Class_T
  is
    Result : constant access Object_T := new Object_T;
  begin
    Result.Comment_Body := new String'(Text);
    return Class_T (Result);
  end Create;

  -----------------------------------------------------------------------------

  overriding
  function Is_Equivalent
    (Self, To : in Object_T)
    return Boolean
  is

    function Parents_Equivalents return Boolean is
      (Element.Object_T (Self).Is_Equivalent (Element.Object_T (To)));

    function Both_Null return Boolean
      is (Self.Comment_Body = null and then To.Comment_Body = null);

    function One_Null return Boolean
      is (Self.Comment_Body = null or else To.Comment_Body = null);

    function Same_String return Boolean
      is (Self.Comment_Body.all = To.Comment_Body.all);

    Result : Boolean;

  begin
    Result := Parents_Equivalents and then
      (Both_Null or else (not One_Null and then Same_String));

    return Result;

  end Is_Equivalent;

  -----------------------------------------------------------------------------

end Model.Comment;
