package body Model.Type_Def is

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

end Model.Type_Def;
