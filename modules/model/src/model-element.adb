with Model.Comment;

package body Model.Element is

  -----------------------------------------------------------------------------

  procedure Initialize
    (Self : in out Object_T'Class)
  is
  begin
    null;
  end Initialize;

  -----------------------------------------------------------------------------

  procedure Add_Comment
    (Self : in out Object_T;
     Text : in String)
  is
    Object : constant access Comment.Object_T :=
      Comment.Create (Text => Text);
  begin
    Self.Owned_Comments.Append (New_Item => Object);
  end Add_Comment;

  -----------------------------------------------------------------------------

  function Number_Of_Comments
    (Self : in Object_T)
    return Natural
    is
    (Natural (Self.Owned_Comments.Length));

  -----------------------------------------------------------------------------

  function Get_Comment
    (Self  : in Object_T;
     Index : in Positive)
    return String
  is

    Tmp_Element : constant access Object_T'Class :=
      Self.Owned_Comments (Index);

    Tmp_Comment : constant access Comment.Object_T'Class :=
      Comment.Class_T (Tmp_Element);

  begin
    return Tmp_Comment.Get_Body;
  end Get_Comment;

  -----------------------------------------------------------------------------

  not overriding
  function Is_Equivalent
    (Self, To : in Object_T)
    return Boolean
  is

    ----------------------------------------

    function Same_Size return Boolean;
    function Same_Comments return Boolean with Pre => Same_Size;

    ----------------------------------------

    function Same_Size return Boolean
    is
      use type Ada.Containers.Count_Type;
    begin
      return Self.Owned_Comments.Length = To.Owned_Comments.Length;
    end Same_Size;

    ----------------------------------------

    function Same_Comments return Boolean
    is
    begin
      for I in 1 .. Integer (Self.Owned_Comments.Length) loop
        if Comment.Class_T (Self.Owned_Comments.Element (I)).Get_Body
          /=
          Comment.Class_T (To.Owned_Comments.Element (I)).Get_Body
        then
          return False;
        end if;

        declare
          Self_Comment : constant access Comment.Object_T :=
            Comment.Class_T (Self.Owned_Comments.Element (I));
          To_Comment   : constant access Comment.Object_T :=
            Comment.Class_T (To.Owned_Comments.Element (I));
        begin
          if Self_Comment.Get_Body /= To_Comment.Get_Body then
            return False;
          end if;
        end;
      end loop;

      return True;
    end Same_Comments;

    ----------------------------------------

  begin
    if not Same_Size then
      return False;
    else
      return Same_Comments;
    end if;
  end Is_Equivalent;

  -----------------------------------------------------------------------------

  procedure Visit
    (Self   : in out Object_T;
     Object : in out Visitor.Object_T'Class)
  is
    pragma Unreferenced (Self, Object);
  begin
    null;
  end Visit;

  -----------------------------------------------------------------------------

end Model.Element;
