package Model.Project.IO is

  function To_String
    (Object : in Object_T)
    return String;

  function To_String
    (Object : access Object_T)
    return String;

end Model.Project.IO;
