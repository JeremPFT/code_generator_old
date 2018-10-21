package Model_Visitor.Visit_Root_Project_Impl is

  procedure Init_Impl
    (Visitor : in out          Model_Visitor.Object_T;
     Object  : not null access Model.Root_Project.Object_T'Class);
  procedure Create_Directories;
  procedure Create_Files;
  procedure Debug_Flag_Begin;
  procedure Debug_Flag_End;
  procedure Process_Modules;

private

  Visitor      : Model_Visitor.Object_T;
  Root_Project : access Model.Root_Project.Object_T'Class := null;

end Model_Visitor.Visit_Root_Project_Impl;
