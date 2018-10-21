separate (Tests_Impl)

package body Init is
  procedure Setup_Project is
  begin
    Load.Project (Path => "path", Project_Name => "project");
    Data := Load.Get_Data;
  end;

  procedure Setup_Module is
  begin
    Setup_Project;
    Load.Module ("module_1");
  end;

  procedure Setup_Class is
  begin
    Setup_Module;
    Load.Class ("class_1");
  end;

  procedure Setup_Field is
  begin
    Setup_Class;
    Load.Field ("cls_1_fld_1 : cls_1_fld_1_type := cls_1_fld_1_default");
    Load.Field ("cls_1_fld_2 : cls_1_fld_2_type");
    Load.Field ("cls_1_fld_3 : cls_1_fld_3_type := cls_1_fld_3_default; get");
    Load.Field ("cls_1_fld_4 : cls_1_fld_4_type; set");
    Load.Field ("cls_1_fld_5 : cls_1_fld_5_type; get, set");
    Load.Field ("cls_1_fld_6 : vector; get");
    Load.Field ("cls_1_fld_7 : class_2.vector; get, add");
  end;

  procedure Setup_Method is
  begin
    Setup_Field;
    Load.Operation ("");
  end;

end Init;
