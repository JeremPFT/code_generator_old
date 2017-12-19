package Project_Loader.Class_Impl.Options is

  type Option_T
    is abstract tagged null record;
  procedure Process (Self : in Option_T) is abstract;

  type Abstract_Option_T is new Option_T with null record;

  overriding
  procedure Process (Self : in Abstract_Option_T);

  type Create_Option_T is new Option_T with null record;

  overriding
  procedure Process (Self : in Create_Option_T);

  type Init_Option_T is new Option_T with null record;

  overriding
  procedure Process (Self : in Init_Option_T);

  function Option_Factory
    (Key : in String)
    return access Option_T'Class;

end Project_Loader.Class_Impl.Options;
