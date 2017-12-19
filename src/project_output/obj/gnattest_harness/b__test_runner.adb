pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__test_runner.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__test_runner.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is

   E073 : Short_Integer; pragma Import (Ada, E073, "system__os_lib_E");
   E013 : Short_Integer; pragma Import (Ada, E013, "system__soft_links_E");
   E019 : Short_Integer; pragma Import (Ada, E019, "system__exception_table_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "ada__io_exceptions_E");
   E053 : Short_Integer; pragma Import (Ada, E053, "ada__strings_E");
   E036 : Short_Integer; pragma Import (Ada, E036, "ada__containers_E");
   E021 : Short_Integer; pragma Import (Ada, E021, "system__exceptions_E");
   E009 : Short_Integer; pragma Import (Ada, E009, "system__secondary_stack_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "ada__strings__maps_E");
   E059 : Short_Integer; pragma Import (Ada, E059, "ada__strings__maps__constants_E");
   E041 : Short_Integer; pragma Import (Ada, E041, "interfaces__c_E");
   E079 : Short_Integer; pragma Import (Ada, E079, "system__object_reader_E");
   E048 : Short_Integer; pragma Import (Ada, E048, "system__dwarf_lines_E");
   E035 : Short_Integer; pragma Import (Ada, E035, "system__traceback__symbolic_E");
   E348 : Short_Integer; pragma Import (Ada, E348, "ada__numerics_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "ada__tags_E");
   E135 : Short_Integer; pragma Import (Ada, E135, "ada__streams_E");
   E324 : Short_Integer; pragma Import (Ada, E324, "interfaces__c__strings_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "system__file_control_block_E");
   E137 : Short_Integer; pragma Import (Ada, E137, "system__finalization_root_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "ada__finalization_E");
   E181 : Short_Integer; pragma Import (Ada, E181, "system__file_io_E");
   E240 : Short_Integer; pragma Import (Ada, E240, "ada__streams__stream_io_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "system__storage_pools_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "system__finalization_masters_E");
   E169 : Short_Integer; pragma Import (Ada, E169, "system__storage_pools__subpools_E");
   E163 : Short_Integer; pragma Import (Ada, E163, "ada__strings__unbounded_E");
   E371 : Short_Integer; pragma Import (Ada, E371, "system__task_info_E");
   E365 : Short_Integer; pragma Import (Ada, E365, "system__task_primitives__operations_E");
   E308 : Short_Integer; pragma Import (Ada, E308, "system__regpat_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "ada__calendar_E");
   E208 : Short_Integer; pragma Import (Ada, E208, "ada__calendar__time_zones_E");
   E177 : Short_Integer; pragma Import (Ada, E177, "ada__text_io_E");
   E298 : Short_Integer; pragma Import (Ada, E298, "gnat__calendar_E");
   E301 : Short_Integer; pragma Import (Ada, E301, "gnat__calendar__time_io_E");
   E184 : Short_Integer; pragma Import (Ada, E184, "gnat__directory_operations_E");
   E232 : Short_Integer; pragma Import (Ada, E232, "system__assertions_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "system__pool_global_E");
   E416 : Short_Integer; pragma Import (Ada, E416, "system__random_seed_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "system__regexp_E");
   E204 : Short_Integer; pragma Import (Ada, E204, "ada__directories_E");
   E161 : Short_Integer; pragma Import (Ada, E161, "gnat__command_line_E");
   E381 : Short_Integer; pragma Import (Ada, E381, "system__tasking__initialization_E");
   E391 : Short_Integer; pragma Import (Ada, E391, "system__tasking__protected_objects_E");
   E395 : Short_Integer; pragma Import (Ada, E395, "system__tasking__protected_objects__entries_E");
   E389 : Short_Integer; pragma Import (Ada, E389, "system__tasking__queuing_E");
   E099 : Short_Integer; pragma Import (Ada, E099, "aunit_E");
   E101 : Short_Integer; pragma Import (Ada, E101, "aunit__memory_E");
   E119 : Short_Integer; pragma Import (Ada, E119, "aunit__memory__utils_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "ada_containers__aunit_lists_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "aunit__tests_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "aunit__time_measure_E");
   E121 : Short_Integer; pragma Import (Ada, E121, "aunit__test_results_E");
   E114 : Short_Integer; pragma Import (Ada, E114, "aunit__assertions_E");
   E110 : Short_Integer; pragma Import (Ada, E110, "aunit__test_filters_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "aunit__simple_test_cases_E");
   E149 : Short_Integer; pragma Import (Ada, E149, "aunit__reporter_E");
   E151 : Short_Integer; pragma Import (Ada, E151, "aunit__reporter__gnattest_E");
   E444 : Short_Integer; pragma Import (Ada, E444, "aunit__test_fixtures_E");
   E450 : Short_Integer; pragma Import (Ada, E450, "aunit__test_caller_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "aunit__test_suites_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "aunit__run_E");
   E428 : Short_Integer; pragma Import (Ada, E428, "memory_streams_E");
   E255 : Short_Integer; pragma Import (Ada, E255, "model__element_E");
   E257 : Short_Integer; pragma Import (Ada, E257, "model__comment_E");
   E253 : Short_Integer; pragma Import (Ada, E253, "model__named_element_E");
   E258 : Short_Integer; pragma Import (Ada, E258, "model__visitor_E");
   E260 : Short_Integer; pragma Import (Ada, E260, "model__dependency_E");
   E251 : Short_Integer; pragma Import (Ada, E251, "model__namespace_E");
   E264 : Short_Integer; pragma Import (Ada, E264, "model__package_def_E");
   E273 : Short_Integer; pragma Import (Ada, E273, "model__parameter_E");
   E271 : Short_Integer; pragma Import (Ada, E271, "model__types__type_def_E");
   E269 : Short_Integer; pragma Import (Ada, E269, "model__types__interface_def_E");
   E249 : Short_Integer; pragma Import (Ada, E249, "model__field_E");
   E267 : Short_Integer; pragma Import (Ada, E267, "model__types__class_def_E");
   E262 : Short_Integer; pragma Import (Ada, E262, "model__operation_E");
   E275 : Short_Integer; pragma Import (Ada, E275, "model__project_E");
   E277 : Short_Integer; pragma Import (Ada, E277, "model__root_project_E");
   E222 : Short_Integer; pragma Import (Ada, E222, "string_utils_E");
   E202 : Short_Integer; pragma Import (Ada, E202, "file_io_E");
   E440 : Short_Integer; pragma Import (Ada, E440, "string_vectors_E");
   E436 : Short_Integer; pragma Import (Ada, E436, "templates_parser_tasking_E");
   E322 : Short_Integer; pragma Import (Ada, E322, "zlib_E");
   E326 : Short_Integer; pragma Import (Ada, E326, "zlib__thin_E");
   E289 : Short_Integer; pragma Import (Ada, E289, "templates_parser_E");
   E434 : Short_Integer; pragma Import (Ada, E434, "templates_parser__input_E");
   E424 : Short_Integer; pragma Import (Ada, E424, "templates_parser__utils_E");
   E333 : Short_Integer; pragma Import (Ada, E333, "aws__utils_E");
   E314 : Short_Integer; pragma Import (Ada, E314, "aws__resources_E");
   E318 : Short_Integer; pragma Import (Ada, E318, "aws__resources__streams_E");
   E432 : Short_Integer; pragma Import (Ada, E432, "aws__resources__streams__disk_E");
   E320 : Short_Integer; pragma Import (Ada, E320, "aws__resources__streams__zlib_E");
   E430 : Short_Integer; pragma Import (Ada, E430, "aws__resources__files_E");
   E328 : Short_Integer; pragma Import (Ada, E328, "aws__resources__streams__memory_E");
   E316 : Short_Integer; pragma Import (Ada, E316, "aws__resources__embedded_E");
   E279 : Short_Integer; pragma Import (Ada, E279, "template_E");
   E200 : Short_Integer; pragma Import (Ada, E200, "model_visitor_E");
   E438 : Short_Integer; pragma Import (Ada, E438, "model_visitor__visit_root_project_impl_E");
   E246 : Short_Integer; pragma Import (Ada, E246, "model_visitor__visit_field_impl_E");
   E442 : Short_Integer; pragma Import (Ada, E442, "model_visitor__object_t_test_data_E");
   E446 : Short_Integer; pragma Import (Ada, E446, "model_visitor__object_t_test_data__object_t_tests_E");
   E448 : Short_Integer; pragma Import (Ada, E448, "model_visitor__object_t_test_data__object_t_tests__suite_E");
   E452 : Short_Integer; pragma Import (Ada, E452, "model_visitor__visit_field_impl__test_data_E");
   E454 : Short_Integer; pragma Import (Ada, E454, "model_visitor__visit_field_impl__test_data__tests_E");
   E456 : Short_Integer; pragma Import (Ada, E456, "model_visitor__visit_field_impl__test_data__tests__suite_E");
   E458 : Short_Integer; pragma Import (Ada, E458, "model_visitor__visit_root_project_impl__test_data_E");
   E460 : Short_Integer; pragma Import (Ada, E460, "model_visitor__visit_root_project_impl__test_data__tests_E");
   E462 : Short_Integer; pragma Import (Ada, E462, "model_visitor__visit_root_project_impl__test_data__tests__suite_E");
   E198 : Short_Integer; pragma Import (Ada, E198, "gnattest_main_suite_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      declare
         procedure F1;
         pragma Import (Ada, F1, "model_visitor__visit_root_project_impl__test_data__tests__suite__finalize_body");
      begin
         E462 := E462 - 1;
         F1;
      end;
      E460 := E460 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "model_visitor__visit_root_project_impl__test_data__tests__finalize_spec");
      begin
         F2;
      end;
      E458 := E458 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "model_visitor__visit_root_project_impl__test_data__finalize_spec");
      begin
         F3;
      end;
      declare
         procedure F4;
         pragma Import (Ada, F4, "model_visitor__visit_field_impl__test_data__tests__suite__finalize_body");
      begin
         E456 := E456 - 1;
         F4;
      end;
      E454 := E454 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "model_visitor__visit_field_impl__test_data__tests__finalize_spec");
      begin
         F5;
      end;
      E452 := E452 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "model_visitor__visit_field_impl__test_data__finalize_spec");
      begin
         F6;
      end;
      declare
         procedure F7;
         pragma Import (Ada, F7, "model_visitor__object_t_test_data__object_t_tests__suite__finalize_body");
      begin
         E448 := E448 - 1;
         F7;
      end;
      E446 := E446 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "model_visitor__object_t_test_data__object_t_tests__finalize_spec");
      begin
         F8;
      end;
      E442 := E442 - 1;
      declare
         procedure F9;
         pragma Import (Ada, F9, "model_visitor__object_t_test_data__finalize_spec");
      begin
         F9;
      end;
      E200 := E200 - 1;
      declare
         procedure F10;
         pragma Import (Ada, F10, "model_visitor__finalize_spec");
      begin
         F10;
      end;
      declare
         procedure F11;
         pragma Import (Ada, F11, "template__finalize_body");
      begin
         E279 := E279 - 1;
         F11;
      end;
      declare
         procedure F12;
         pragma Import (Ada, F12, "template__finalize_spec");
      begin
         F12;
      end;
      declare
         procedure F13;
         pragma Import (Ada, F13, "aws__resources__embedded__finalize_body");
      begin
         E316 := E316 - 1;
         F13;
      end;
      E328 := E328 - 1;
      declare
         procedure F14;
         pragma Import (Ada, F14, "aws__resources__streams__memory__finalize_spec");
      begin
         F14;
      end;
      declare
         procedure F15;
         pragma Import (Ada, F15, "templates_parser__finalize_body");
      begin
         E289 := E289 - 1;
         F15;
      end;
      E333 := E333 - 1;
      E318 := E318 - 1;
      E320 := E320 - 1;
      declare
         procedure F16;
         pragma Import (Ada, F16, "aws__resources__streams__zlib__finalize_spec");
      begin
         F16;
      end;
      E432 := E432 - 1;
      declare
         procedure F17;
         pragma Import (Ada, F17, "aws__resources__streams__disk__finalize_spec");
      begin
         F17;
      end;
      declare
         procedure F18;
         pragma Import (Ada, F18, "aws__resources__streams__finalize_spec");
      begin
         F18;
      end;
      declare
         procedure F19;
         pragma Import (Ada, F19, "aws__utils__finalize_spec");
      begin
         F19;
      end;
      declare
         procedure F20;
         pragma Import (Ada, F20, "templates_parser__finalize_spec");
      begin
         F20;
      end;
      E322 := E322 - 1;
      declare
         procedure F21;
         pragma Import (Ada, F21, "zlib__finalize_spec");
      begin
         F21;
      end;
      declare
         procedure F22;
         pragma Import (Ada, F22, "templates_parser_tasking__finalize_body");
      begin
         E436 := E436 - 1;
         F22;
      end;
      E222 := E222 - 1;
      declare
         procedure F23;
         pragma Import (Ada, F23, "string_utils__finalize_spec");
      begin
         F23;
      end;
      declare
         procedure F24;
         pragma Import (Ada, F24, "model__root_project__finalize_body");
      begin
         E277 := E277 - 1;
         F24;
      end;
      declare
         procedure F25;
         pragma Import (Ada, F25, "model__root_project__finalize_spec");
      begin
         F25;
      end;
      declare
         procedure F26;
         pragma Import (Ada, F26, "model__project__finalize_body");
      begin
         E275 := E275 - 1;
         F26;
      end;
      declare
         procedure F27;
         pragma Import (Ada, F27, "model__project__finalize_spec");
      begin
         F27;
      end;
      declare
         procedure F28;
         pragma Import (Ada, F28, "model__operation__finalize_body");
      begin
         E262 := E262 - 1;
         F28;
      end;
      declare
         procedure F29;
         pragma Import (Ada, F29, "model__operation__finalize_spec");
      begin
         F29;
      end;
      declare
         procedure F30;
         pragma Import (Ada, F30, "model__field__finalize_body");
      begin
         E249 := E249 - 1;
         F30;
      end;
      declare
         procedure F31;
         pragma Import (Ada, F31, "model__types__class_def__finalize_body");
      begin
         E267 := E267 - 1;
         F31;
      end;
      declare
         procedure F32;
         pragma Import (Ada, F32, "model__types__class_def__finalize_spec");
      begin
         F32;
      end;
      declare
         procedure F33;
         pragma Import (Ada, F33, "model__field__finalize_spec");
      begin
         F33;
      end;
      declare
         procedure F34;
         pragma Import (Ada, F34, "model__types__interface_def__finalize_body");
      begin
         E269 := E269 - 1;
         F34;
      end;
      declare
         procedure F35;
         pragma Import (Ada, F35, "model__types__interface_def__finalize_spec");
      begin
         F35;
      end;
      E271 := E271 - 1;
      declare
         procedure F36;
         pragma Import (Ada, F36, "model__types__type_def__finalize_spec");
      begin
         F36;
      end;
      declare
         procedure F37;
         pragma Import (Ada, F37, "model__parameter__finalize_body");
      begin
         E273 := E273 - 1;
         F37;
      end;
      declare
         procedure F38;
         pragma Import (Ada, F38, "model__parameter__finalize_spec");
      begin
         F38;
      end;
      declare
         procedure F39;
         pragma Import (Ada, F39, "model__package_def__finalize_body");
      begin
         E264 := E264 - 1;
         F39;
      end;
      declare
         procedure F40;
         pragma Import (Ada, F40, "model__package_def__finalize_spec");
      begin
         F40;
      end;
      declare
         procedure F41;
         pragma Import (Ada, F41, "model__namespace__finalize_body");
      begin
         E251 := E251 - 1;
         F41;
      end;
      declare
         procedure F42;
         pragma Import (Ada, F42, "model__namespace__finalize_spec");
      begin
         F42;
      end;
      declare
         procedure F43;
         pragma Import (Ada, F43, "model__dependency__finalize_body");
      begin
         E260 := E260 - 1;
         F43;
      end;
      declare
         procedure F44;
         pragma Import (Ada, F44, "model__dependency__finalize_spec");
      begin
         F44;
      end;
      declare
         procedure F45;
         pragma Import (Ada, F45, "model__visitor__finalize_spec");
      begin
         E258 := E258 - 1;
         F45;
      end;
      E253 := E253 - 1;
      declare
         procedure F46;
         pragma Import (Ada, F46, "model__named_element__finalize_spec");
      begin
         F46;
      end;
      E255 := E255 - 1;
      declare
         procedure F47;
         pragma Import (Ada, F47, "model__comment__finalize_body");
      begin
         E257 := E257 - 1;
         F47;
      end;
      declare
         procedure F48;
         pragma Import (Ada, F48, "model__comment__finalize_spec");
      begin
         F48;
      end;
      declare
         procedure F49;
         pragma Import (Ada, F49, "model__element__finalize_spec");
      begin
         F49;
      end;
      E159 := E159 - 1;
      declare
         procedure F50;
         pragma Import (Ada, F50, "aunit__test_suites__finalize_spec");
      begin
         F50;
      end;
      E444 := E444 - 1;
      declare
         procedure F51;
         pragma Import (Ada, F51, "aunit__test_fixtures__finalize_spec");
      begin
         F51;
      end;
      E151 := E151 - 1;
      declare
         procedure F52;
         pragma Import (Ada, F52, "aunit__reporter__gnattest__finalize_spec");
      begin
         F52;
      end;
      E110 := E110 - 1;
      E112 := E112 - 1;
      declare
         procedure F53;
         pragma Import (Ada, F53, "aunit__simple_test_cases__finalize_spec");
      begin
         F53;
      end;
      declare
         procedure F54;
         pragma Import (Ada, F54, "aunit__test_filters__finalize_spec");
      begin
         F54;
      end;
      E114 := E114 - 1;
      declare
         procedure F55;
         pragma Import (Ada, F55, "aunit__assertions__finalize_spec");
      begin
         F55;
      end;
      E121 := E121 - 1;
      declare
         procedure F56;
         pragma Import (Ada, F56, "aunit__test_results__finalize_spec");
      begin
         F56;
      end;
      declare
         procedure F57;
         pragma Import (Ada, F57, "aunit__tests__finalize_spec");
      begin
         E128 := E128 - 1;
         F57;
      end;
      E395 := E395 - 1;
      declare
         procedure F58;
         pragma Import (Ada, F58, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F58;
      end;
      E204 := E204 - 1;
      declare
         procedure F59;
         pragma Import (Ada, F59, "ada__directories__finalize_spec");
      begin
         F59;
      end;
      E194 := E194 - 1;
      declare
         procedure F60;
         pragma Import (Ada, F60, "system__regexp__finalize_spec");
      begin
         F60;
      end;
      E141 := E141 - 1;
      declare
         procedure F61;
         pragma Import (Ada, F61, "system__pool_global__finalize_spec");
      begin
         F61;
      end;
      E177 := E177 - 1;
      declare
         procedure F62;
         pragma Import (Ada, F62, "ada__text_io__finalize_spec");
      begin
         F62;
      end;
      E163 := E163 - 1;
      declare
         procedure F63;
         pragma Import (Ada, F63, "ada__strings__unbounded__finalize_spec");
      begin
         F63;
      end;
      E169 := E169 - 1;
      declare
         procedure F64;
         pragma Import (Ada, F64, "system__storage_pools__subpools__finalize_spec");
      begin
         F64;
      end;
      E130 := E130 - 1;
      declare
         procedure F65;
         pragma Import (Ada, F65, "system__finalization_masters__finalize_spec");
      begin
         F65;
      end;
      E240 := E240 - 1;
      declare
         procedure F66;
         pragma Import (Ada, F66, "ada__streams__stream_io__finalize_spec");
      begin
         F66;
      end;
      declare
         procedure F67;
         pragma Import (Ada, F67, "system__file_io__finalize_body");
      begin
         E181 := E181 - 1;
         F67;
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
      WC_Encoding := 'b';
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
           False, False, True, False, True, False, False, False, 
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
      E019 := E019 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E068 := E068 + 1;
      Ada.Strings'Elab_Spec;
      E053 := E053 + 1;
      Ada.Containers'Elab_Spec;
      E036 := E036 + 1;
      System.Exceptions'Elab_Spec;
      E021 := E021 + 1;
      System.Os_Lib'Elab_Body;
      E073 := E073 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E059 := E059 + 1;
      Interfaces.C'Elab_Spec;
      System.Soft_Links'Elab_Body;
      E013 := E013 + 1;
      System.Secondary_Stack'Elab_Body;
      E009 := E009 + 1;
      E055 := E055 + 1;
      E041 := E041 + 1;
      System.Object_Reader'Elab_Spec;
      System.Dwarf_Lines'Elab_Spec;
      E048 := E048 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E035 := E035 + 1;
      E079 := E079 + 1;
      Ada.Numerics'Elab_Spec;
      E348 := E348 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E104 := E104 + 1;
      Ada.Streams'Elab_Spec;
      E135 := E135 + 1;
      Interfaces.C.Strings'Elab_Spec;
      E324 := E324 + 1;
      System.File_Control_Block'Elab_Spec;
      E182 := E182 + 1;
      System.Finalization_Root'Elab_Spec;
      E137 := E137 + 1;
      Ada.Finalization'Elab_Spec;
      E133 := E133 + 1;
      System.File_Io'Elab_Body;
      E181 := E181 + 1;
      Ada.Streams.Stream_Io'Elab_Spec;
      E240 := E240 + 1;
      System.Storage_Pools'Elab_Spec;
      E139 := E139 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E130 := E130 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      E169 := E169 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E163 := E163 + 1;
      System.Task_Info'Elab_Spec;
      E371 := E371 + 1;
      System.Task_Primitives.Operations'Elab_Body;
      E365 := E365 + 1;
      System.Regpat'Elab_Spec;
      E308 := E308 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E125 := E125 + 1;
      Ada.Calendar.Time_Zones'Elab_Spec;
      E208 := E208 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E177 := E177 + 1;
      Gnat.Calendar'Elab_Spec;
      E298 := E298 + 1;
      Gnat.Calendar.Time_Io'Elab_Spec;
      E301 := E301 + 1;
      Gnat.Directory_Operations'Elab_Spec;
      Gnat.Directory_Operations'Elab_Body;
      E184 := E184 + 1;
      System.Assertions'Elab_Spec;
      E232 := E232 + 1;
      System.Pool_Global'Elab_Spec;
      E141 := E141 + 1;
      System.Random_Seed'Elab_Body;
      E416 := E416 + 1;
      System.Regexp'Elab_Spec;
      E194 := E194 + 1;
      Ada.Directories'Elab_Spec;
      Ada.Directories'Elab_Body;
      E204 := E204 + 1;
      Gnat.Command_Line'Elab_Spec;
      Gnat.Command_Line'Elab_Body;
      E161 := E161 + 1;
      System.Tasking.Initialization'Elab_Body;
      E381 := E381 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E391 := E391 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E395 := E395 + 1;
      System.Tasking.Queuing'Elab_Body;
      E389 := E389 + 1;
      E101 := E101 + 1;
      E099 := E099 + 1;
      E119 := E119 + 1;
      E117 := E117 + 1;
      Aunit.Tests'Elab_Spec;
      E128 := E128 + 1;
      Aunit.Time_Measure'Elab_Spec;
      E123 := E123 + 1;
      Aunit.Test_Results'Elab_Spec;
      E121 := E121 + 1;
      Aunit.Assertions'Elab_Spec;
      Aunit.Assertions'Elab_Body;
      E114 := E114 + 1;
      Aunit.Test_Filters'Elab_Spec;
      Aunit.Simple_Test_Cases'Elab_Spec;
      E112 := E112 + 1;
      E110 := E110 + 1;
      Aunit.Reporter'Elab_Spec;
      E149 := E149 + 1;
      Aunit.Reporter.Gnattest'Elab_Spec;
      E151 := E151 + 1;
      Aunit.Test_Fixtures'Elab_Spec;
      E444 := E444 + 1;
      E450 := E450 + 1;
      Aunit.Test_Suites'Elab_Spec;
      E159 := E159 + 1;
      E157 := E157 + 1;
      E428 := E428 + 1;
      Model.Element'Elab_Spec;
      Model.Comment'Elab_Spec;
      Model.Comment'Elab_Body;
      E257 := E257 + 1;
      Model.Element'Elab_Body;
      E255 := E255 + 1;
      Model.Named_Element'Elab_Spec;
      E253 := E253 + 1;
      Model.Visitor'Elab_Spec;
      E258 := E258 + 1;
      Model.Dependency'Elab_Spec;
      Model.Dependency'Elab_Body;
      E260 := E260 + 1;
      Model.Namespace'Elab_Spec;
      Model.Namespace'Elab_Body;
      E251 := E251 + 1;
      Model.Package_Def'Elab_Spec;
      Model.Package_Def'Elab_Body;
      E264 := E264 + 1;
      Model.Parameter'Elab_Spec;
      Model.Parameter'Elab_Body;
      E273 := E273 + 1;
      Model.Types.Type_Def'Elab_Spec;
      E271 := E271 + 1;
      Model.Types.Interface_Def'Elab_Spec;
      Model.Types.Interface_Def'Elab_Body;
      E269 := E269 + 1;
      Model.Field'Elab_Spec;
      Model.Types.Class_Def'Elab_Spec;
      Model.Types.Class_Def'Elab_Body;
      E267 := E267 + 1;
      Model.Field'Elab_Body;
      E249 := E249 + 1;
      Model.Operation'Elab_Spec;
      Model.Operation'Elab_Body;
      E262 := E262 + 1;
      Model.Project'Elab_Spec;
      Model.Project'Elab_Body;
      E275 := E275 + 1;
      Model.Root_Project'Elab_Spec;
      Model.Root_Project'Elab_Body;
      E277 := E277 + 1;
      String_Utils'Elab_Spec;
      E222 := E222 + 1;
      File_Io'Elab_Body;
      E202 := E202 + 1;
      String_Vectors'Elab_Spec;
      E440 := E440 + 1;
      Templates_Parser_Tasking'Elab_Body;
      E436 := E436 + 1;
      Zlib'Elab_Spec;
      Zlib.Thin'Elab_Body;
      E326 := E326 + 1;
      Zlib'Elab_Body;
      E322 := E322 + 1;
      Templates_Parser'Elab_Spec;
      Templates_Parser.Input'Elab_Spec;
      Templates_Parser.Utils'Elab_Spec;
      E424 := E424 + 1;
      AWS.UTILS'ELAB_SPEC;
      AWS.RESOURCES'ELAB_SPEC;
      AWS.RESOURCES.STREAMS'ELAB_SPEC;
      AWS.RESOURCES.STREAMS.DISK'ELAB_SPEC;
      AWS.RESOURCES.STREAMS.DISK'ELAB_BODY;
      E432 := E432 + 1;
      AWS.RESOURCES.STREAMS.ZLIB'ELAB_SPEC;
      AWS.RESOURCES.STREAMS.ZLIB'ELAB_BODY;
      E320 := E320 + 1;
      AWS.RESOURCES.STREAMS'ELAB_BODY;
      E318 := E318 + 1;
      AWS.UTILS'ELAB_BODY;
      E333 := E333 + 1;
      E434 := E434 + 1;
      Templates_Parser'Elab_Body;
      E289 := E289 + 1;
      E430 := E430 + 1;
      AWS.RESOURCES.STREAMS.MEMORY'ELAB_SPEC;
      AWS.RESOURCES.STREAMS.MEMORY'ELAB_BODY;
      E328 := E328 + 1;
      AWS.RESOURCES.EMBEDDED'ELAB_BODY;
      E316 := E316 + 1;
      E314 := E314 + 1;
      Template'Elab_Spec;
      Template'Elab_Body;
      E279 := E279 + 1;
      Model_Visitor'Elab_Spec;
      Model_Visitor.Visit_Root_Project_Impl'Elab_Spec;
      E438 := E438 + 1;
      Model_Visitor.Visit_Field_Impl'Elab_Spec;
      E246 := E246 + 1;
      Model_Visitor'Elab_Body;
      E200 := E200 + 1;
      Model_Visitor.Object_T_Test_Data'Elab_Spec;
      Model_Visitor.Object_T_Test_Data'Elab_Body;
      E442 := E442 + 1;
      Model_Visitor.Object_T_Test_Data.Object_T_Tests'Elab_Spec;
      Model_Visitor.Object_T_Test_Data.Object_T_Tests'Elab_Body;
      E446 := E446 + 1;
      Model_Visitor.Object_T_Test_Data.Object_T_Tests.Suite'Elab_Body;
      E448 := E448 + 1;
      Model_Visitor.Visit_Field_Impl.Test_Data'Elab_Spec;
      Model_Visitor.Visit_Field_Impl.Test_Data'Elab_Body;
      E452 := E452 + 1;
      Model_Visitor.Visit_Field_Impl.Test_Data.Tests'Elab_Spec;
      Model_Visitor.Visit_Field_Impl.Test_Data.Tests'Elab_Body;
      E454 := E454 + 1;
      Model_Visitor.Visit_Field_Impl.Test_Data.Tests.Suite'Elab_Body;
      E456 := E456 + 1;
      Model_Visitor.Visit_Root_Project_Impl.Test_Data'Elab_Spec;
      Model_Visitor.Visit_Root_Project_Impl.Test_Data'Elab_Body;
      E458 := E458 + 1;
      Model_Visitor.Visit_Root_Project_Impl.Test_Data.Tests'Elab_Spec;
      Model_Visitor.Visit_Root_Project_Impl.Test_Data.Tests'Elab_Body;
      E460 := E460 + 1;
      Model_Visitor.Visit_Root_Project_Impl.Test_Data.Tests.Suite'Elab_Body;
      E462 := E462 + 1;
      Gnattest_Main_Suite'Elab_Body;
      E198 := E198 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_test_runner");

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
   --   /home/jeremy/workspace/ada/code_generator/src/project_output/obj/gnattest_harness/gnattest_generated.o
   --   /home/jeremy/workspace/ada/code_generator/src/project_output/obj/gnattest_harness/model_visitor-object_t_test_data.o
   --   /home/jeremy/workspace/ada/code_generator/src/project_output/obj/gnattest_harness/model_visitor-object_t_test_data-object_t_tests.o
   --   /home/jeremy/workspace/ada/code_generator/src/project_output/obj/gnattest_harness/model_visitor-object_t_test_data-object_t_tests-suite.o
   --   /home/jeremy/workspace/ada/code_generator/src/project_output/obj/gnattest_harness/model_visitor-visit_field_impl-test_data.o
   --   /home/jeremy/workspace/ada/code_generator/src/project_output/obj/gnattest_harness/model_visitor-visit_field_impl-test_data-tests.o
   --   /home/jeremy/workspace/ada/code_generator/src/project_output/obj/gnattest_harness/model_visitor-visit_field_impl-test_data-tests-suite.o
   --   /home/jeremy/workspace/ada/code_generator/src/project_output/obj/gnattest_harness/model_visitor-visit_root_project_impl-test_data.o
   --   /home/jeremy/workspace/ada/code_generator/src/project_output/obj/gnattest_harness/model_visitor-visit_root_project_impl-test_data-tests.o
   --   /home/jeremy/workspace/ada/code_generator/src/project_output/obj/gnattest_harness/model_visitor-visit_root_project_impl-test_data-tests-suite.o
   --   /home/jeremy/workspace/ada/code_generator/src/project_output/obj/gnattest_harness/gnattest_main_suite.o
   --   /home/jeremy/workspace/ada/code_generator/src/project_output/obj/gnattest_harness/test_runner.o
   --   -L/home/jeremy/workspace/ada/code_generator/src/project_output/obj/gnattest_harness/
   --   -L/home/jeremy/workspace/ada/code_generator/src/project_output/obj/gnattest_harness/
   --   -L/usr/gnat/lib/aunit/
   --   -L/home/jeremy/workspace/ada/code_generator/src/project_output/lib/
   --   -L/home/jeremy/workspace/ada/code_generator/src/project_loader/lib/
   --   -L/usr/gnat/lib/opentoken/
   --   -L/home/jeremy/workspace/ada/code_generator/src/model/lib/
   --   -L/home/jeremy/workspace/ada/code_generator/utils/string_utils/lib/
   --   -L/home/jeremy/workspace/ada/code_generator/utils/template/lib/
   --   -L/usr/gnat/lib/aws/
   --   -L/usr/gnat/lib/xmlada/xmlada_schema.static/
   --   -L/usr/gnat/lib/xmlada/xmlada_sax.static/
   --   -L/usr/gnat/lib/xmlada/xmlada_unicode.static/
   --   -L/usr/gnat/lib/xmlada/xmlada_input.static/
   --   -L/usr/gnat/lib/xmlada/xmlada_dom.static/
   --   -L/home/jeremy/workspace/ada/code_generator/utils/file_io/lib/
   --   -L/usr/gnat/lib/gcc/x86_64-pc-linux-gnu/6.3.1/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
   --   -lpthread
   --   -lrt
   --   -ldl
--  END Object file/option list   

end ada_main;
