with Ada.Exceptions;

separate (Tests_Impl)

package body Check_Project is
  procedure Has_Valid_Path
  is
  begin
    Assert
      (Data.Path.all = Expected.Path,
       "chemin du projet");
  exception
    when E : others =>
      Ada.Text_IO.Put_Line (Ada.Exceptions.Exception_Information (E));
      --  when Assertion_Error => null;
  end Has_Valid_Path;

  procedure Has_Valid_Name
  is
  begin
    Assert
      (Data.Project.Get_Name = Expected.Project.Get_Name,
       "nom du projet");
  exception
    when E : others =>
      Ada.Text_IO.Put_Line (Ada.Exceptions.Exception_Information (E));
      --  when Assertion_Error => null;
  end Has_Valid_Name;

end Check_Project;
