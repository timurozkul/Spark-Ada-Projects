pragma Warnings (Off);
pragma Ada_95;
with System;
with System.Parameters;
with System.Secondary_Stack;
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
                    "GNAT Version: Community 2019 (20190517-83)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_main" & ASCII.NUL;
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
   u00001 : constant Version_32 := 16#1226a4c8#;
   pragma Export (C, u00001, "mainB");
   u00002 : constant Version_32 := 16#cd1c0576#;
   pragma Export (C, u00002, "mainS");
   u00003 : constant Version_32 := 16#050ff2f0#;
   pragma Export (C, u00003, "system__standard_libraryB");
   u00004 : constant Version_32 := 16#0f7d71d4#;
   pragma Export (C, u00004, "system__standard_libraryS");
   u00005 : constant Version_32 := 16#1b476e0d#;
   pragma Export (C, u00005, "anglesB");
   u00006 : constant Version_32 := 16#04c18b06#;
   pragma Export (C, u00006, "anglesS");
   u00007 : constant Version_32 := 16#a72e2afe#;
   pragma Export (C, u00007, "as_io_wrapperB");
   u00008 : constant Version_32 := 16#3f5aa9b8#;
   pragma Export (C, u00008, "as_io_wrapperS");
   u00009 : constant Version_32 := 16#28ccd8e8#;
   pragma Export (C, u00009, "sparkS");
   u00010 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00010, "adaS");
   u00011 : constant Version_32 := 16#f4e097a7#;
   pragma Export (C, u00011, "ada__text_ioB");
   u00012 : constant Version_32 := 16#3913d0d6#;
   pragma Export (C, u00012, "ada__text_ioS");
   u00013 : constant Version_32 := 16#d90c4a0d#;
   pragma Export (C, u00013, "ada__exceptionsB");
   u00014 : constant Version_32 := 16#16307b94#;
   pragma Export (C, u00014, "ada__exceptionsS");
   u00015 : constant Version_32 := 16#5726abed#;
   pragma Export (C, u00015, "ada__exceptions__last_chance_handlerB");
   u00016 : constant Version_32 := 16#41e5552e#;
   pragma Export (C, u00016, "ada__exceptions__last_chance_handlerS");
   u00017 : constant Version_32 := 16#085b6ffb#;
   pragma Export (C, u00017, "systemS");
   u00018 : constant Version_32 := 16#ae860117#;
   pragma Export (C, u00018, "system__soft_linksB");
   u00019 : constant Version_32 := 16#4d58644d#;
   pragma Export (C, u00019, "system__soft_linksS");
   u00020 : constant Version_32 := 16#bd45c2cc#;
   pragma Export (C, u00020, "system__secondary_stackB");
   u00021 : constant Version_32 := 16#4dcf97e2#;
   pragma Export (C, u00021, "system__secondary_stackS");
   u00022 : constant Version_32 := 16#86dbf443#;
   pragma Export (C, u00022, "system__parametersB");
   u00023 : constant Version_32 := 16#40b73bd0#;
   pragma Export (C, u00023, "system__parametersS");
   u00024 : constant Version_32 := 16#ced09590#;
   pragma Export (C, u00024, "system__storage_elementsB");
   u00025 : constant Version_32 := 16#259825ff#;
   pragma Export (C, u00025, "system__storage_elementsS");
   u00026 : constant Version_32 := 16#75bf515c#;
   pragma Export (C, u00026, "system__soft_links__initializeB");
   u00027 : constant Version_32 := 16#5697fc2b#;
   pragma Export (C, u00027, "system__soft_links__initializeS");
   u00028 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00028, "system__stack_checkingB");
   u00029 : constant Version_32 := 16#86e40413#;
   pragma Export (C, u00029, "system__stack_checkingS");
   u00030 : constant Version_32 := 16#34742901#;
   pragma Export (C, u00030, "system__exception_tableB");
   u00031 : constant Version_32 := 16#55f506b9#;
   pragma Export (C, u00031, "system__exception_tableS");
   u00032 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00032, "system__exceptionsB");
   u00033 : constant Version_32 := 16#6038020d#;
   pragma Export (C, u00033, "system__exceptionsS");
   u00034 : constant Version_32 := 16#69416224#;
   pragma Export (C, u00034, "system__exceptions__machineB");
   u00035 : constant Version_32 := 16#d27d9682#;
   pragma Export (C, u00035, "system__exceptions__machineS");
   u00036 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00036, "system__exceptions_debugB");
   u00037 : constant Version_32 := 16#76d1963f#;
   pragma Export (C, u00037, "system__exceptions_debugS");
   u00038 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00038, "system__img_intB");
   u00039 : constant Version_32 := 16#0a808f39#;
   pragma Export (C, u00039, "system__img_intS");
   u00040 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00040, "system__tracebackB");
   u00041 : constant Version_32 := 16#5679b13f#;
   pragma Export (C, u00041, "system__tracebackS");
   u00042 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00042, "system__traceback_entriesB");
   u00043 : constant Version_32 := 16#0800998b#;
   pragma Export (C, u00043, "system__traceback_entriesS");
   u00044 : constant Version_32 := 16#bb296fbb#;
   pragma Export (C, u00044, "system__traceback__symbolicB");
   u00045 : constant Version_32 := 16#c84061d1#;
   pragma Export (C, u00045, "system__traceback__symbolicS");
   u00046 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00046, "ada__exceptions__tracebackB");
   u00047 : constant Version_32 := 16#20245e75#;
   pragma Export (C, u00047, "ada__exceptions__tracebackS");
   u00048 : constant Version_32 := 16#a0d3d22b#;
   pragma Export (C, u00048, "system__address_imageB");
   u00049 : constant Version_32 := 16#a9b7f2c1#;
   pragma Export (C, u00049, "system__address_imageS");
   u00050 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00050, "system__wch_conB");
   u00051 : constant Version_32 := 16#13264d29#;
   pragma Export (C, u00051, "system__wch_conS");
   u00052 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00052, "system__wch_stwB");
   u00053 : constant Version_32 := 16#3e376128#;
   pragma Export (C, u00053, "system__wch_stwS");
   u00054 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00054, "system__wch_cnvB");
   u00055 : constant Version_32 := 16#1c91f7da#;
   pragma Export (C, u00055, "system__wch_cnvS");
   u00056 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00056, "interfacesS");
   u00057 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00057, "system__wch_jisB");
   u00058 : constant Version_32 := 16#9ce1eefb#;
   pragma Export (C, u00058, "system__wch_jisS");
   u00059 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00059, "ada__streamsB");
   u00060 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00060, "ada__streamsS");
   u00061 : constant Version_32 := 16#92d882c5#;
   pragma Export (C, u00061, "ada__io_exceptionsS");
   u00062 : constant Version_32 := 16#d398a95f#;
   pragma Export (C, u00062, "ada__tagsB");
   u00063 : constant Version_32 := 16#12a0afb8#;
   pragma Export (C, u00063, "ada__tagsS");
   u00064 : constant Version_32 := 16#796f31f1#;
   pragma Export (C, u00064, "system__htableB");
   u00065 : constant Version_32 := 16#8c99dc11#;
   pragma Export (C, u00065, "system__htableS");
   u00066 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00066, "system__string_hashB");
   u00067 : constant Version_32 := 16#2ec7b76f#;
   pragma Export (C, u00067, "system__string_hashS");
   u00068 : constant Version_32 := 16#3cdd1378#;
   pragma Export (C, u00068, "system__unsigned_typesS");
   u00069 : constant Version_32 := 16#b8e72903#;
   pragma Export (C, u00069, "system__val_lluB");
   u00070 : constant Version_32 := 16#51139e9a#;
   pragma Export (C, u00070, "system__val_lluS");
   u00071 : constant Version_32 := 16#269742a9#;
   pragma Export (C, u00071, "system__val_utilB");
   u00072 : constant Version_32 := 16#a4fbd905#;
   pragma Export (C, u00072, "system__val_utilS");
   u00073 : constant Version_32 := 16#ec4d5631#;
   pragma Export (C, u00073, "system__case_utilB");
   u00074 : constant Version_32 := 16#378ed9af#;
   pragma Export (C, u00074, "system__case_utilS");
   u00075 : constant Version_32 := 16#73d2d764#;
   pragma Export (C, u00075, "interfaces__c_streamsB");
   u00076 : constant Version_32 := 16#b1330297#;
   pragma Export (C, u00076, "interfaces__c_streamsS");
   u00077 : constant Version_32 := 16#4e0ce0a1#;
   pragma Export (C, u00077, "system__crtlS");
   u00078 : constant Version_32 := 16#ec083f01#;
   pragma Export (C, u00078, "system__file_ioB");
   u00079 : constant Version_32 := 16#af2a8e9e#;
   pragma Export (C, u00079, "system__file_ioS");
   u00080 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00080, "ada__finalizationS");
   u00081 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00081, "system__finalization_rootB");
   u00082 : constant Version_32 := 16#47a91c6b#;
   pragma Export (C, u00082, "system__finalization_rootS");
   u00083 : constant Version_32 := 16#e4774a28#;
   pragma Export (C, u00083, "system__os_libB");
   u00084 : constant Version_32 := 16#d8e681fb#;
   pragma Export (C, u00084, "system__os_libS");
   u00085 : constant Version_32 := 16#2a8e89ad#;
   pragma Export (C, u00085, "system__stringsB");
   u00086 : constant Version_32 := 16#684d436e#;
   pragma Export (C, u00086, "system__stringsS");
   u00087 : constant Version_32 := 16#f5c4f553#;
   pragma Export (C, u00087, "system__file_control_blockS");
   u00088 : constant Version_32 := 16#440739da#;
   pragma Export (C, u00088, "spark__text_ioB");
   u00089 : constant Version_32 := 16#b96d62e1#;
   pragma Export (C, u00089, "spark__text_ioS");
   u00090 : constant Version_32 := 16#68995fa1#;
   pragma Export (C, u00090, "spark__text_io__integer_ioB");
   u00091 : constant Version_32 := 16#df01d5cd#;
   pragma Export (C, u00091, "spark__text_io__integer_ioS");
   u00092 : constant Version_32 := 16#fdedfd10#;
   pragma Export (C, u00092, "ada__text_io__integer_auxB");
   u00093 : constant Version_32 := 16#2fe01d89#;
   pragma Export (C, u00093, "ada__text_io__integer_auxS");
   u00094 : constant Version_32 := 16#181dc502#;
   pragma Export (C, u00094, "ada__text_io__generic_auxB");
   u00095 : constant Version_32 := 16#305a076a#;
   pragma Export (C, u00095, "ada__text_io__generic_auxS");
   u00096 : constant Version_32 := 16#b10ba0c7#;
   pragma Export (C, u00096, "system__img_biuB");
   u00097 : constant Version_32 := 16#faff9b35#;
   pragma Export (C, u00097, "system__img_biuS");
   u00098 : constant Version_32 := 16#4e06ab0c#;
   pragma Export (C, u00098, "system__img_llbB");
   u00099 : constant Version_32 := 16#bb388bcb#;
   pragma Export (C, u00099, "system__img_llbS");
   u00100 : constant Version_32 := 16#9dca6636#;
   pragma Export (C, u00100, "system__img_lliB");
   u00101 : constant Version_32 := 16#19143a2a#;
   pragma Export (C, u00101, "system__img_lliS");
   u00102 : constant Version_32 := 16#a756d097#;
   pragma Export (C, u00102, "system__img_llwB");
   u00103 : constant Version_32 := 16#1254a85d#;
   pragma Export (C, u00103, "system__img_llwS");
   u00104 : constant Version_32 := 16#eb55dfbb#;
   pragma Export (C, u00104, "system__img_wiuB");
   u00105 : constant Version_32 := 16#94be1ca7#;
   pragma Export (C, u00105, "system__img_wiuS");
   u00106 : constant Version_32 := 16#0f9783a4#;
   pragma Export (C, u00106, "system__val_intB");
   u00107 : constant Version_32 := 16#bda40698#;
   pragma Export (C, u00107, "system__val_intS");
   u00108 : constant Version_32 := 16#383fd226#;
   pragma Export (C, u00108, "system__val_unsB");
   u00109 : constant Version_32 := 16#09db6ec1#;
   pragma Export (C, u00109, "system__val_unsS");
   u00110 : constant Version_32 := 16#fb020d94#;
   pragma Export (C, u00110, "system__val_lliB");
   u00111 : constant Version_32 := 16#6435fd0b#;
   pragma Export (C, u00111, "system__val_lliS");
   u00112 : constant Version_32 := 16#e31b7c4e#;
   pragma Export (C, u00112, "system__memoryB");
   u00113 : constant Version_32 := 16#512609cf#;
   pragma Export (C, u00113, "system__memoryS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  interfaces%s
   --  system%s
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
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
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.img_biu%s
   --  system.img_biu%b
   --  system.img_llb%s
   --  system.img_llb%b
   --  system.img_llw%s
   --  system.img_llw%b
   --  system.img_wiu%s
   --  system.img_wiu%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.traceback%s
   --  system.traceback%b
   --  system.secondary_stack%s
   --  system.standard_library%s
   --  ada.exceptions%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.soft_links%s
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  ada.exceptions.traceback%b
   --  system.address_image%s
   --  system.address_image%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  system.memory%s
   --  system.memory%b
   --  system.secondary_stack%b
   --  system.soft_links.initialize%s
   --  system.soft_links.initialize%b
   --  system.soft_links%b
   --  system.standard_library%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  ada.io_exceptions%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.os_lib%s
   --  system.os_lib%b
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_llu%s
   --  system.val_llu%b
   --  ada.tags%s
   --  ada.tags%b
   --  ada.streams%s
   --  ada.streams%b
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  system.file_io%s
   --  system.file_io%b
   --  system.val_lli%s
   --  system.val_lli%b
   --  system.val_uns%s
   --  system.val_uns%b
   --  system.val_int%s
   --  system.val_int%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  ada.text_io.integer_aux%s
   --  ada.text_io.integer_aux%b
   --  angles%s
   --  angles%b
   --  spark%s
   --  spark.text_io%s
   --  spark.text_io%b
   --  spark.text_io.integer_io%s
   --  spark.text_io.integer_io%b
   --  as_io_wrapper%s
   --  as_io_wrapper%b
   --  main%s
   --  main%b
   --  END ELABORATION ORDER

end ada_main;
