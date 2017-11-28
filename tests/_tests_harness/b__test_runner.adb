pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__test_runner.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__test_runner.adb");
pragma Suppress (Overflow_Check);
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
   E104 : Short_Integer; pragma Import (Ada, E104, "ada__tags_E");
   E135 : Short_Integer; pragma Import (Ada, E135, "ada__streams_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "system__file_control_block_E");
   E137 : Short_Integer; pragma Import (Ada, E137, "system__finalization_root_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "ada__finalization_E");
   E181 : Short_Integer; pragma Import (Ada, E181, "system__file_io_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "system__storage_pools_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "system__finalization_masters_E");
   E169 : Short_Integer; pragma Import (Ada, E169, "system__storage_pools__subpools_E");
   E163 : Short_Integer; pragma Import (Ada, E163, "ada__strings__unbounded_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "ada__calendar_E");
   E177 : Short_Integer; pragma Import (Ada, E177, "ada__text_io_E");
   E184 : Short_Integer; pragma Import (Ada, E184, "gnat__directory_operations_E");
   E224 : Short_Integer; pragma Import (Ada, E224, "system__assertions_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "system__pool_global_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "system__regexp_E");
   E161 : Short_Integer; pragma Import (Ada, E161, "gnat__command_line_E");
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
   E220 : Short_Integer; pragma Import (Ada, E220, "aunit__test_fixtures_E");
   E230 : Short_Integer; pragma Import (Ada, E230, "aunit__test_caller_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "aunit__test_suites_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "aunit__run_E");
   E205 : Short_Integer; pragma Import (Ada, E205, "model__element_E");
   E201 : Short_Integer; pragma Import (Ada, E201, "model__comment_E");
   E232 : Short_Integer; pragma Import (Ada, E232, "model__comment__test_data_E");
   E234 : Short_Integer; pragma Import (Ada, E234, "model__comment__test_data__tests_E");
   E236 : Short_Integer; pragma Import (Ada, E236, "model__comment__test_data__tests__suite_E");
   E218 : Short_Integer; pragma Import (Ada, E218, "model__element__object_t_test_data_E");
   E222 : Short_Integer; pragma Import (Ada, E222, "model__element__object_t_test_data__object_t_tests_E");
   E238 : Short_Integer; pragma Import (Ada, E238, "model__element__test_data_E");
   E240 : Short_Integer; pragma Import (Ada, E240, "model__element__test_data__tests_E");
   E242 : Short_Integer; pragma Import (Ada, E242, "model__element__test_data__tests__suite_E");
   E215 : Short_Integer; pragma Import (Ada, E215, "model__named_element_E");
   E213 : Short_Integer; pragma Import (Ada, E213, "model__parameter_E");
   E209 : Short_Integer; pragma Import (Ada, E209, "fixtures_E");
   E207 : Short_Integer; pragma Import (Ada, E207, "model__comment__object_t_test_data_E");
   E226 : Short_Integer; pragma Import (Ada, E226, "model__comment__object_t_test_data__object_t_tests_E");
   E228 : Short_Integer; pragma Import (Ada, E228, "model__comment__object_t_test_data__object_t_tests__suite_E");
   E198 : Short_Integer; pragma Import (Ada, E198, "gnattest_main_suite_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      declare
         procedure F1;
         pragma Import (Ada, F1, "model__comment__object_t_test_data__object_t_tests__suite__finalize_body");
      begin
         E228 := E228 - 1;
         F1;
      end;
      E226 := E226 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "model__comment__object_t_test_data__object_t_tests__finalize_spec");
      begin
         F2;
      end;
      declare
         procedure F3;
         pragma Import (Ada, F3, "model__comment__object_t_test_data__finalize_body");
      begin
         E207 := E207 - 1;
         F3;
      end;
      declare
         procedure F4;
         pragma Import (Ada, F4, "model__comment__object_t_test_data__finalize_spec");
      begin
         F4;
      end;
      declare
         procedure F5;
         pragma Import (Ada, F5, "model__parameter__finalize_body");
      begin
         E213 := E213 - 1;
         F5;
      end;
      declare
         procedure F6;
         pragma Import (Ada, F6, "model__parameter__finalize_spec");
      begin
         F6;
      end;
      E215 := E215 - 1;
      declare
         procedure F7;
         pragma Import (Ada, F7, "model__named_element__finalize_spec");
      begin
         F7;
      end;
      declare
         procedure F8;
         pragma Import (Ada, F8, "model__element__test_data__tests__suite__finalize_body");
      begin
         E242 := E242 - 1;
         F8;
      end;
      E240 := E240 - 1;
      declare
         procedure F9;
         pragma Import (Ada, F9, "model__element__test_data__tests__finalize_spec");
      begin
         F9;
      end;
      E238 := E238 - 1;
      declare
         procedure F10;
         pragma Import (Ada, F10, "model__element__test_data__finalize_spec");
      begin
         F10;
      end;
      declare
         procedure F11;
         pragma Import (Ada, F11, "model__element__object_t_test_data__finalize_spec");
      begin
         E218 := E218 - 1;
         F11;
      end;
      declare
         procedure F12;
         pragma Import (Ada, F12, "model__comment__test_data__tests__suite__finalize_body");
      begin
         E236 := E236 - 1;
         F12;
      end;
      E234 := E234 - 1;
      declare
         procedure F13;
         pragma Import (Ada, F13, "model__comment__test_data__tests__finalize_spec");
      begin
         F13;
      end;
      E232 := E232 - 1;
      declare
         procedure F14;
         pragma Import (Ada, F14, "model__comment__test_data__finalize_spec");
      begin
         F14;
      end;
      E205 := E205 - 1;
      declare
         procedure F15;
         pragma Import (Ada, F15, "model__comment__finalize_body");
      begin
         E201 := E201 - 1;
         F15;
      end;
      declare
         procedure F16;
         pragma Import (Ada, F16, "model__comment__finalize_spec");
      begin
         F16;
      end;
      declare
         procedure F17;
         pragma Import (Ada, F17, "model__element__finalize_spec");
      begin
         F17;
      end;
      E159 := E159 - 1;
      declare
         procedure F18;
         pragma Import (Ada, F18, "aunit__test_suites__finalize_spec");
      begin
         F18;
      end;
      E220 := E220 - 1;
      declare
         procedure F19;
         pragma Import (Ada, F19, "aunit__test_fixtures__finalize_spec");
      begin
         F19;
      end;
      E151 := E151 - 1;
      declare
         procedure F20;
         pragma Import (Ada, F20, "aunit__reporter__gnattest__finalize_spec");
      begin
         F20;
      end;
      E110 := E110 - 1;
      E112 := E112 - 1;
      declare
         procedure F21;
         pragma Import (Ada, F21, "aunit__simple_test_cases__finalize_spec");
      begin
         F21;
      end;
      declare
         procedure F22;
         pragma Import (Ada, F22, "aunit__test_filters__finalize_spec");
      begin
         F22;
      end;
      E114 := E114 - 1;
      declare
         procedure F23;
         pragma Import (Ada, F23, "aunit__assertions__finalize_spec");
      begin
         F23;
      end;
      E121 := E121 - 1;
      declare
         procedure F24;
         pragma Import (Ada, F24, "aunit__test_results__finalize_spec");
      begin
         F24;
      end;
      declare
         procedure F25;
         pragma Import (Ada, F25, "aunit__tests__finalize_spec");
      begin
         E128 := E128 - 1;
         F25;
      end;
      E194 := E194 - 1;
      declare
         procedure F26;
         pragma Import (Ada, F26, "system__regexp__finalize_spec");
      begin
         F26;
      end;
      E141 := E141 - 1;
      declare
         procedure F27;
         pragma Import (Ada, F27, "system__pool_global__finalize_spec");
      begin
         F27;
      end;
      E177 := E177 - 1;
      declare
         procedure F28;
         pragma Import (Ada, F28, "ada__text_io__finalize_spec");
      begin
         F28;
      end;
      E163 := E163 - 1;
      declare
         procedure F29;
         pragma Import (Ada, F29, "ada__strings__unbounded__finalize_spec");
      begin
         F29;
      end;
      E169 := E169 - 1;
      declare
         procedure F30;
         pragma Import (Ada, F30, "system__storage_pools__subpools__finalize_spec");
      begin
         F30;
      end;
      E130 := E130 - 1;
      declare
         procedure F31;
         pragma Import (Ada, F31, "system__finalization_masters__finalize_spec");
      begin
         F31;
      end;
      declare
         procedure F32;
         pragma Import (Ada, F32, "system__file_io__finalize_body");
      begin
         E181 := E181 - 1;
         F32;
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
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E104 := E104 + 1;
      Ada.Streams'Elab_Spec;
      E135 := E135 + 1;
      System.File_Control_Block'Elab_Spec;
      E182 := E182 + 1;
      System.Finalization_Root'Elab_Spec;
      E137 := E137 + 1;
      Ada.Finalization'Elab_Spec;
      E133 := E133 + 1;
      System.File_Io'Elab_Body;
      E181 := E181 + 1;
      System.Storage_Pools'Elab_Spec;
      E139 := E139 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E130 := E130 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      E169 := E169 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E163 := E163 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E125 := E125 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E177 := E177 + 1;
      Gnat.Directory_Operations'Elab_Spec;
      Gnat.Directory_Operations'Elab_Body;
      E184 := E184 + 1;
      System.Assertions'Elab_Spec;
      E224 := E224 + 1;
      System.Pool_Global'Elab_Spec;
      E141 := E141 + 1;
      System.Regexp'Elab_Spec;
      E194 := E194 + 1;
      Gnat.Command_Line'Elab_Spec;
      Gnat.Command_Line'Elab_Body;
      E161 := E161 + 1;
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
      E220 := E220 + 1;
      E230 := E230 + 1;
      Aunit.Test_Suites'Elab_Spec;
      E159 := E159 + 1;
      E157 := E157 + 1;
      Model.Element'Elab_Spec;
      Model.Comment'Elab_Spec;
      Model.Comment'Elab_Body;
      E201 := E201 + 1;
      Model.Element'Elab_Body;
      E205 := E205 + 1;
      Model.Comment.Test_Data'Elab_Spec;
      Model.Comment.Test_Data'Elab_Body;
      E232 := E232 + 1;
      Model.Comment.Test_Data.Tests'Elab_Spec;
      Model.Comment.Test_Data.Tests'Elab_Body;
      E234 := E234 + 1;
      Model.Comment.Test_Data.Tests.Suite'Elab_Body;
      E236 := E236 + 1;
      Model.Element.Object_T_Test_Data'Elab_Spec;
      E218 := E218 + 1;
      Model.Element.Object_T_Test_Data.Object_T_Tests'Elab_Spec;
      Model.Element.Object_T_Test_Data.Object_T_Tests'Elab_Body;
      E222 := E222 + 1;
      Model.Element.Test_Data'Elab_Spec;
      Model.Element.Test_Data'Elab_Body;
      E238 := E238 + 1;
      Model.Element.Test_Data.Tests'Elab_Spec;
      Model.Element.Test_Data.Tests'Elab_Body;
      E240 := E240 + 1;
      Model.Element.Test_Data.Tests.Suite'Elab_Body;
      E242 := E242 + 1;
      Model.Named_Element'Elab_Spec;
      Model.Named_Element'Elab_Body;
      E215 := E215 + 1;
      Model.Parameter'Elab_Spec;
      Model.Parameter'Elab_Body;
      E213 := E213 + 1;
      E209 := E209 + 1;
      Model.Comment.Object_T_Test_Data'Elab_Spec;
      Model.Comment.Object_T_Test_Data'Elab_Body;
      E207 := E207 + 1;
      Model.Comment.Object_T_Test_Data.Object_T_Tests'Elab_Spec;
      Model.Comment.Object_T_Test_Data.Object_T_Tests'Elab_Body;
      E226 := E226 + 1;
      Model.Comment.Object_T_Test_Data.Object_T_Tests.Suite'Elab_Body;
      E228 := E228 + 1;
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
   --   /home/jeremy/workspace/ada/code_generator/tests/_tests_harness/gnattest_generated.o
   --   /home/jeremy/workspace/ada/code_generator/tests/obj/model.o
   --   /home/jeremy/workspace/ada/code_generator/tests/obj/model-comment.o
   --   /home/jeremy/workspace/ada/code_generator/tests/obj/model-element.o
   --   /home/jeremy/workspace/ada/code_generator/tests/_tests_harness/model-comment-test_data.o
   --   /home/jeremy/workspace/ada/code_generator/tests/_tests_harness/model-comment-test_data-tests.o
   --   /home/jeremy/workspace/ada/code_generator/tests/_tests_harness/model-comment-test_data-tests-suite.o
   --   /home/jeremy/workspace/ada/code_generator/tests/_tests_harness/model-element-object_t_test_data.o
   --   /home/jeremy/workspace/ada/code_generator/tests/_tests_harness/model-element-object_t_test_data-object_t_tests.o
   --   /home/jeremy/workspace/ada/code_generator/tests/_tests_harness/model-element-test_data.o
   --   /home/jeremy/workspace/ada/code_generator/tests/_tests_harness/model-element-test_data-tests.o
   --   /home/jeremy/workspace/ada/code_generator/tests/_tests_harness/model-element-test_data-tests-suite.o
   --   /home/jeremy/workspace/ada/code_generator/tests/obj/model-named_element.o
   --   /home/jeremy/workspace/ada/code_generator/tests/obj/model-parameter.o
   --   /home/jeremy/workspace/ada/code_generator/tests/_tests_harness/fixtures.o
   --   /home/jeremy/workspace/ada/code_generator/tests/_tests_harness/model-comment-object_t_test_data.o
   --   /home/jeremy/workspace/ada/code_generator/tests/_tests_harness/model-comment-object_t_test_data-object_t_tests.o
   --   /home/jeremy/workspace/ada/code_generator/tests/_tests_harness/model-comment-object_t_test_data-object_t_tests-suite.o
   --   /home/jeremy/workspace/ada/code_generator/tests/_tests_harness/gnattest_main_suite.o
   --   /home/jeremy/workspace/ada/code_generator/tests/_tests_harness/test_runner.o
   --   -L/home/jeremy/workspace/ada/code_generator/tests/_tests_harness/
   --   -L/home/jeremy/workspace/ada/code_generator/tests/_tests_harness/
   --   -L/usr/gnat/lib/aunit/
   --   -L/home/jeremy/workspace/ada/code_generator/tests/obj/
   --   -L/usr/gnat/lib/gcc/x86_64-pc-linux-gnu/6.3.1/adalib/
   --   -static
   --   -lgnat
   --   -ldl
--  END Object file/option list   

end ada_main;
