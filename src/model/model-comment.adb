package body Model.Comment is

  procedure Initialize
    (Self : out Object_T'Class;
     Text : in String)
  is
  begin
    Parent_Pkg.Initialize (Self);

    Self.Comment_Body := new String'(Text);
  end Initialize;

  function Create
    (Text : in String)
    return Class_T
  is
    Result : constant access Object_T := new Object_T;
  begin
    Result.Comment_Body := new String'(Text);
    return Class_T (Result);
  end Create;

end Model.Comment;
