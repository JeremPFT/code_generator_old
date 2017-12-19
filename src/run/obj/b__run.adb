pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__run.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__run.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is

   E076 : Short_Integer; pragma Import (Ada, E076, "system__os_lib_E");
   E014 : Short_Integer; pragma Import (Ada, E014, "system__soft_links_E");
   E024 : Short_Integer; pragma Import (Ada, E024, "system__exception_table_E");
   E071 : Short_Integer; pragma Import (Ada, E071, "ada__io_exceptions_E");
   E056 : Short_Integer; pragma Import (Ada, E056, "ada__strings_E");
   E039 : Short_Integer; pragma Import (Ada, E039, "ada__containers_E");
   E026 : Short_Integer; pragma Import (Ada, E026, "system__exceptions_E");
   E018 : Short_Integer; pragma Import (Ada, E018, "system__secondary_stack_E");
   E058 : Short_Integer; pragma Import (Ada, E058, "ada__strings__maps_E");
   E062 : Short_Integer; pragma Import (Ada, E062, "ada__strings__maps__constants_E");
   E044 : Short_Integer; pragma Import (Ada, E044, "interfaces__c_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "system__object_reader_E");
   E051 : Short_Integer; pragma Import (Ada, E051, "system__dwarf_lines_E");
   E038 : Short_Integer; pragma Import (Ada, E038, "system__traceback__symbolic_E");
   E307 : Short_Integer; pragma Import (Ada, E307, "ada__numerics_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__tags_E");
   E108 : Short_Integer; pragma Import (Ada, E108, "ada__streams_E");
   E283 : Short_Integer; pragma Import (Ada, E283, "interfaces__c__strings_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "system__file_control_block_E");
   E115 : Short_Integer; pragma Import (Ada, E115, "system__finalization_root_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "ada__finalization_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "system__file_io_E");
   E197 : Short_Integer; pragma Import (Ada, E197, "ada__streams__stream_io_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "system__storage_pools_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "system__finalization_masters_E");
   E136 : Short_Integer; pragma Import (Ada, E136, "system__storage_pools__subpools_E");
   E191 : Short_Integer; pragma Import (Ada, E191, "ada__strings__unbounded_E");
   E330 : Short_Integer; pragma Import (Ada, E330, "system__task_info_E");
   E324 : Short_Integer; pragma Import (Ada, E324, "system__task_primitives__operations_E");
   E267 : Short_Integer; pragma Import (Ada, E267, "system__regpat_E");
   E207 : Short_Integer; pragma Import (Ada, E207, "ada__calendar_E");
   E213 : Short_Integer; pragma Import (Ada, E213, "ada__calendar__time_zones_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "ada__text_io_E");
   E255 : Short_Integer; pragma Import (Ada, E255, "gnat__calendar_E");
   E258 : Short_Integer; pragma Import (Ada, E258, "gnat__calendar__time_io_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "system__assertions_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "system__pool_global_E");
   E376 : Short_Integer; pragma Import (Ada, E376, "system__random_seed_E");
   E230 : Short_Integer; pragma Import (Ada, E230, "system__regexp_E");
   E205 : Short_Integer; pragma Import (Ada, E205, "ada__directories_E");
   E340 : Short_Integer; pragma Import (Ada, E340, "system__tasking__initialization_E");
   E350 : Short_Integer; pragma Import (Ada, E350, "system__tasking__protected_objects_E");
   E354 : Short_Integer; pragma Import (Ada, E354, "system__tasking__protected_objects__entries_E");
   E348 : Short_Integer; pragma Import (Ada, E348, "system__tasking__queuing_E");
   E390 : Short_Integer; pragma Import (Ada, E390, "memory_streams_E");
   E140 : Short_Integer; pragma Import (Ada, E140, "model__element_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "model__comment_E");
   E148 : Short_Integer; pragma Import (Ada, E148, "model__named_element_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "model__visitor_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "model__dependency_E");
   E150 : Short_Integer; pragma Import (Ada, E150, "model__namespace_E");
   E163 : Short_Integer; pragma Import (Ada, E163, "model__package_def_E");
   E171 : Short_Integer; pragma Import (Ada, E171, "model__parameter_E");
   E167 : Short_Integer; pragma Import (Ada, E167, "model__types__type_def_E");
   E165 : Short_Integer; pragma Import (Ada, E165, "model__types__interface_def_E");
   E158 : Short_Integer; pragma Import (Ada, E158, "model__field_E");
   E161 : Short_Integer; pragma Import (Ada, E161, "model__types__class_def_E");
   E169 : Short_Integer; pragma Import (Ada, E169, "model__operation_E");
   E173 : Short_Integer; pragma Import (Ada, E173, "model__project_E");
   E175 : Short_Integer; pragma Import (Ada, E175, "model__root_project_E");
   E177 : Short_Integer; pragma Import (Ada, E177, "model__visitor__printer_E");
   E233 : Short_Integer; pragma Import (Ada, E233, "string_utils_E");
   E203 : Short_Integer; pragma Import (Ada, E203, "file_io_E");
   E402 : Short_Integer; pragma Import (Ada, E402, "string_vectors_E");
   E410 : Short_Integer; pragma Import (Ada, E410, "split_E");
   E404 : Short_Integer; pragma Import (Ada, E404, "project_loader_E");
   E406 : Short_Integer; pragma Import (Ada, E406, "project_loader__class_impl_E");
   E416 : Short_Integer; pragma Import (Ada, E416, "project_loader__operation_factory_E");
   E408 : Short_Integer; pragma Import (Ada, E408, "project_loader__class_impl__options_E");
   E398 : Short_Integer; pragma Import (Ada, E398, "templates_parser_tasking_E");
   E281 : Short_Integer; pragma Import (Ada, E281, "zlib_E");
   E285 : Short_Integer; pragma Import (Ada, E285, "zlib__thin_E");
   E246 : Short_Integer; pragma Import (Ada, E246, "templates_parser_E");
   E396 : Short_Integer; pragma Import (Ada, E396, "templates_parser__input_E");
   E384 : Short_Integer; pragma Import (Ada, E384, "templates_parser__utils_E");
   E292 : Short_Integer; pragma Import (Ada, E292, "aws__utils_E");
   E273 : Short_Integer; pragma Import (Ada, E273, "aws__resources_E");
   E277 : Short_Integer; pragma Import (Ada, E277, "aws__resources__streams_E");
   E394 : Short_Integer; pragma Import (Ada, E394, "aws__resources__streams__disk_E");
   E279 : Short_Integer; pragma Import (Ada, E279, "aws__resources__streams__zlib_E");
   E392 : Short_Integer; pragma Import (Ada, E392, "aws__resources__files_E");
   E287 : Short_Integer; pragma Import (Ada, E287, "aws__resources__streams__memory_E");
   E275 : Short_Integer; pragma Import (Ada, E275, "aws__resources__embedded_E");
   E244 : Short_Integer; pragma Import (Ada, E244, "templates_E");
   E201 : Short_Integer; pragma Import (Ada, E201, "model_visitor_E");
   E400 : Short_Integer; pragma Import (Ada, E400, "model_visitor__visit_root_project_impl_E");
   E242 : Short_Integer; pragma Import (Ada, E242, "model_visitor__visit_field_impl_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "generate_E");
   E002 : Short_Integer; pragma Import (Ada, E002, "run_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E201 := E201 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "model_visitor__finalize_spec");
      begin
         F1;
      end;
      declare
         procedure F2;
         pragma Import (Ada, F2, "templates__finalize_body");
      begin
         E244 := E244 - 1;
         F2;
      end;
      declare
         procedure F3;
         pragma Import (Ada, F3, "templates__finalize_spec");
      begin
         F3;
      end;
      declare
         procedure F4;
         pragma Import (Ada, F4, "aws__resources__embedded__finalize_body");
      begin
         E275 := E275 - 1;
         F4;
      end;
      E287 := E287 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "aws__resources__streams__memory__finalize_spec");
      begin
         F5;
      end;
      declare
         procedure F6;
         pragma Import (Ada, F6, "templates_parser__finalize_body");
      begin
         E246 := E246 - 1;
         F6;
      end;
      E292 := E292 - 1;
      E277 := E277 - 1;
      E279 := E279 - 1;
      declare
         procedure F7;
         pragma Import (Ada, F7, "aws__resources__streams__zlib__finalize_spec");
      begin
         F7;
      end;
      E394 := E394 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "aws__resources__streams__disk__finalize_spec");
      begin
         F8;
      end;
      declare
         procedure F9;
         pragma Import (Ada, F9, "aws__resources__streams__finalize_spec");
      begin
         F9;
      end;
      declare
         procedure F10;
         pragma Import (Ada, F10, "aws__utils__finalize_spec");
      begin
         F10;
      end;
      declare
         procedure F11;
         pragma Import (Ada, F11, "templates_parser__finalize_spec");
      begin
         F11;
      end;
      E281 := E281 - 1;
      declare
         procedure F12;
         pragma Import (Ada, F12, "zlib__finalize_spec");
      begin
         F12;
      end;
      declare
         procedure F13;
         pragma Import (Ada, F13, "templates_parser_tasking__finalize_body");
      begin
         E398 := E398 - 1;
         F13;
      end;
      declare
         procedure F14;
         pragma Import (Ada, F14, "project_loader__class_impl__options__finalize_body");
      begin
         E408 := E408 - 1;
         F14;
      end;
      declare
         procedure F15;
         pragma Import (Ada, F15, "project_loader__finalize_body");
      begin
         E404 := E404 - 1;
         F15;
      end;
      E406 := E406 - 1;
      declare
         procedure F16;
         pragma Import (Ada, F16, "project_loader__class_impl__options__finalize_spec");
      begin
         F16;
      end;
      declare
         procedure F17;
         pragma Import (Ada, F17, "project_loader__class_impl__finalize_spec");
      begin
         F17;
      end;
      E233 := E233 - 1;
      declare
         procedure F18;
         pragma Import (Ada, F18, "string_utils__finalize_spec");
      begin
         F18;
      end;
      E177 := E177 - 1;
      declare
         procedure F19;
         pragma Import (Ada, F19, "model__visitor__printer__finalize_spec");
      begin
         F19;
      end;
      declare
         procedure F20;
         pragma Import (Ada, F20, "model__root_project__finalize_body");
      begin
         E175 := E175 - 1;
         F20;
      end;
      declare
         procedure F21;
         pragma Import (Ada, F21, "model__root_project__finalize_spec");
      begin
         F21;
      end;
      declare
         procedure F22;
         pragma Import (Ada, F22, "model__project__finalize_body");
      begin
         E173 := E173 - 1;
         F22;
      end;
      declare
         procedure F23;
         pragma Import (Ada, F23, "model__project__finalize_spec");
      begin
         F23;
      end;
      declare
         procedure F24;
         pragma Import (Ada, F24, "model__operation__finalize_body");
      begin
         E169 := E169 - 1;
         F24;
      end;
      declare
         procedure F25;
         pragma Import (Ada, F25, "model__operation__finalize_spec");
      begin
         F25;
      end;
      declare
         procedure F26;
         pragma Import (Ada, F26, "model__field__finalize_body");
      begin
         E158 := E158 - 1;
         F26;
      end;
      declare
         procedure F27;
         pragma Import (Ada, F27, "model__types__class_def__finalize_body");
      begin
         E161 := E161 - 1;
         F27;
      end;
      declare
         procedure F28;
         pragma Import (Ada, F28, "model__types__class_def__finalize_spec");
      begin
         F28;
      end;
      declare
         procedure F29;
         pragma Import (Ada, F29, "model__field__finalize_spec");
      begin
         F29;
      end;
      declare
         procedure F30;
         pragma Import (Ada, F30, "model__types__interface_def__finalize_body");
      begin
         E165 := E165 - 1;
         F30;
      end;
      declare
         procedure F31;
         pragma Import (Ada, F31, "model__types__interface_def__finalize_spec");
      begin
         F31;
      end;
      E167 := E167 - 1;
      declare
         procedure F32;
         pragma Import (Ada, F32, "model__types__type_def__finalize_spec");
      begin
         F32;
      end;
      declare
         procedure F33;
         pragma Import (Ada, F33, "model__parameter__finalize_body");
      begin
         E171 := E171 - 1;
         F33;
      end;
      declare
         procedure F34;
         pragma Import (Ada, F34, "model__parameter__finalize_spec");
      begin
         F34;
      end;
      declare
         procedure F35;
         pragma Import (Ada, F35, "model__package_def__finalize_body");
      begin
         E163 := E163 - 1;
         F35;
      end;
      declare
         procedure F36;
         pragma Import (Ada, F36, "model__package_def__finalize_spec");
      begin
         F36;
      end;
      declare
         procedure F37;
         pragma Import (Ada, F37, "model__namespace__finalize_body");
      begin
         E150 := E150 - 1;
         F37;
      end;
      declare
         procedure F38;
         pragma Import (Ada, F38, "model__namespace__finalize_spec");
      begin
         F38;
      end;
      declare
         procedure F39;
         pragma Import (Ada, F39, "model__dependency__finalize_body");
      begin
         E146 := E146 - 1;
         F39;
      end;
      declare
         procedure F40;
         pragma Import (Ada, F40, "model__dependency__finalize_spec");
      begin
         F40;
      end;
      declare
         procedure F41;
         pragma Import (Ada, F41, "model__visitor__finalize_spec");
      begin
         E118 := E118 - 1;
         F41;
      end;
      E148 := E148 - 1;
      declare
         procedure F42;
         pragma Import (Ada, F42, "model__named_element__finalize_spec");
      begin
         F42;
      end;
      E140 := E140 - 1;
      declare
         procedure F43;
         pragma Import (Ada, F43, "model__comment__finalize_body");
      begin
         E124 := E124 - 1;
         F43;
      end;
      declare
         procedure F44;
         pragma Import (Ada, F44, "model__comment__finalize_spec");
      begin
         F44;
      end;
      declare
         procedure F45;
         pragma Import (Ada, F45, "model__element__finalize_spec");
      begin
         F45;
      end;
      E354 := E354 - 1;
      declare
         procedure F46;
         pragma Import (Ada, F46, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F46;
      end;
      E205 := E205 - 1;
      declare
         procedure F47;
         pragma Import (Ada, F47, "ada__directories__finalize_spec");
      begin
         F47;
      end;
      E230 := E230 - 1;
      declare
         procedure F48;
         pragma Import (Ada, F48, "system__regexp__finalize_spec");
      begin
         F48;
      end;
      E132 := E132 - 1;
      declare
         procedure F49;
         pragma Import (Ada, F49, "system__pool_global__finalize_spec");
      begin
         F49;
      end;
      E106 := E106 - 1;
      declare
         procedure F50;
         pragma Import (Ada, F50, "ada__text_io__finalize_spec");
      begin
         F50;
      end;
      E191 := E191 - 1;
      declare
         procedure F51;
         pragma Import (Ada, F51, "ada__strings__unbounded__finalize_spec");
      begin
         F51;
      end;
      E136 := E136 - 1;
      declare
         procedure F52;
         pragma Import (Ada, F52, "system__storage_pools__subpools__finalize_spec");
      begin
         F52;
      end;
      E126 := E126 - 1;
      declare
         procedure F53;
         pragma Import (Ada, F53, "system__finalization_masters__finalize_spec");
      begin
         F53;
      end;
      E197 := E197 - 1;
      declare
         procedure F54;
         pragma Import (Ada, F54, "ada__streams__stream_io__finalize_spec");
      begin
         F54;
      end;
      declare
         procedure F55;
         pragma Import (Ada, F55, "system__file_io__finalize_body");
      begin
         E112 := E112 - 1;
         F55;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Exception_Tracebacks : Integer;
      pragma Import (C, Exception_Tracebacks, "__gl_exception_tracebacks");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := '8';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, True, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (True, False, False, True, True, True, False, True, 
           False, False, True, True, True, True, False, False, 
           False, False, False, True, True, False, True, True, 
           False, True, True, True, True, False, True, False, 
           False, False, True, False, False, True, False, True, 
           False, True, True, False, False, True, True, False, 
           False, True, True, False, True, False, False, False, 
           False, False, False, False, True, True, True, False, 
           False, True, False, True, True, True, False, True, 
           True, False, True, True, True, True, False, True, 
           True, False, False, False, True, False, False, False, 
           False, True, False),
         Count => (0, 0, 0, 2, 0, 0, 0, 0, 1, 0),
         Unknown => (False, False, False, False, False, False, False, False, True, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Exception_Tracebacks := 1;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E024 := E024 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E071 := E071 + 1;
      Ada.Strings'Elab_Spec;
      E056 := E056 + 1;
      Ada.Containers'Elab_Spec;
      E039 := E039 + 1;
      System.Exceptions'Elab_Spec;
      E026 := E026 + 1;
      System.Soft_Links'Elab_Body;
      E014 := E014 + 1;
      System.Os_Lib'Elab_Body;
      E076 := E076 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E062 := E062 + 1;
      Interfaces.C'Elab_Spec;
      System.Secondary_Stack'Elab_Body;
      E018 := E018 + 1;
      E058 := E058 + 1;
      E044 := E044 + 1;
      System.Object_Reader'Elab_Spec;
      System.Dwarf_Lines'Elab_Spec;
      E051 := E051 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E038 := E038 + 1;
      E082 := E082 + 1;
      Ada.Numerics'Elab_Spec;
      E307 := E307 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E006 := E006 + 1;
      Ada.Streams'Elab_Spec;
      E108 := E108 + 1;
      Interfaces.C.Strings'Elab_Spec;
      E283 := E283 + 1;
      System.File_Control_Block'Elab_Spec;
      E116 := E116 + 1;
      System.Finalization_Root'Elab_Spec;
      E115 := E115 + 1;
      Ada.Finalization'Elab_Spec;
      E113 := E113 + 1;
      System.File_Io'Elab_Body;
      E112 := E112 + 1;
      Ada.Streams.Stream_Io'Elab_Spec;
      E197 := E197 + 1;
      System.Storage_Pools'Elab_Spec;
      E130 := E130 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E126 := E126 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      E136 := E136 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E191 := E191 + 1;
      System.Task_Info'Elab_Spec;
      E330 := E330 + 1;
      System.Task_Primitives.Operations'Elab_Body;
      E324 := E324 + 1;
      System.Regpat'Elab_Spec;
      E267 := E267 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E207 := E207 + 1;
      Ada.Calendar.Time_Zones'Elab_Spec;
      E213 := E213 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E106 := E106 + 1;
      Gnat.Calendar'Elab_Spec;
      E255 := E255 + 1;
      Gnat.Calendar.Time_Io'Elab_Spec;
      E258 := E258 + 1;
      System.Assertions'Elab_Spec;
      E142 := E142 + 1;
      System.Pool_Global'Elab_Spec;
      E132 := E132 + 1;
      System.Random_Seed'Elab_Body;
      E376 := E376 + 1;
      System.Regexp'Elab_Spec;
      E230 := E230 + 1;
      Ada.Directories'Elab_Spec;
      Ada.Directories'Elab_Body;
      E205 := E205 + 1;
      System.Tasking.Initialization'Elab_Body;
      E340 := E340 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E350 := E350 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E354 := E354 + 1;
      System.Tasking.Queuing'Elab_Body;
      E348 := E348 + 1;
      E390 := E390 + 1;
      Model.Element'Elab_Spec;
      Model.Comment'Elab_Spec;
      Model.Comment'Elab_Body;
      E124 := E124 + 1;
      Model.Element'Elab_Body;
      E140 := E140 + 1;
      Model.Named_Element'Elab_Spec;
      E148 := E148 + 1;
      Model.Visitor'Elab_Spec;
      E118 := E118 + 1;
      Model.Dependency'Elab_Spec;
      Model.Dependency'Elab_Body;
      E146 := E146 + 1;
      Model.Namespace'Elab_Spec;
      Model.Namespace'Elab_Body;
      E150 := E150 + 1;
      Model.Package_Def'Elab_Spec;
      Model.Package_Def'Elab_Body;
      E163 := E163 + 1;
      Model.Parameter'Elab_Spec;
      Model.Parameter'Elab_Body;
      E171 := E171 + 1;
      Model.Types.Type_Def'Elab_Spec;
      E167 := E167 + 1;
      Model.Types.Interface_Def'Elab_Spec;
      Model.Types.Interface_Def'Elab_Body;
      E165 := E165 + 1;
      Model.Field'Elab_Spec;
      Model.Types.Class_Def'Elab_Spec;
      Model.Types.Class_Def'Elab_Body;
      E161 := E161 + 1;
      Model.Field'Elab_Body;
      E158 := E158 + 1;
      Model.Operation'Elab_Spec;
      Model.Operation'Elab_Body;
      E169 := E169 + 1;
      Model.Project'Elab_Spec;
      Model.Project'Elab_Body;
      E173 := E173 + 1;
      Model.Root_Project'Elab_Spec;
      Model.Root_Project'Elab_Body;
      E175 := E175 + 1;
      Model.Visitor.Printer'Elab_Spec;
      Model.Visitor.Printer'Elab_Body;
      E177 := E177 + 1;
      String_Utils'Elab_Spec;
      E233 := E233 + 1;
      File_Io'Elab_Body;
      E203 := E203 + 1;
      String_Vectors'Elab_Spec;
      E402 := E402 + 1;
      E410 := E410 + 1;
      Project_Loader'Elab_Spec;
      Project_Loader.Class_Impl'Elab_Spec;
      E416 := E416 + 1;
      Project_Loader.Class_Impl.Options'Elab_Spec;
      E406 := E406 + 1;
      Project_Loader'Elab_Body;
      E404 := E404 + 1;
      Project_Loader.Class_Impl.Options'Elab_Body;
      E408 := E408 + 1;
      Templates_Parser_Tasking'Elab_Body;
      E398 := E398 + 1;
      Zlib'Elab_Spec;
      Zlib.Thin'Elab_Body;
      E285 := E285 + 1;
      Zlib'Elab_Body;
      E281 := E281 + 1;
      Templates_Parser'Elab_Spec;
      Templates_Parser.Input'Elab_Spec;
      Templates_Parser.Utils'Elab_Spec;
      E384 := E384 + 1;
      AWS.UTILS'ELAB_SPEC;
      AWS.RESOURCES'ELAB_SPEC;
      AWS.RESOURCES.STREAMS'ELAB_SPEC;
      AWS.RESOURCES.STREAMS.DISK'ELAB_SPEC;
      AWS.RESOURCES.STREAMS.DISK'ELAB_BODY;
      E394 := E394 + 1;
      AWS.RESOURCES.STREAMS.ZLIB'ELAB_SPEC;
      AWS.RESOURCES.STREAMS.ZLIB'ELAB_BODY;
      E279 := E279 + 1;
      AWS.RESOURCES.STREAMS'ELAB_BODY;
      E277 := E277 + 1;
      AWS.UTILS'ELAB_BODY;
      E292 := E292 + 1;
      E396 := E396 + 1;
      Templates_Parser'Elab_Body;
      E246 := E246 + 1;
      E392 := E392 + 1;
      AWS.RESOURCES.STREAMS.MEMORY'ELAB_SPEC;
      AWS.RESOURCES.STREAMS.MEMORY'ELAB_BODY;
      E287 := E287 + 1;
      AWS.RESOURCES.EMBEDDED'ELAB_BODY;
      E275 := E275 + 1;
      E273 := E273 + 1;
      Templates'Elab_Spec;
      Templates'Elab_Body;
      E244 := E244 + 1;
      Model_Visitor'Elab_Spec;
      Model_Visitor.Visit_Root_Project_Impl'Elab_Spec;
      E400 := E400 + 1;
      Model_Visitor.Visit_Field_Impl'Elab_Spec;
      E242 := E242 + 1;
      Model_Visitor'Elab_Body;
      E201 := E201 + 1;
      E104 := E104 + 1;
      E002 := E002 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_run");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /home/jeremy/workspace/ada/code_generator/src/run/obj/run.o
   --   -L/home/jeremy/workspace/ada/code_generator/src/run/obj/
   --   -L/home/jeremy/workspace/ada/code_generator/src/run/obj/
   --   -L/home/jeremy/workspace/ada/code_generator/utils/string_utils/lib/
   --   -L/home/jeremy/workspace/ada/code_generator/utils/file_io/lib/
   --   -L/home/jeremy/workspace/ada/code_generator/src/model/lib/
   --   -L/home/jeremy/workspace/ada/code_generator/utils/templates/lib/
   --   -L/usr/gnat/lib/aws/
   --   -L/usr/gnat/lib/xmlada/xmlada_schema.static/
   --   -L/usr/gnat/lib/xmlada/xmlada_sax.static/
   --   -L/usr/gnat/lib/xmlada/xmlada_unicode.static/
   --   -L/usr/gnat/lib/xmlada/xmlada_input.static/
   --   -L/usr/gnat/lib/xmlada/xmlada_dom.static/
   --   -L/home/jeremy/workspace/ada/code_generator/src/project_loader/lib/
   --   -L/usr/gnat/lib/opentoken/
   --   -L/home/jeremy/workspace/ada/code_generator/src/project_output/lib/
   --   -L/usr/gnat/lib/gcc/x86_64-pc-linux-gnu/6.3.1/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
   --   -lpthread
   --   -lrt
   --   -ldl
--  END Object file/option list   

end ada_main;
