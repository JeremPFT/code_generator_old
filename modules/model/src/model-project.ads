with Ada.Containers.Vectors;
with Model.Named_Element;
with Model.Package_Def;
with Model.Operation;
with Model.Types.Class_Def;
with Model.Visitor;
limited with Model.Parent_Project;

package Model.Project is


  -- preprocessor: gnatprep or gprbuild -gnatep

  --  #if True
  pragma Assertion_Policy ( Check );
  --  #else
  --    pragma Assertion_Policy ( Ignore );
  --  #endif

  package Parent_Pkg renames Model.Named_Element;

  type Object_T is new Parent_Pkg.Object_T with private;

  type Access_T is access all Object_T;

  type Class_T is access all Object_T'Class;

  package Vectors is new Ada.Containers.Vectors
    (Element_Type => Class_T,
     Index_Type   => Positive);

  subtype Vector_T is Vectors.Vector;

  function Create
    (Name   : in     String;
     Kind   : in     String;
     Parent : access Parent_Project.Object_T'Class := null)
    return not null access Object_T'Class;
  pragma Post ( ( if Parent = null then
                   not Create'Result.Has_Parent else
                   Create'Result.Has_Parent and then
                     Create'Result.Get_Parent = Parent ) );

  not overriding
  function Has_Parent
    (Self : in Object_T)
    return Boolean;

  not overriding
  function Get_Parent
    (Self : in Object_T)
    return not null access Parent_Project.Object_T'Class;

  not overriding
  function Get_Kind
    (Self : in Object_T)
    return String;

  not overriding
  function Number_Of_Elements
    (Self : in Object_T)
    return Natural;

  not overriding
  function Get_Element
    (Self  : in Object_T;
     Index : in Natural)
    return not null access Named_Element.Object_T'Class;
  pragma Pre ( Self.Number_Of_Elements = 0 );

  not overriding
  procedure Add_Package
    (Self   : in out          Object_T;
     Object : not null access Package_Def.Object_T'Class);
  pragma Post ( Self.Number_Of_Elements = Self.Number_Of_Elements'Old + 1 );

  not overriding
  procedure Add_Class
    (Self   : in out          Object_T;
     Object : not null access Types.Class_Def.Object_T'Class);
  pragma Post ( Self.Number_Of_Elements = Self.Number_Of_Elements'Old + 1 );

  not overriding
  procedure Add_Operation
    (Self   : in out          Object_T;
     Object : not null access Operation.Object_T'Class);
  pragma Post ( Self.Number_Of_Elements = Self.Number_Of_Elements'Old + 1 );

  overriding
  procedure Visit
    (Self   : in out Object_T;
     Object : in out Visitor.Object_T'Class);

  function Is_Post_State
    (Self   : in out Object_T'Class;
     Name   : in     String;
     Kind   : in     String;
     Parent : access Parent_Project.Object_T'Class)
    return Boolean;

  function Is_Pre_State
    ( Self : in out Object_T'Class )
    return Boolean;

  procedure Initialize
    (Self   : in out Object_T'Class;
     Name   : in     String;
     Kind   : in     String;
     Parent : access Parent_Project.Object_T'Class := null);
  pragma Pre ( Self.Is_Pre_State );
  pragma Post ( Self.Is_Post_State ( Name, Kind, Parent ) );

private

  type Object_T is new Parent_Pkg.Object_T with record
    Parent   : access Parent_Project.Object_T'Class := null;
    Kind     : access String                      := null;
    Elements : Named_Element.Vector_T             :=
      Named_Element.Vectors.Empty_Vector;
  end record;

  function Is_Pre_State
    ( Self : in out Object_T'Class )
    return Boolean
    is( Self.Parent = null and then
         Self.Kind = null and then
         Natural ( Self.Elements.Length ) = 0 );

  function Is_Post_State
    (Self   : in out Object_T'Class;
     Name   : in     String;
     Kind   : in     String;
     Parent : access Parent_Project.Object_T'Class)
    return Boolean
    is ( ( if Parent = null then
            not Self.Has_Parent
          else
            Self.Has_Parent and then
              Self.Get_Parent = Parent ) and then
          Self.Number_Of_Elements = 0 );

  not overriding
  function Get_Kind
    (Self : in Object_T)
    return String
    is
    (Self.Kind.all);

  not overriding
  function Has_Parent
    (Self : in Object_T)
    return Boolean
    is (Self.Parent /= null);

  not overriding
  function Get_Parent
    (Self : in Object_T)
    return not null access Parent_Project.Object_T'Class
    is (Self.Parent);

  --  not overriding
  --  function Get_Elements
  --    (Self : in Object_T)
  --    return Named_Element.Vector_T
  --    is (Self.Elements);

  not overriding
  function Number_Of_Elements
    (Self : in Object_T)
    return Natural
    is (Natural (Self.Elements.Length));

  not overriding
  function Get_Element
    (Self  : in Object_T;
     Index : in Natural)
    return not null access Named_Element.Object_T'Class
    is (Self.Elements (Index));

  procedure Add_Element
    (Self   : in out          Object_T'Class;
     Object : not null access Named_Element.Object_T'Class);
  pragma Post ( Natural (Self.Elements.Length) = Natural (Self'Old.Elements.Length) + 1 );

end Model.Project;
