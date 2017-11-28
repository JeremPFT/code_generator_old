package body Model.Type_Def is

  procedure Initialize
    (Self : in out Object_T'Class;
     Name : in     String)
  is
  begin
    Model.Named_Element.Initialize (Self, Name);
  end Initialize;

end Model.Type_Def;
