
--  with ada files
--  with Ada.Text_IO;
--  with Ada.Exceptions;

--  with others libraries

--  with project files

package body Model.Namespace is

  procedure Initialize
    (Self            : in out Object_T'Class;
     Name            : in     String;
     Owner_Namespace : access Namespace.Object_T'Class)
  is
  begin
    Parent_Pkg.Initialize (Self            => Self,
                           Name            => Name,
                           Owner_Namespace => Owner_Namespace);
  end Initialize;

  function Create
    (Name            : in     String;
     Owner_Namespace : access Namespace.Object_T'Class)
    return not null access Object_T'Class
  is
    Result : constant access Object_T'Class := new Object_T;
  begin
    Namespace.Initialize (Self            => Result.all,
                          Name            => Name,
                          Owner_Namespace => Owner_Namespace);
    return Result;
  end Create;

  not overriding
  procedure Add_Member
    (Self       : in out          Object_T;
     Object     : not null access Named_Element.Object_T'Class;
     Visibility : in              Visibility_Kind := Public_Visibility)
  is
  begin
    Self.Owned_Members (Visibility).Append (Object);
  end Add_Member;

  function Get_Member
    (Self       : in Object_T;
     Visibility : in Visibility_Kind := Public_Visibility;
     Index      : in Positive)
    return not null access Named_Element.Object_T'Class
  is
    Result     : access Named_Element.Object_T'Class := null;
    Last_Index : Natural                             := 0;
  begin
    Last_Index := Self.Number_Of_Members (Visibility);

    if Index > Last_Index then
      raise Member_Index_Out_Of_Bounds with
        "given index is" & Index'Image &
          ", size is" & Last_Index'Image;
    end if;

    Result := Self.Owned_Members (Visibility) (Index);
    return Result;
  end Get_Member;

  -----------------------------------------------------------------------------

  overriding
  procedure Visit
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class)
  is
  begin
    Object.Visit_Namespace (Self);
  end Visit;

  -----------------------------------------------------------------------------

end Model.Namespace;
