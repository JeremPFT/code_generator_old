separate (Tests_Impl)

package body Init is
  procedure Check_Project is
  begin
    Load.Project (Path => "path", Project_Name => "project");
    Data := Load.Get_Data;
  end;

  procedure Check_Module is
  begin
    Check_Project;
    Load.Module ("module_1");
  end;

  procedure Check_Class is
  begin
    Check_Module;
    Load.Class ("class_1");
  end;

  procedure Check_Field is
  begin
    Check_Class;
    Load.Field ("cls_1_fld_1 : cls_1_fld_1_type := cls_1_fld_1_default");
    Load.Field ("cls_1_fld_2 : cls_1_fld_2_type");
    Load.Field ("cls_1_fld_3 : cls_1_fld_3_type := cls_1_fld_3_default; get");
    Load.Field ("cls_1_fld_4 : cls_1_fld_4_type; set");
    Load.Field ("cls_1_fld_5 : cls_1_fld_5_type; get, set");
    Load.Field ("cls_1_fld_6 : vector");
    Load.Field ("cls_1_fld_7 : class_2.vector");
  end;
end Init;
