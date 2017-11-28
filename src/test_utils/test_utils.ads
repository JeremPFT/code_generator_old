package Test_Utils is

  Section_Prefix : constant String :=
    "";
  --  "debut des tests de ";

  procedure Section
    (Text      : in String := Section_Prefix;
     Unit_Name : in String);

end Test_Utils;
