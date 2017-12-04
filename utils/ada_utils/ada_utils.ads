with Ada.Strings.Fixed;

with Model.Package_Def;

package Ada_Utils is

  function Qualified_Name
    (Object : not null access Model.Package_Def.Object_T'Class)
    return String
    is ((if Object.Has_Parent then
           Qualified_Name (Model.Package_Def.Access_T
                             (Object.Get_Parent)) & "."
         else "") &
          Object.Get_Name);

  function Comma_To_Tiret
    (From : Character)
    return Character
    is ((if From = '.' then '-' else From));

  function File_Name
    (Object : not null access Model.Package_Def.Object_T)
    return String
    is (Ada.Strings.Fixed.Translate
          (Source  => Qualified_Name (Object),
           Mapping => Comma_To_Tiret'Access));

end Ada_Utils;
