package body Model.Project.IO is

  function To_String
    (Object : in Object_T)
    return String
  is
  begin
    return "project " &
      Object.Get_Name & " (" &
      Object.Get_Kind & ") " &
      Object.Get_Root_Directory;
  end To_String;

  function To_String
    (Object : access Object_T)
    return String
    is (To_String (Object.all));

end Model.Project.IO;
