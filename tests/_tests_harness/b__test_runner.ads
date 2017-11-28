pragma Warnings (Off);
pragma Ada_95;
with System;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: GPL 2017 (20170515-63)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_test_runner" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#c6d11a9a#;
   pragma Export (C, u00001, "test_runnerB");
   u00002 : constant Version_32 := 16#b6df930e#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#5bd3bf5d#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#6ada90f8#;
   pragma Export (C, u00005, "ada__command_lineB");
   u00006 : constant Version_32 := 16#3cdef8c9#;
   pragma Export (C, u00006, "ada__command_lineS");
   u00007 : constant Version_32 := 16#6326c08a#;
   pragma Export (C, u00007, "systemS");
   u00008 : constant Version_32 := 16#30ad09e5#;
   pragma Export (C, u00008, "system__secondary_stackB");
   u00009 : constant Version_32 := 16#d9b43ff0#;
   pragma Export (C, u00009, "system__secondary_stackS");
   u00010 : constant Version_32 := 16#b01dad17#;
   pragma Export (C, u00010, "system__parametersB");
   u00011 : constant Version_32 := 16#1d0ccdf5#;
   pragma Export (C, u00011, "system__parametersS");
   u00012 : constant Version_32 := 16#4e7785b8#;
   pragma Export (C, u00012, "system__soft_linksB");
   u00013 : constant Version_32 := 16#fda218df#;
   pragma Export (C, u00013, "system__soft_linksS");
   u00014 : constant Version_32 := 16#a7c91b43#;
   pragma Export (C, u00014, "ada__exceptionsB");
   u00015 : constant Version_32 := 16#4b8b8db1#;
   pragma Export (C, u00015, "ada__exceptionsS");
   u00016 : constant Version_32 := 16#e947e6a9#;
   pragma Export (C, u00016, "ada__exceptions__last_chance_handlerB");
   u00017 : constant Version_32 := 16#41e5552e#;
   pragma Export (C, u00017, "ada__exceptions__last_chance_handlerS");
   u00018 : constant Version_32 := 16#87a448ff#;
   pragma Export (C, u00018, "system__exception_tableB");
   u00019 : constant Version_32 := 16#3e88a9c8#;
   pragma Export (C, u00019, "system__exception_tableS");
   u00020 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00020, "system__exceptionsB");
   u00021 : constant Version_32 := 16#0b45ad7c#;
   pragma Export (C, u00021, "system__exceptionsS");
   u00022 : constant Version_32 := 16#80916427#;
   pragma Export (C, u00022, "system__exceptions__machineB");
   u00023 : constant Version_32 := 16#047ef179#;
   pragma Export (C, u00023, "system__exceptions__machineS");
   u00024 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00024, "system__exceptions_debugB");
   u00025 : constant Version_32 := 16#1dac394e#;
   pragma Export (C, u00025, "system__exceptions_debugS");
   u00026 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00026, "system__img_intB");
   u00027 : constant Version_32 := 16#61fd2048#;
   pragma Export (C, u00027, "system__img_intS");
   u00028 : constant Version_32 := 16#f103f468#;
   pragma Export (C, u00028, "system__storage_elementsB");
   u00029 : constant Version_32 := 16#4ee58a8e#;
   pragma Export (C, u00029, "system__storage_elementsS");
   u00030 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00030, "system__tracebackB");
   u00031 : constant Version_32 := 16#3d041e4e#;
   pragma Export (C, u00031, "system__tracebackS");
   u00032 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00032, "system__traceback_entriesB");
   u00033 : constant Version_32 := 16#637d36fa#;
   pragma Export (C, u00033, "system__traceback_entriesS");
   u00034 : constant Version_32 := 16#e635f7f0#;
   pragma Export (C, u00034, "system__traceback__symbolicB");
   u00035 : constant Version_32 := 16#9df1ae6d#;
   pragma Export (C, u00035, "system__traceback__symbolicS");
   u00036 : constant Version_32 := 16#179d7d28#;
   pragma Export (C, u00036, "ada__containersS");
   u00037 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00037, "ada__exceptions__tracebackB");
   u00038 : constant Version_32 := 16#20245e75#;
   pragma Export (C, u00038, "ada__exceptions__tracebackS");
   u00039 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00039, "interfacesS");
   u00040 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00040, "interfaces__cB");
   u00041 : constant Version_32 := 16#70be4e8c#;
   pragma Export (C, u00041, "interfaces__cS");
   u00042 : constant Version_32 := 16#97d13ec4#;
   pragma Export (C, u00042, "system__address_operationsB");
   u00043 : constant Version_32 := 16#702a7eb9#;
   pragma Export (C, u00043, "system__address_operationsS");
   u00044 : constant Version_32 := 16#e865e681#;
   pragma Export (C, u00044, "system__bounded_stringsB");
   u00045 : constant Version_32 := 16#14dbe193#;
   pragma Export (C, u00045, "system__bounded_stringsS");
   u00046 : constant Version_32 := 16#13b71684#;
   pragma Export (C, u00046, "system__crtlS");
   u00047 : constant Version_32 := 16#596696a5#;
   pragma Export (C, u00047, "system__dwarf_linesB");
   u00048 : constant Version_32 := 16#e03b663a#;
   pragma Export (C, u00048, "system__dwarf_linesS");
   u00049 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00049, "ada__charactersS");
   u00050 : constant Version_32 := 16#8f637df8#;
   pragma Export (C, u00050, "ada__characters__handlingB");
   u00051 : constant Version_32 := 16#3b3f6154#;
   pragma Export (C, u00051, "ada__characters__handlingS");
   u00052 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00052, "ada__characters__latin_1S");
   u00053 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00053, "ada__stringsS");
   u00054 : constant Version_32 := 16#e2ea8656#;
   pragma Export (C, u00054, "ada__strings__mapsB");
   u00055 : constant Version_32 := 16#1e526bec#;
   pragma Export (C, u00055, "ada__strings__mapsS");
   u00056 : constant Version_32 := 16#cc4ff587#;
   pragma Export (C, u00056, "system__bit_opsB");
   u00057 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00057, "system__bit_opsS");
   u00058 : constant Version_32 := 16#57a0bc09#;
   pragma Export (C, u00058, "system__unsigned_typesS");
   u00059 : constant Version_32 := 16#92f05f13#;
   pragma Export (C, u00059, "ada__strings__maps__constantsS");
   u00060 : constant Version_32 := 16#9f00b3d3#;
   pragma Export (C, u00060, "system__address_imageB");
   u00061 : constant Version_32 := 16#c2ca5db0#;
   pragma Export (C, u00061, "system__address_imageS");
   u00062 : constant Version_32 := 16#ec78c2bf#;
   pragma Export (C, u00062, "system__img_unsB");
   u00063 : constant Version_32 := 16#c85480fe#;
   pragma Export (C, u00063, "system__img_unsS");
   u00064 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00064, "system__ioB");
   u00065 : constant Version_32 := 16#fd6437c5#;
   pragma Export (C, u00065, "system__ioS");
   u00066 : constant Version_32 := 16#d6ea8de4#;
   pragma Export (C, u00066, "system__mmapB");
   u00067 : constant Version_32 := 16#59577fed#;
   pragma Export (C, u00067, "system__mmapS");
   u00068 : constant Version_32 := 16#92d882c5#;
   pragma Export (C, u00068, "ada__io_exceptionsS");
   u00069 : constant Version_32 := 16#81cd5347#;
   pragma Export (C, u00069, "system__mmap__os_interfaceB");
   u00070 : constant Version_32 := 16#2af642f4#;
   pragma Export (C, u00070, "system__mmap__os_interfaceS");
   u00071 : constant Version_32 := 16#2b4924dd#;
   pragma Export (C, u00071, "system__mmap__unixS");
   u00072 : constant Version_32 := 16#05e56fce#;
   pragma Export (C, u00072, "system__os_libB");
   u00073 : constant Version_32 := 16#ed466fde#;
   pragma Export (C, u00073, "system__os_libS");
   u00074 : constant Version_32 := 16#d1060688#;
   pragma Export (C, u00074, "system__case_utilB");
   u00075 : constant Version_32 := 16#472fa95d#;
   pragma Export (C, u00075, "system__case_utilS");
   u00076 : constant Version_32 := 16#2a8e89ad#;
   pragma Export (C, u00076, "system__stringsB");
   u00077 : constant Version_32 := 16#1d99d1ec#;
   pragma Export (C, u00077, "system__stringsS");
   u00078 : constant Version_32 := 16#d0bc914c#;
   pragma Export (C, u00078, "system__object_readerB");
   u00079 : constant Version_32 := 16#2e1565f0#;
   pragma Export (C, u00079, "system__object_readerS");
   u00080 : constant Version_32 := 16#1a74a354#;
   pragma Export (C, u00080, "system__val_lliB");
   u00081 : constant Version_32 := 16#f902262a#;
   pragma Export (C, u00081, "system__val_lliS");
   u00082 : constant Version_32 := 16#afdbf393#;
   pragma Export (C, u00082, "system__val_lluB");
   u00083 : constant Version_32 := 16#2d52eb7b#;
   pragma Export (C, u00083, "system__val_lluS");
   u00084 : constant Version_32 := 16#27b600b2#;
   pragma Export (C, u00084, "system__val_utilB");
   u00085 : constant Version_32 := 16#cf867674#;
   pragma Export (C, u00085, "system__val_utilS");
   u00086 : constant Version_32 := 16#5bbc3f2f#;
   pragma Export (C, u00086, "system__exception_tracesB");
   u00087 : constant Version_32 := 16#47f9e010#;
   pragma Export (C, u00087, "system__exception_tracesS");
   u00088 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00088, "system__wch_conB");
   u00089 : constant Version_32 := 16#785be258#;
   pragma Export (C, u00089, "system__wch_conS");
   u00090 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00090, "system__wch_stwB");
   u00091 : constant Version_32 := 16#554ace59#;
   pragma Export (C, u00091, "system__wch_stwS");
   u00092 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00092, "system__wch_cnvB");
   u00093 : constant Version_32 := 16#77ec58ab#;
   pragma Export (C, u00093, "system__wch_cnvS");
   u00094 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00094, "system__wch_jisB");
   u00095 : constant Version_32 := 16#f79c418a#;
   pragma Export (C, u00095, "system__wch_jisS");
   u00096 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00096, "system__stack_checkingB");
   u00097 : constant Version_32 := 16#ed99ab62#;
   pragma Export (C, u00097, "system__stack_checkingS");
   u00098 : constant Version_32 := 16#32da7fe2#;
   pragma Export (C, u00098, "aunitB");
   u00099 : constant Version_32 := 16#76cdf7c6#;
   pragma Export (C, u00099, "aunitS");
   u00100 : constant Version_32 := 16#b6c145a2#;
   pragma Export (C, u00100, "aunit__memoryB");
   u00101 : constant Version_32 := 16#b5da660a#;
   pragma Export (C, u00101, "aunit__memoryS");
   u00102 : constant Version_32 := 16#e99cd447#;
   pragma Export (C, u00102, "aunit__optionsS");
   u00103 : constant Version_32 := 16#d85792d6#;
   pragma Export (C, u00103, "ada__tagsB");
   u00104 : constant Version_32 := 16#8813468c#;
   pragma Export (C, u00104, "ada__tagsS");
   u00105 : constant Version_32 := 16#c3335bfd#;
   pragma Export (C, u00105, "system__htableB");
   u00106 : constant Version_32 := 16#e7e47360#;
   pragma Export (C, u00106, "system__htableS");
   u00107 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00107, "system__string_hashB");
   u00108 : constant Version_32 := 16#45ba181e#;
   pragma Export (C, u00108, "system__string_hashS");
   u00109 : constant Version_32 := 16#e9d6512d#;
   pragma Export (C, u00109, "aunit__test_filtersB");
   u00110 : constant Version_32 := 16#9a67cba8#;
   pragma Export (C, u00110, "aunit__test_filtersS");
   u00111 : constant Version_32 := 16#6e9501f4#;
   pragma Export (C, u00111, "aunit__simple_test_casesB");
   u00112 : constant Version_32 := 16#f9679d50#;
   pragma Export (C, u00112, "aunit__simple_test_casesS");
   u00113 : constant Version_32 := 16#8872fb1a#;
   pragma Export (C, u00113, "aunit__assertionsB");
   u00114 : constant Version_32 := 16#3b7b7e5b#;
   pragma Export (C, u00114, "aunit__assertionsS");
   u00115 : constant Version_32 := 16#11329e00#;
   pragma Export (C, u00115, "ada_containersS");
   u00116 : constant Version_32 := 16#76b7f255#;
   pragma Export (C, u00116, "ada_containers__aunit_listsB");
   u00117 : constant Version_32 := 16#c8d9569a#;
   pragma Export (C, u00117, "ada_containers__aunit_listsS");
   u00118 : constant Version_32 := 16#9b1c7ff2#;
   pragma Export (C, u00118, "aunit__memory__utilsB");
   u00119 : constant Version_32 := 16#fb2f6c57#;
   pragma Export (C, u00119, "aunit__memory__utilsS");
   u00120 : constant Version_32 := 16#01adf261#;
   pragma Export (C, u00120, "aunit__test_resultsB");
   u00121 : constant Version_32 := 16#1087836e#;
   pragma Export (C, u00121, "aunit__test_resultsS");
   u00122 : constant Version_32 := 16#9df5edcf#;
   pragma Export (C, u00122, "aunit__time_measureB");
   u00123 : constant Version_32 := 16#f32b0de9#;
   pragma Export (C, u00123, "aunit__time_measureS");
   u00124 : constant Version_32 := 16#0d7f1a43#;
   pragma Export (C, u00124, "ada__calendarB");
   u00125 : constant Version_32 := 16#5b279c75#;
   pragma Export (C, u00125, "ada__calendarS");
   u00126 : constant Version_32 := 16#d083f760#;
   pragma Export (C, u00126, "system__os_primitivesB");
   u00127 : constant Version_32 := 16#e9a9d1fc#;
   pragma Export (C, u00127, "system__os_primitivesS");
   u00128 : constant Version_32 := 16#6b6cea8f#;
   pragma Export (C, u00128, "aunit__testsS");
   u00129 : constant Version_32 := 16#6abe5dbe#;
   pragma Export (C, u00129, "system__finalization_mastersB");
   u00130 : constant Version_32 := 16#38daf940#;
   pragma Export (C, u00130, "system__finalization_mastersS");
   u00131 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00131, "system__img_boolB");
   u00132 : constant Version_32 := 16#96ffb161#;
   pragma Export (C, u00132, "system__img_boolS");
   u00133 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00133, "ada__finalizationS");
   u00134 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00134, "ada__streamsB");
   u00135 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00135, "ada__streamsS");
   u00136 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00136, "system__finalization_rootB");
   u00137 : constant Version_32 := 16#2cd4b31a#;
   pragma Export (C, u00137, "system__finalization_rootS");
   u00138 : constant Version_32 := 16#6d4d969a#;
   pragma Export (C, u00138, "system__storage_poolsB");
   u00139 : constant Version_32 := 16#40cb5e27#;
   pragma Export (C, u00139, "system__storage_poolsS");
   u00140 : constant Version_32 := 16#5a895de2#;
   pragma Export (C, u00140, "system__pool_globalB");
   u00141 : constant Version_32 := 16#7141203e#;
   pragma Export (C, u00141, "system__pool_globalS");
   u00142 : constant Version_32 := 16#a6359005#;
   pragma Export (C, u00142, "system__memoryB");
   u00143 : constant Version_32 := 16#3a5ba6be#;
   pragma Export (C, u00143, "system__memoryS");
   u00144 : constant Version_32 := 16#fd2ad2f1#;
   pragma Export (C, u00144, "gnatS");
   u00145 : constant Version_32 := 16#d43725a0#;
   pragma Export (C, u00145, "gnat__source_infoS");
   u00146 : constant Version_32 := 16#acb182ec#;
   pragma Export (C, u00146, "gnat__tracebackB");
   u00147 : constant Version_32 := 16#4982a308#;
   pragma Export (C, u00147, "gnat__tracebackS");
   u00148 : constant Version_32 := 16#c5583702#;
   pragma Export (C, u00148, "gnat__traceback__symbolicS");
   u00149 : constant Version_32 := 16#17d955ab#;
   pragma Export (C, u00149, "aunit__reporterS");
   u00150 : constant Version_32 := 16#1c0d4e63#;
   pragma Export (C, u00150, "aunit__reporter__gnattestB");
   u00151 : constant Version_32 := 16#9cd34a09#;
   pragma Export (C, u00151, "aunit__reporter__gnattestS");
   u00152 : constant Version_32 := 16#b48102f5#;
   pragma Export (C, u00152, "gnat__ioB");
   u00153 : constant Version_32 := 16#6227e843#;
   pragma Export (C, u00153, "gnat__ioS");
   u00154 : constant Version_32 := 16#b602a99c#;
   pragma Export (C, u00154, "system__exn_intB");
   u00155 : constant Version_32 := 16#21aadcd6#;
   pragma Export (C, u00155, "system__exn_intS");
   u00156 : constant Version_32 := 16#e11af2d7#;
   pragma Export (C, u00156, "aunit__runB");
   u00157 : constant Version_32 := 16#4b2a8016#;
   pragma Export (C, u00157, "aunit__runS");
   u00158 : constant Version_32 := 16#18bd120a#;
   pragma Export (C, u00158, "aunit__test_suitesB");
   u00159 : constant Version_32 := 16#f3c7e671#;
   pragma Export (C, u00159, "aunit__test_suitesS");
   u00160 : constant Version_32 := 16#f2886c31#;
   pragma Export (C, u00160, "gnat__command_lineB");
   u00161 : constant Version_32 := 16#c8b918ca#;
   pragma Export (C, u00161, "gnat__command_lineS");
   u00162 : constant Version_32 := 16#3791e504#;
   pragma Export (C, u00162, "ada__strings__unboundedB");
   u00163 : constant Version_32 := 16#9fdb1809#;
   pragma Export (C, u00163, "ada__strings__unboundedS");
   u00164 : constant Version_32 := 16#45c9251c#;
   pragma Export (C, u00164, "ada__strings__searchB");
   u00165 : constant Version_32 := 16#c1ab8667#;
   pragma Export (C, u00165, "ada__strings__searchS");
   u00166 : constant Version_32 := 16#933d1555#;
   pragma Export (C, u00166, "system__compare_array_unsigned_8B");
   u00167 : constant Version_32 := 16#ca25b107#;
   pragma Export (C, u00167, "system__compare_array_unsigned_8S");
   u00168 : constant Version_32 := 16#a2250034#;
   pragma Export (C, u00168, "system__storage_pools__subpoolsB");
   u00169 : constant Version_32 := 16#cc5a1856#;
   pragma Export (C, u00169, "system__storage_pools__subpoolsS");
   u00170 : constant Version_32 := 16#9aad1ff1#;
   pragma Export (C, u00170, "system__storage_pools__subpools__finalizationB");
   u00171 : constant Version_32 := 16#fe2f4b3a#;
   pragma Export (C, u00171, "system__storage_pools__subpools__finalizationS");
   u00172 : constant Version_32 := 16#020a3f4d#;
   pragma Export (C, u00172, "system__atomic_countersB");
   u00173 : constant Version_32 := 16#d77aed07#;
   pragma Export (C, u00173, "system__atomic_countersS");
   u00174 : constant Version_32 := 16#3c420900#;
   pragma Export (C, u00174, "system__stream_attributesB");
   u00175 : constant Version_32 := 16#8bc30a4e#;
   pragma Export (C, u00175, "system__stream_attributesS");
   u00176 : constant Version_32 := 16#1d1c6062#;
   pragma Export (C, u00176, "ada__text_ioB");
   u00177 : constant Version_32 := 16#c4f75f1e#;
   pragma Export (C, u00177, "ada__text_ioS");
   u00178 : constant Version_32 := 16#4c01b69c#;
   pragma Export (C, u00178, "interfaces__c_streamsB");
   u00179 : constant Version_32 := 16#b1330297#;
   pragma Export (C, u00179, "interfaces__c_streamsS");
   u00180 : constant Version_32 := 16#6f0d52aa#;
   pragma Export (C, u00180, "system__file_ioB");
   u00181 : constant Version_32 := 16#c45721ef#;
   pragma Export (C, u00181, "system__file_ioS");
   u00182 : constant Version_32 := 16#9eb95a22#;
   pragma Export (C, u00182, "system__file_control_blockS");
   u00183 : constant Version_32 := 16#c1e22146#;
   pragma Export (C, u00183, "gnat__directory_operationsB");
   u00184 : constant Version_32 := 16#e2bb2709#;
   pragma Export (C, u00184, "gnat__directory_operationsS");
   u00185 : constant Version_32 := 16#e5480ede#;
   pragma Export (C, u00185, "ada__strings__fixedB");
   u00186 : constant Version_32 := 16#a86b22b3#;
   pragma Export (C, u00186, "ada__strings__fixedS");
   u00187 : constant Version_32 := 16#923eb7bb#;
   pragma Export (C, u00187, "gnat__os_libS");
   u00188 : constant Version_32 := 16#d763507a#;
   pragma Export (C, u00188, "system__val_intB");
   u00189 : constant Version_32 := 16#2b83eab5#;
   pragma Export (C, u00189, "system__val_intS");
   u00190 : constant Version_32 := 16#1d9142a4#;
   pragma Export (C, u00190, "system__val_unsB");
   u00191 : constant Version_32 := 16#47085132#;
   pragma Export (C, u00191, "system__val_unsS");
   u00192 : constant Version_32 := 16#084c16d0#;
   pragma Export (C, u00192, "gnat__regexpS");
   u00193 : constant Version_32 := 16#908d8e33#;
   pragma Export (C, u00193, "system__regexpB");
   u00194 : constant Version_32 := 16#40146746#;
   pragma Export (C, u00194, "system__regexpS");
   u00195 : constant Version_32 := 16#b4645806#;
   pragma Export (C, u00195, "gnat__stringsS");
   u00196 : constant Version_32 := 16#33489ddc#;
   pragma Export (C, u00196, "gnattest_generatedS");
   u00197 : constant Version_32 := 16#33d7dd87#;
   pragma Export (C, u00197, "gnattest_main_suiteB");
   u00198 : constant Version_32 := 16#eea1e993#;
   pragma Export (C, u00198, "gnattest_main_suiteS");
   u00199 : constant Version_32 := 16#dbcfac5b#;
   pragma Export (C, u00199, "modelS");
   u00200 : constant Version_32 := 16#bd99f34b#;
   pragma Export (C, u00200, "model__commentB");
   u00201 : constant Version_32 := 16#572efe89#;
   pragma Export (C, u00201, "model__commentS");
   u00202 : constant Version_32 := 16#bcec81df#;
   pragma Export (C, u00202, "ada__containers__helpersB");
   u00203 : constant Version_32 := 16#4adfc5eb#;
   pragma Export (C, u00203, "ada__containers__helpersS");
   u00204 : constant Version_32 := 16#e0d3a93c#;
   pragma Export (C, u00204, "model__elementB");
   u00205 : constant Version_32 := 16#691d0ff4#;
   pragma Export (C, u00205, "model__elementS");
   u00206 : constant Version_32 := 16#07746f52#;
   pragma Export (C, u00206, "model__comment__object_t_test_dataB");
   u00207 : constant Version_32 := 16#16c2613a#;
   pragma Export (C, u00207, "model__comment__object_t_test_dataS");
   u00208 : constant Version_32 := 16#35e7e354#;
   pragma Export (C, u00208, "fixturesB");
   u00209 : constant Version_32 := 16#e8b16377#;
   pragma Export (C, u00209, "fixturesS");
   u00210 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00210, "system__concat_2B");
   u00211 : constant Version_32 := 16#6186175a#;
   pragma Export (C, u00211, "system__concat_2S");
   u00212 : constant Version_32 := 16#bd192fe3#;
   pragma Export (C, u00212, "model__parameterB");
   u00213 : constant Version_32 := 16#f14a6c0f#;
   pragma Export (C, u00213, "model__parameterS");
   u00214 : constant Version_32 := 16#2da81129#;
   pragma Export (C, u00214, "model__named_elementB");
   u00215 : constant Version_32 := 16#56e4c4d8#;
   pragma Export (C, u00215, "model__named_elementS");
   u00216 : constant Version_32 := 16#2b70b149#;
   pragma Export (C, u00216, "system__concat_3B");
   u00217 : constant Version_32 := 16#68569c2f#;
   pragma Export (C, u00217, "system__concat_3S");
   u00218 : constant Version_32 := 16#b2247352#;
   pragma Export (C, u00218, "model__element__object_t_test_dataS");
   u00219 : constant Version_32 := 16#269b1972#;
   pragma Export (C, u00219, "aunit__test_fixturesB");
   u00220 : constant Version_32 := 16#3b99f1a5#;
   pragma Export (C, u00220, "aunit__test_fixturesS");
   u00221 : constant Version_32 := 16#629ec049#;
   pragma Export (C, u00221, "model__element__object_t_test_data__object_t_testsB");
   u00222 : constant Version_32 := 16#5ece59a2#;
   pragma Export (C, u00222, "model__element__object_t_test_data__object_t_testsS");
   u00223 : constant Version_32 := 16#52f1910f#;
   pragma Export (C, u00223, "system__assertionsB");
   u00224 : constant Version_32 := 16#aeabec1e#;
   pragma Export (C, u00224, "system__assertionsS");
   u00225 : constant Version_32 := 16#e7cf19e9#;
   pragma Export (C, u00225, "model__comment__object_t_test_data__object_t_testsB");
   u00226 : constant Version_32 := 16#0c2f6839#;
   pragma Export (C, u00226, "model__comment__object_t_test_data__object_t_testsS");
   u00227 : constant Version_32 := 16#187ed7a5#;
   pragma Export (C, u00227, "model__comment__object_t_test_data__object_t_tests__suiteB");
   u00228 : constant Version_32 := 16#04ac769b#;
   pragma Export (C, u00228, "model__comment__object_t_test_data__object_t_tests__suiteS");
   u00229 : constant Version_32 := 16#47bb5779#;
   pragma Export (C, u00229, "aunit__test_callerB");
   u00230 : constant Version_32 := 16#581d22b8#;
   pragma Export (C, u00230, "aunit__test_callerS");
   u00231 : constant Version_32 := 16#b2b5555b#;
   pragma Export (C, u00231, "model__comment__test_dataB");
   u00232 : constant Version_32 := 16#65c596d9#;
   pragma Export (C, u00232, "model__comment__test_dataS");
   u00233 : constant Version_32 := 16#f1f2715d#;
   pragma Export (C, u00233, "model__comment__test_data__testsB");
   u00234 : constant Version_32 := 16#704d6968#;
   pragma Export (C, u00234, "model__comment__test_data__testsS");
   u00235 : constant Version_32 := 16#49e01ff6#;
   pragma Export (C, u00235, "model__comment__test_data__tests__suiteB");
   u00236 : constant Version_32 := 16#0542d146#;
   pragma Export (C, u00236, "model__comment__test_data__tests__suiteS");
   u00237 : constant Version_32 := 16#0cfaa07e#;
   pragma Export (C, u00237, "model__element__test_dataB");
   u00238 : constant Version_32 := 16#da0c261f#;
   pragma Export (C, u00238, "model__element__test_dataS");
   u00239 : constant Version_32 := 16#3c37d1f8#;
   pragma Export (C, u00239, "model__element__test_data__testsB");
   u00240 : constant Version_32 := 16#2fb6bd40#;
   pragma Export (C, u00240, "model__element__test_data__testsS");
   u00241 : constant Version_32 := 16#a335ef0e#;
   pragma Export (C, u00241, "model__element__test_data__tests__suiteB");
   u00242 : constant Version_32 := 16#5c4186f4#;
   pragma Export (C, u00242, "model__element__test_data__tests__suiteS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  gnat%s
   --  gnat.io%s
   --  gnat.io%b
   --  gnat.source_info%s
   --  interfaces%s
   --  system%s
   --  system.address_operations%s
   --  system.address_operations%b
   --  system.atomic_counters%s
   --  system.atomic_counters%b
   --  system.case_util%s
   --  system.case_util%b
   --  system.exn_int%s
   --  system.exn_int%b
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.io%s
   --  system.io%b
   --  system.os_primitives%s
   --  system.os_primitives%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  gnat.strings%s
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.compare_array_unsigned_8%s
   --  system.compare_array_unsigned_8%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.traceback%s
   --  system.traceback%b
   --  system.val_util%s
   --  system.standard_library%s
   --  system.exception_traces%s
   --  ada.exceptions%s
   --  system.wch_stw%s
   --  system.val_util%b
   --  system.val_llu%s
   --  system.val_lli%s
   --  system.os_lib%s
   --  system.bit_ops%s
   --  ada.characters.handling%s
   --  ada.exceptions.traceback%s
   --  ada.exceptions.last_chance_handler%s
   --  system.soft_links%s
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.containers%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.secondary_stack%s
   --  system.address_image%s
   --  system.bounded_strings%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.exception_traces%b
   --  system.memory%s
   --  system.memory%b
   --  system.wch_stw%b
   --  system.val_llu%b
   --  system.val_lli%b
   --  system.os_lib%b
   --  system.bit_ops%b
   --  ada.strings.maps%s
   --  ada.strings.maps.constants%s
   --  ada.characters.handling%b
   --  interfaces.c%s
   --  ada.exceptions.traceback%b
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  ada.exceptions.last_chance_handler%b
   --  system.soft_links%b
   --  system.secondary_stack%b
   --  system.address_image%b
   --  system.bounded_strings%b
   --  system.standard_library%b
   --  system.mmap%s
   --  ada.strings.maps%b
   --  interfaces.c%b
   --  system.object_reader%s
   --  system.dwarf_lines%s
   --  system.dwarf_lines%b
   --  system.mmap.unix%s
   --  system.mmap.os_interface%s
   --  system.mmap%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  system.object_reader%b
   --  system.mmap.os_interface%b
   --  ada.command_line%s
   --  ada.command_line%b
   --  ada.strings.search%s
   --  ada.strings.search%b
   --  ada.strings.fixed%s
   --  ada.strings.fixed%b
   --  ada.tags%s
   --  ada.tags%b
   --  ada.streams%s
   --  ada.streams%b
   --  gnat.os_lib%s
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  ada.containers.helpers%s
   --  ada.containers.helpers%b
   --  system.file_io%s
   --  system.file_io%b
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.finalization_masters%b
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools.finalization%b
   --  system.storage_pools.subpools%b
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  ada.strings.unbounded%s
   --  ada.strings.unbounded%b
   --  system.val_uns%s
   --  system.val_uns%b
   --  system.val_int%s
   --  system.val_int%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  gnat.directory_operations%s
   --  gnat.directory_operations%b
   --  gnat.traceback%s
   --  gnat.traceback%b
   --  gnat.traceback.symbolic%s
   --  system.assertions%s
   --  system.assertions%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  system.regexp%s
   --  system.regexp%b
   --  gnat.regexp%s
   --  gnat.command_line%s
   --  gnat.command_line%b
   --  ada_containers%s
   --  aunit%s
   --  aunit.memory%s
   --  aunit.memory%b
   --  aunit%b
   --  aunit.memory.utils%s
   --  aunit.memory.utils%b
   --  ada_containers.aunit_lists%s
   --  ada_containers.aunit_lists%b
   --  aunit.tests%s
   --  aunit.time_measure%s
   --  aunit.time_measure%b
   --  aunit.test_results%s
   --  aunit.test_results%b
   --  aunit.assertions%s
   --  aunit.assertions%b
   --  aunit.test_filters%s
   --  aunit.options%s
   --  aunit.simple_test_cases%s
   --  aunit.simple_test_cases%b
   --  aunit.test_filters%b
   --  aunit.reporter%s
   --  aunit.reporter.gnattest%s
   --  aunit.reporter.gnattest%b
   --  aunit.test_fixtures%s
   --  aunit.test_fixtures%b
   --  aunit.test_caller%s
   --  aunit.test_caller%b
   --  aunit.test_suites%s
   --  aunit.test_suites%b
   --  aunit.run%s
   --  aunit.run%b
   --  gnattest_generated%s
   --  model%s
   --  model.element%s
   --  model.comment%s
   --  model.comment%b
   --  model.element%b
   --  model.comment.test_data%s
   --  model.comment.test_data%b
   --  model.comment.test_data.tests%s
   --  model.comment.test_data.tests%b
   --  model.comment.test_data.tests.suite%s
   --  model.comment.test_data.tests.suite%b
   --  model.element.object_t_test_data%s
   --  model.element.object_t_test_data.object_t_tests%s
   --  model.element.object_t_test_data.object_t_tests%b
   --  model.element.test_data%s
   --  model.element.test_data%b
   --  model.element.test_data.tests%s
   --  model.element.test_data.tests%b
   --  model.element.test_data.tests.suite%s
   --  model.element.test_data.tests.suite%b
   --  model.named_element%s
   --  model.named_element%b
   --  model.parameter%s
   --  model.parameter%b
   --  fixtures%s
   --  fixtures%b
   --  model.comment.object_t_test_data%s
   --  model.comment.object_t_test_data%b
   --  model.comment.object_t_test_data.object_t_tests%s
   --  model.comment.object_t_test_data.object_t_tests%b
   --  model.comment.object_t_test_data.object_t_tests.suite%s
   --  model.comment.object_t_test_data.object_t_tests.suite%b
   --  gnattest_main_suite%s
   --  gnattest_main_suite%b
   --  test_runner%b
   --  END ELABORATION ORDER

end ada_main;
