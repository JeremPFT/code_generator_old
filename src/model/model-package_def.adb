with Ada.Text_IO;
with Ada.Exceptions;

with Model.Class_Def;

package body Model.Package_Def is

  procedure Initialize
    (Self   : in out Object_T'Class;
     Name   : in     String;
     Parent : access Object_T'Class := null)
  is
    --  package U_Str renames Ada.Strings.Unbounded;
  begin
    Named_Element.Initialize (Self, Name);
    Self.Parent := Parent;
  end Initialize;

  function Create
    (Name   : in     String;
     Parent : access Object_T'Class := null)
    return not null access Object_T'Class
  is
    Object : constant access Object_T :=
      new Object_T'(Named_Element.Object_T with
                    others => <>);

  begin
    Named_Element.Access_T (Object).Initialize (Name => Name);

    if Parent /= null then
      Object.Parent := Parent;
      Parent.Add_Child (Object);
    end if;

    --  (new Object_T'(Name           => new String'(Name),
    --                 Parent         => Parent,
    --                 Qualified_Name =>
    --                   new String'((if Parent /= null then
    --                                  Parent.Get_Qualified_Name & "::" & Name
    --                                else Name)),
    --                 Children         => <>,
    --                 Public_Elements  => <>,
    --                 Private_Elements => <>,
    --                 Body_Local_Decl  => <>,
    --                 Body_Public_Def  => <>,
    --                 Body_Private_Def => <>,
    --                 Body_Local_Def   => <>,
    --                 Owned_Comments   => Owned_Comments));

    return Object;

  exception
    when Error : others =>
      Ada.Text_IO.Put_Line
        (Ada.Exceptions.Exception_Information (Error));
      raise;
  end Create;

  procedure Add_Child
    (Self   : in out          Object_T;
     Object : not null access Object_T'Class)
  is
  begin
    Self.Children.Append (Object);
  end Add_Child;

  procedure Add_Public_Subprogram
    (Self   : in out          Object_T;
     Object : not null access Subprogram.Object_T'Class)
  is
  begin
    Self.Public_Elements.Append (Object);
  end Add_Public_Subprogram;

  procedure Add_Private_Subprogram
    (Self   : in out          Object_T;
     Object : not null access Subprogram.Object_T'Class)
  is
  begin
    Self.Private_Elements.Append (Object);
  end Add_Private_Subprogram;

  procedure Add_Public_Class
    (Self   : in out          Object_T;
     Object : not null access Class_Def.Object_T'Class)
  is
  begin
    Self.Public_Elements.Append (Object);
  end Add_Public_Class;

  overriding
  procedure Visit
    (Self   : in     Object_T;
     Object : in out Visitor.Object_T'Class)
  is
  begin
    Object.Visit_Package (Self);
  end Visit;

end Model.Package_Def;
