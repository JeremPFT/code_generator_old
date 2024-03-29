package body Model.Types.Enum_Def is

  procedure Initialize
    (Self            : in out Object_T'Class;
     Name            : in     String;
     Owner_Namespace : access Namespace.Object_T'Class;
     Values          : in     Enum_Value.Vector_T :=
       Enum_Value.Vectors.Empty_Vector;
     Visibility      : in     Named_Element.Element_Visibility_T)
  is
  begin
    Parent_Pkg.Initialize (Self            => Self,
                           Name            => Name,
                           Owner_Namespace => Owner_Namespace,
                           Visibility      => Visibility);

    for Value of Values loop
      Self.Values.Append (Value);
    end loop;
  end Initialize;

  function Create
    (Name            : in     String;
     Owner_Namespace : access Namespace.Object_T'Class;
     Values          : in     Enum_Value.Vector_T :=
       Enum_Value.Vectors.Empty_Vector;
     Visibility      : in     Named_Element.Element_Visibility_T)
    return not null access Object_T'Class
  is
    Result : constant access Object_T := new Object_T;
  begin
    Result.Initialize (Name            => Name,
                       Values          => Values,
                       Owner_Namespace => Owner_Namespace,
                       Visibility      => Visibility);

    return Result;
  end Create;

end Model.Types.Enum_Def;
