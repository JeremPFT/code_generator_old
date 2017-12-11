separate (Tests_Impl)

package body Init is
  procedure Set_Up_Project is
  begin
    Load.Project (Path => "path", Project_Name => "project");
    Data := Load.Get_Data;
  end;

  procedure Set_Up_Module is
  begin
    Set_Up_Project;
    Load.Module ("module_1");
  end;

  procedure Set_Up_Class is
  begin
    Set_Up_Module;
    Load.Class ("class_1");
  end;

  procedure Set_Up_Field is
  begin
    Set_Up_Class;
    Load.Field ("cls_1_fld_1 : cls_1_fld_1_type := cls_1_fld_1_default");
    Load.Field ("cls_1_fld_2 : cls_1_fld_2_type");
    Load.Field ("cls_1_fld_3 : cls_1_fld_3_type := cls_1_fld_3_default; get");
    Load.Field ("cls_1_fld_4 : cls_1_fld_4_type; set");
    Load.Field ("cls_1_fld_5 : cls_1_fld_5_type; get, set");
    Load.Field ("cls_1_fld_6 : vector; get");
    Load.Field ("cls_1_fld_7 : class_2.vector; get, add");
  end;

  procedure Set_Up_Method is
  begin
    Set_Up_Field;
    Load.Method ("");
  end;

end Init;
