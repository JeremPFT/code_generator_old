with Ada.Tags;
with Ada.Exceptions;
with Ada.Text_IO;
with Ada.Unchecked_Deallocation;

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

  procedure Visit
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class)
  is
    pragma Unreferenced (Self, Object);
  begin
    null;
  end Visit;

  -----------------------------------------------------------------------------

  procedure Clear_Memory
    (Self : in out Object_T)
  is

    package Pkg renames Model.Element;

    procedure Empty_Vector (Vector : in out Pkg.Vectors.Vector);

    procedure Empty_Vector (Vector : in out Pkg.Vectors.Vector)
    is
      Position : Pkg.Vectors.Cursor := Vector.First;
      Ref      : Pkg.Class_T        := null;
    begin
      while Pkg.Vectors.Has_Element (Position) loop
        Ref := Pkg.Vectors.Element (Position);
        Pkg.Vectors.Next (Position);
        Pkg.Free (Ref);
      end loop;
    end Empty_Vector;

  begin

    Empty_Vector (Self.Owned_Comments);

  end Clear_Memory;

  -----------------------------------------------------------------------------

  procedure Free
    (Self : in out Class_T)
  is

    procedure Process is new Ada.Unchecked_Deallocation
      (Object => Object_T'Class,
       Name   => Class_T);

    package T_IO renames Ada.Text_IO;

  begin
    Self.Clear_Memory;
    Process (Self);
  exception
    when E : others =>
      T_IO.Put_Line (Ada.Tags.Expanded_Name (Object_T'Tag));
      T_IO.Put_Line (Ada.Exceptions.Exception_Information (E));
      raise;
  end Free;

end Model.Element;
