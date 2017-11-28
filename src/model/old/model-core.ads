with Ada.Containers.Vectors;

package Model.Core is

  type String_Ref is
    access String;

  package String_Vectors is
    new Ada.Containers.Vectors
    (Element_Type => String_Ref,
     Index_Type   => Positive);

  subtype String_Vector is
    String_Vectors.Vector;

  -----------------------------------------------------------------------------
  --
  --  types declarations
  --
  --  element_t       : abstract
  --  comment_t       : new element_t
  --  named_element_t : abstract new element_t
  --  package_t       : new named_element_t
  --  subprogram_t    : new named_element_t
  --  parameter_t     : new named_element_t
  --  field_t         : new named_element_t
  --  type_t          : abstract new named_element_t
  --  array_t         : new type_t
  --  enum_t          : new type_t
  --  interface_t     : new type_t
  --  class_t         : new interface_t
  --
  -----------------------------------------------------------------------------

  type Element_T is
    tagged;

  type Element_Ref is
    access all Element_T;

  type Element_Cref is
    access all Element_T'Class;

  type Element_Array is
    array (Integer range <>) of Element_Cref;

  package Element_Vectors is
    new Ada.Containers.Vectors
    (Element_Type => Element_Cref,
     Index_Type   => Positive);

  subtype Element_Vector is
    Element_Vectors.Vector;

  -----------------------------------------------------------------------------

  type Comment_T is
    tagged;

  type Comment_Ref is
    access all Comment_T;

  type Comment_Cref is
    access all Comment_T'Class;

  package Comment_Vectors is
    new Ada.Containers.Vectors
    (Element_Type => Comment_Ref,
     Index_Type   => Positive);

  subtype Comment_Vector is
    Comment_Vectors.Vector;

  type Comment_Itf is
    interface;

  -----------------------------------------------------------------------------

  type Named_Element_T is
    tagged;

  type Named_Element_Ref is
    access all Named_Element_T;

  type Named_Element_Cref is
    access all Named_Element_T'Class;

  package Named_Element_Vectors is
    new Ada.Containers.Vectors
    (Element_Type => Named_Element_Cref,
     Index_Type   => Positive);

  subtype Named_Element_Vector is
    Named_Element_Vectors.Vector;

  -----------------------------------------------------------------------------

  type Package_T is
    tagged;

  type Package_Ref is
    access all Package_T;

  type Package_Cref is
    access all Package_T'Class;

  package Package_Vectors is
    new Ada.Containers.Vectors
    (Element_Type => Package_Cref,
     Index_Type   => Positive);

  subtype Package_Vector is
    Package_Vectors.Vector;

  -----------------------------------------------------------------------------

  type Subprogram_T is
    tagged;

  type Subprogram_Ref is
    access all Subprogram_T;

  type Subprogram_Cref is
    access all Subprogram_T'Class;

  package Subprogram_Vectors is
    new Ada.Containers.Vectors
    (Element_Type => Subprogram_Cref,
     Index_Type   => Positive);

  subtype Subprogram_Vector is
    Subprogram_Vectors.Vector;

  -----------------------------------------------------------------------------

  type Parameter_T is
    tagged;

  type Parameter_Ref is
    access all Parameter_T;

  type Parameter_Cref is
    access all Parameter_T'Class;

  package Parameter_Vectors is
    new Ada.Containers.Vectors
    (Element_Type => Parameter_Ref,
     Index_Type   => Positive);

  subtype Parameter_Vector is
    Parameter_Vectors.Vector;

  -----------------------------------------------------------------------------

  type Field_T is
    tagged;

  type Field_Ref is
    access all Field_T;

  type Field_Cref is
    access all Field_T'Class;

  package Field_Vectors is
    new Ada.Containers.Vectors
    (Element_Type => Field_Cref,
     Index_Type   => Positive);

  subtype Field_Vector is
    Field_Vectors.Vector;

  -----------------------------------------------------------------------------

  type Type_T is
    tagged;

  type Type_Ref is
    access all Type_T;

  type Type_Cref is
    access all Type_T'Class;

  type Type_Array is
    array (Integer range <>) of Type_Cref;

  package Type_Vectors is
    new Ada.Containers.Vectors
    (Element_Type => Type_Ref,
     Index_Type   => Positive);

  subtype Type_Vector is
    Type_Vectors.Vector;

  -----------------------------------------------------------------------------

  type Array_T is
    tagged;

  type Array_Ref is
    access all Array_T;

  type Array_Cref is
    access all Array_T'Class;

  package Array_Vectors is
    new Ada.Containers.Vectors
    (Element_Type => Array_Ref,
     Index_Type   => Positive);

  subtype Array_Vector is
    Array_Vectors.Vector;

  -----------------------------------------------------------------------------

  type Enum_T is
    tagged;

  type Enum_Ref is
    access all Enum_T;

  type Enum_Cref is
    access all Enum_T'Class;

  package Enum_Vectors is
    new Ada.Containers.Vectors
    (Element_Type => Enum_Ref,
     Index_Type   => Positive);

  subtype Enum_Vector is
    Enum_Vectors.Vector;

  -----------------------------------------------------------------------------

  type Interface_T is
    tagged;

  type Interface_Ref is
    access all Interface_T;

  type Interface_Cref is
    access all Interface_T'Class;

  package Interface_Vectors is
    new Ada.Containers.Vectors
    (Element_Type => Interface_Ref,
     Index_Type   => Positive);

  subtype Interface_Vector is
    Interface_Vectors.Vector;

  -----------------------------------------------------------------------------

  type Class_T is
    tagged;

  type Class_Ref is
    access all Class_T;

  type Class_Cref is
    access all Class_T'Class;

  package Class_Vectors is
    new Ada.Containers.Vectors
    (Element_Type => Class_Ref,
     Index_Type   => Positive);

  subtype Class_Vector is
    Class_Vectors.Vector;

  -----------------------------------------------------------------------------

  type Access_T is
    tagged;

  type Access_Ref is
    access all Access_T;

  type Access_Cref is
    access all Access_T'Class;

  package Access_Vectors is
    new Ada.Containers.Vectors
    (Element_Type => Access_Ref,
     Index_Type   => Positive);

  subtype Access_Vector is
    Access_Vectors.Vector;

  -----------------------------------------------------------------------------
  --
  --  types definitions
  --
  -----------------------------------------------------------------------------

  type Element_T is
    abstract
    tagged record
      Owned_Comments : Comment_Vector := Comment_Vectors.Empty_Vector;
    end record;

  not overriding
  procedure Add_Comment
    (Self    : in out Element_T;
     Comment : in String);

  not overriding
  function Number_Of_Comments
    (Self : in Element_T)
    return Natural;

  not overriding
  function Get_Comment
    (Self  : in Element_T;
     Index : in Positive)
    return String;

  -----------------------------------------------------------------------------

  type Comment_T is
    new Element_T with record
      Comment_Body : access String := null;
    end record;

  function Create
    (Text : in String)
    return not null access Comment_T'Class;

  not overriding
  procedure Set_Comment_Body
    (Self  : in out Comment_T;
     Value : in     String);

  not overriding
  function Get_Comment_Body
    (Self : in Comment_T)
    return String
    is
    (Self.Comment_Body.all);

  -----------------------------------------------------------------------------

  type Named_Element_T is
    abstract
    new Element_T with record
      Name : access String := null;
    end record;

  not overriding
  procedure Set_Name
    (Self  : in out Named_Element_T;
     Value : in     String);

  not overriding
  function Get_Name
    (Self : in Named_Element_T)
    return String
    is
    (Self.Name.all);

  -----------------------------------------------------------------------------

  type Package_T is
    new Named_Element_T with record
      Qualified_Name : access String := null;

      Parent : access Package_T'Class := null;

      Children : Package_Vector :=
        Package_Vectors.Empty_Vector;

      Public_Elements : Named_Element_Vector :=
        Named_Element_Vectors.Empty_Vector;

      Private_Elements : Named_Element_Vector :=
        Named_Element_Vectors.Empty_Vector;

      Body_Local_Decl : Named_Element_Vector :=
        Named_Element_Vectors.Empty_Vector;

      Body_Public_Def : Named_Element_Vector :=
        Named_Element_Vectors.Empty_Vector;

      Body_Private_Def : Named_Element_Vector :=
        Named_Element_Vectors.Empty_Vector;

      Body_Local_Def : Named_Element_Vector :=
        Named_Element_Vectors.Empty_Vector;

    end record;

  function Create
    (Name           : in     String;
     Parent         : access Package_T'Class := null;
     Owned_Comments : in     Comment_Vector  := Comment_Vectors.Empty_Vector)
    return not null access Package_T'Class;

  not overriding
  procedure Set_Qualified_Name
    (Self  : in out Package_T;
     Value : in String);

  not overriding
  function Get_Qualified_Name
    (Self : in Package_T)
    return String
    is
    (Self.Qualified_Name.all);

  not overriding
  procedure Add_Class
    (Self   : in out          Package_T;
     Object : not null access constant Class_T'Class);

  not overriding
  procedure Add_Public_Subprogram
    (Self   : in out          Package_T;
     Object : not null access Subprogram_T'Class);

  type Get_Class_Result (Has_Result : Boolean) is
    record
      case Has_Result is
        when True => Obj_Class : access Class_T'Class := null;

        when False => null;
      end case;
    end record;

  function Get_Class
    (Self       : in Package_T;
     Class_Name : in String)
    return Get_Class_Result;

  -----------------------------------------------------------------------------

  type Param_Mode_T is
    (P_Mode_In,
     P_Mode_Out,
     P_Mode_In_Out,
     P_Mode_Access,
     P_Mode_Access_Constant,
     P_Mode_Not_Null_Access,
     P_Mode_Not_Null_Access_Constant);

  type Parameter_T is
    new Named_Element_T with record
      Of_Type       : access String := null;
      Default_Value : access String := null;
      Mode          : Param_Mode_T  := P_Mode_In;
    end record;

  type Mode_Str_T is
    array (Param_Mode_T) of String_Ref;

  not overriding
  function "+"(Text : in String) return String_Ref
    is
    (new String'(Text));

  Mode_Str : constant Mode_Str_T :=
    (
     P_Mode_In                       => +"in",
     P_Mode_Out                      => +"out",
     P_Mode_In_Out                   => +"in out",
     P_Mode_Access                   => +"access",
     P_Mode_Access_Constant          => +"access constant",
     P_Mode_Not_Null_Access          => +"not null access",
     P_Mode_Not_Null_Access_Constant => +"not null access constant"
    );

  function Create
    (Name           : in String;
     Of_Type        : in String;
     Default_Value  : in String         := "";
     Mode           : in Param_Mode_T   := P_Mode_In;
     Owned_Comments : in Comment_Vector := Comment_Vectors.Empty_Vector)
    return not null access Parameter_T'Class;

  not overriding
  procedure Set_Type
    (Self  : in out Parameter_T;
     Value : in     String);

  function Get_Type
    (Self : in Parameter_T)
    return String
    is
    (Self.Of_Type.all);

  not overriding
  procedure Set_Default_Value
    (Self  : in out Parameter_T;
     Value : in     String);

  function Get_Default_Value
    (Self : in Parameter_T)
    return String
    is
    (Self.Default_Value.all);

  -----------------------------------------------------------------------------

  type Subprogram_T
    (Owner_Package : access Package_T'Class) is
    new Named_Element_T with record

      Of_Type     : access String    := null;
      Is_Abstract : Boolean          := False;
      Is_Separate : Boolean          := False;
      Parameters  : Parameter_Vector := Parameter_Vectors.Empty_Vector;

      Declarations : String_Vector := String_Vectors.Empty_Vector;
      Instructions : String_Vector := String_Vectors.Empty_Vector;
    end record;

  function Create
    (Owner_Package  : access Package_T'Class;
     Name           : in     String;
     Of_Type        : in     String         := "";
     Is_Abstract    : in     Boolean        := False;
     Is_Separate    : in     Boolean        := False;
     Owned_Comments : in     Comment_Vector := Comment_Vectors.Empty_Vector)
    return not null access Subprogram_T'Class;

  procedure Set_Type
    (Self  : in out Subprogram_T;
     Value : in     String);

  not overriding
  function Get_Type
    (Self : in Subprogram_T)
    return String
    is
    (Self.Of_Type.all);

  function Has_Return
    (Self : in Subprogram_T)
    return Boolean
    is
    (Self.Of_Type.all /= "");

  -----------------------------------------------------------------------------

  type Type_T
    (Owner_Package : not null access Package_T'Class)
    is
    abstract new Named_Element_T with null record;

  -----------------------------------------------------------------------------

  type Array_T is
    new Type_T with record
      Contained_Type : not null access String;
      Index_Type     : not null access String;
      Defined_Range  : not null access String;
    end record;

  function Create
    (Owner_Package  : not null access Package_T'Class;
     Name           : in              String;
     Contained_Type : in              String;
     Index_Type     : in              String;
     Defined_Range  : in              String;
     Owned_Comments : in              Comment_Vector :=
       Comment_Vectors.Empty_Vector)
    return not null access Array_T'Class;

  procedure Set_Contained_Type
    (Self  : in out Array_T;
     Value : in     String);

  not overriding
  function Get_Contained_Type
    (Self : in Array_T)
    return String
    is
    (Self.Contained_Type.all);

  procedure Set_Index_Type
    (Self  : in out Array_T;
     Value : in     String);

  not overriding
  function Get_Index_Type
    (Self : in Array_T)
    return String
    is
    (Self.Index_Type.all);

  procedure Set_Range
    (Self  : in out Array_T;
     Value : in     String);

  not overriding
  function Get_Range
    (Self : in Array_T)
    return String
    is
    (Self.Defined_Range.all);

  -----------------------------------------------------------------------------

  type Enum_T is
    new Type_T with record
      Values : String_Vector := String_Vectors.Empty_Vector;
    end record;

  -----------------------------------------------------------------------------

  type Field_T
    (Owner_Class : not null access Class_T'Class)
    is
    new Named_Element_T with record

      Of_Type       : access String := null;
      Default_Value : access String := null;
    end record;

  function Create
    (Owner_Class    : not null access Class_T'Class;
     Name           : in              String;
     Of_Type        : in              String;
     Default_Value  : in              String         := "";
     Owned_Comments : in              Comment_Vector :=
       Comment_Vectors.Empty_Vector)
    return not null access Field_T'Class;

  not overriding
  procedure Set_Type
    (Self  : in out Field_T;
     Value : in     String);

  function Get_Type
    (Self : in Field_T)
    return String
    is
    (Self.Of_Type.all);

  not overriding
  procedure Set_Default_Value
    (Self  : in out Field_T;
     Value : in     String);

  function Get_Default_Value
    (Self : in Field_T)
    return String
    is
    (Self.Default_Value.all);

  -----------------------------------------------------------------------------

  type Interface_T is
    new Type_T with record
      Parents     : Interface_Vector  := Interface_Vectors.Empty_Vector;
      Subprograms : Subprogram_Vector := Subprogram_Vectors.Empty_Vector;
    end record;

  function Create
    (Owner_Package  : not null access Package_T'Class;
     Name           : in              String;
     Parents        : in              Interface_Vector :=
       Interface_Vectors.Empty_Vector;
     Owned_Comments : in              Comment_Vector   :=
       Comment_Vectors.Empty_Vector)
    return not null access Interface_T'Class;

  not overriding
  function Get_Qualified_Name
    (Self : in Interface_T)
    return String
    is
    (Self.Owner_Package.Get_Qualified_Name & "::" & Self.Get_Name);

  not overriding
  procedure Add_Subprogram
    (Self       : in out          Interface_T;
     Subprogram : not null access Subprogram_T'Class);

  -----------------------------------------------------------------------------

  type Class_T is
    new Interface_T with record
      Parent      : access Class_T'Class := null;
      Is_Abstract : Boolean              := False;
      Fields      : Field_Vector         := Field_Vectors.Empty_Vector;
    end record;

  function Create
    (Owner_Package  : not null access Package_T'Class;
     Name           : in              String;
     Parents        : in              Interface_Vector :=
       Interface_Vectors.Empty_Vector;
     Parent         : access          Class_T'Class    := null;
     Is_Abstract    : in              Boolean          := False;
     Owned_Comments : in              Comment_Vector   :=
       Comment_Vectors.Empty_Vector)
    return not null access Class_T'Class;

  not overriding
  procedure Add_Field
    (Self  : in out          Class_T;
     Field : not null access Field_T'Class);

  -----------------------------------------------------------------------------

  type Acc_Mode_T is
    (A_Mode_Acces,
     A_Mode_Access_All,
     A_Mode_Access_Class);

  type Access_T is
    new Type_T with record
      Access_Mode : Acc_Mode_T;
    end record;

  function Create
    (Owner_Package : not null access Package_T'Class;
     Name          : in              String;
     Access_Mode   : in              Acc_Mode_T)
    return not null access Access_T;

  -----------------------------------------------------------------------------

end Model.Core;
