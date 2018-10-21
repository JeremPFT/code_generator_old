package body Expected is

  function Get_Project
    return not null access Model.Project.Object_T
  is
  begin
    return Project;
  end Get_Project;

end Expected;
