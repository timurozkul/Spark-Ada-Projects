pragma Ada_95;
with System;
package ada_main is
   pragma Warnings (Off);

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: GPL 2015 (20150428-49)" & ASCII.NUL;
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
   u00001 : constant Version_32 := 16#3911ae98#;
   pragma Export (C, u00001, "mainB");
   u00002 : constant Version_32 := 16#cd1c0576#;
   pragma Export (C, u00002, "mainS");
   u00003 : constant Version_32 := 16#fbff4c67#;
   pragma Export (C, u00003, "system__standard_libraryB");
   u00004 : constant Version_32 := 16#1ec6fd90#;
   pragma Export (C, u00004, "system__standard_libraryS");
   u00005 : constant Version_32 := 16#94f0c49f#;
   pragma Export (C, u00005, "anglesB");
   u00006 : constant Version_32 := 16#2ff68156#;
   pragma Export (C, u00006, "anglesS");
   u00007 : constant Version_32 := 16#a72e2afe#;
   pragma Export (C, u00007, "as_io_wrapperB");
   u00008 : constant Version_32 := 16#3f5aa9b8#;
   pragma Export (C, u00008, "as_io_wrapperS");
   u00009 : constant Version_32 := 16#be55f851#;
   pragma Export (C, u00009, "sparkS");
   u00010 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00010, "adaS");
   u00011 : constant Version_32 := 16#12c8cd7d#;
   pragma Export (C, u00011, "ada__tagsB");
   u00012 : constant Version_32 := 16#ce72c228#;
   pragma Export (C, u00012, "ada__tagsS");
   u00013 : constant Version_32 := 16#2c143749#;
   pragma Export (C, u00013, "ada__exceptionsB");
   u00014 : constant Version_32 := 16#f4f0cce8#;
   pragma Export (C, u00014, "ada__exceptionsS");
   u00015 : constant Version_32 := 16#a46739c0#;
   pragma Export (C, u00015, "ada__exceptions__last_chance_handlerB");
   u00016 : constant Version_32 := 16#3aac8c92#;
   pragma Export (C, u00016, "ada__exceptions__last_chance_handlerS");
   u00017 : constant Version_32 := 16#1d274481#;
   pragma Export (C, u00017, "systemS");
   u00018 : constant Version_32 := 16#a207fefe#;
   pragma Export (C, u00018, "system__soft_linksB");
   u00019 : constant Version_32 := 16#467d9556#;
   pragma Export (C, u00019, "system__soft_linksS");
   u00020 : constant Version_32 := 16#b01dad17#;
   pragma Export (C, u00020, "system__parametersB");
   u00021 : constant Version_32 := 16#630d49fe#;
   pragma Export (C, u00021, "system__parametersS");
   u00022 : constant Version_32 := 16#b19b6653#;
   pragma Export (C, u00022, "system__secondary_stackB");
   u00023 : constant Version_32 := 16#b6468be8#;
   pragma Export (C, u00023, "system__secondary_stackS");
   u00024 : constant Version_32 := 16#39a03df9#;
   pragma Export (C, u00024, "system__storage_elementsB");
   u00025 : constant Version_32 := 16#30e40e85#;
   pragma Export (C, u00025, "system__storage_elementsS");
   u00026 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00026, "system__stack_checkingB");
   u00027 : constant Version_32 := 16#93982f69#;
   pragma Export (C, u00027, "system__stack_checkingS");
   u00028 : constant Version_32 := 16#393398c1#;
   pragma Export (C, u00028, "system__exception_tableB");
   u00029 : constant Version_32 := 16#b33e2294#;
   pragma Export (C, u00029, "system__exception_tableS");
   u00030 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00030, "system__exceptionsB");
   u00031 : constant Version_32 := 16#75442977#;
   pragma Export (C, u00031, "system__exceptionsS");
   u00032 : constant Version_32 := 16#37d758f1#;
   pragma Export (C, u00032, "system__exceptions__machineS");
   u00033 : constant Version_32 := 16#b895431d#;
   pragma Export (C, u00033, "system__exceptions_debugB");
   u00034 : constant Version_32 := 16#aec55d3f#;
   pragma Export (C, u00034, "system__exceptions_debugS");
   u00035 : constant Version_32 := 16#570325c8#;
   pragma Export (C, u00035, "system__img_intB");
   u00036 : constant Version_32 := 16#1ffca443#;
   pragma Export (C, u00036, "system__img_intS");
   u00037 : constant Version_32 := 16#b98c3e16#;
   pragma Export (C, u00037, "system__tracebackB");
   u00038 : constant Version_32 := 16#831a9d5a#;
   pragma Export (C, u00038, "system__tracebackS");
   u00039 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00039, "system__traceback_entriesB");
   u00040 : constant Version_32 := 16#1d7cb2f1#;
   pragma Export (C, u00040, "system__traceback_entriesS");
   u00041 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00041, "system__wch_conB");
   u00042 : constant Version_32 := 16#065a6653#;
   pragma Export (C, u00042, "system__wch_conS");
   u00043 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00043, "system__wch_stwB");
   u00044 : constant Version_32 := 16#2b4b4a52#;
   pragma Export (C, u00044, "system__wch_stwS");
   u00045 : constant Version_32 := 16#92b797cb#;
   pragma Export (C, u00045, "system__wch_cnvB");
   u00046 : constant Version_32 := 16#09eddca0#;
   pragma Export (C, u00046, "system__wch_cnvS");
   u00047 : constant Version_32 := 16#6033a23f#;
   pragma Export (C, u00047, "interfacesS");
   u00048 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00048, "system__wch_jisB");
   u00049 : constant Version_32 := 16#899dc581#;
   pragma Export (C, u00049, "system__wch_jisS");
   u00050 : constant Version_32 := 16#c3335bfd#;
   pragma Export (C, u00050, "system__htableB");
   u00051 : constant Version_32 := 16#99e5f76b#;
   pragma Export (C, u00051, "system__htableS");
   u00052 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00052, "system__string_hashB");
   u00053 : constant Version_32 := 16#3bbb9c15#;
   pragma Export (C, u00053, "system__string_hashS");
   u00054 : constant Version_32 := 16#807fe041#;
   pragma Export (C, u00054, "system__unsigned_typesS");
   u00055 : constant Version_32 := 16#06052bd0#;
   pragma Export (C, u00055, "system__val_lluB");
   u00056 : constant Version_32 := 16#fa8db733#;
   pragma Export (C, u00056, "system__val_lluS");
   u00057 : constant Version_32 := 16#27b600b2#;
   pragma Export (C, u00057, "system__val_utilB");
   u00058 : constant Version_32 := 16#b187f27f#;
   pragma Export (C, u00058, "system__val_utilS");
   u00059 : constant Version_32 := 16#d1060688#;
   pragma Export (C, u00059, "system__case_utilB");
   u00060 : constant Version_32 := 16#392e2d56#;
   pragma Export (C, u00060, "system__case_utilS");
   u00061 : constant Version_32 := 16#28f088c2#;
   pragma Export (C, u00061, "ada__text_ioB");
   u00062 : constant Version_32 := 16#f372c8ac#;
   pragma Export (C, u00062, "ada__text_ioS");
   u00063 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00063, "ada__streamsB");
   u00064 : constant Version_32 := 16#2e6701ab#;
   pragma Export (C, u00064, "ada__streamsS");
   u00065 : constant Version_32 := 16#db5c917c#;
   pragma Export (C, u00065, "ada__io_exceptionsS");
   u00066 : constant Version_32 := 16#84a27f0d#;
   pragma Export (C, u00066, "interfaces__c_streamsB");
   u00067 : constant Version_32 := 16#8bb5f2c0#;
   pragma Export (C, u00067, "interfaces__c_streamsS");
   u00068 : constant Version_32 := 16#6db6928f#;
   pragma Export (C, u00068, "system__crtlS");
   u00069 : constant Version_32 := 16#431faf3c#;
   pragma Export (C, u00069, "system__file_ioB");
   u00070 : constant Version_32 := 16#ba56a5e4#;
   pragma Export (C, u00070, "system__file_ioS");
   u00071 : constant Version_32 := 16#b7ab275c#;
   pragma Export (C, u00071, "ada__finalizationB");
   u00072 : constant Version_32 := 16#19f764ca#;
   pragma Export (C, u00072, "ada__finalizationS");
   u00073 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00073, "system__finalization_rootB");
   u00074 : constant Version_32 := 16#52d53711#;
   pragma Export (C, u00074, "system__finalization_rootS");
   u00075 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00075, "interfaces__cB");
   u00076 : constant Version_32 := 16#4a38bedb#;
   pragma Export (C, u00076, "interfaces__cS");
   u00077 : constant Version_32 := 16#07e6ee66#;
   pragma Export (C, u00077, "system__os_libB");
   u00078 : constant Version_32 := 16#d7b69782#;
   pragma Export (C, u00078, "system__os_libS");
   u00079 : constant Version_32 := 16#1a817b8e#;
   pragma Export (C, u00079, "system__stringsB");
   u00080 : constant Version_32 := 16#639855e7#;
   pragma Export (C, u00080, "system__stringsS");
   u00081 : constant Version_32 := 16#e0b8de29#;
   pragma Export (C, u00081, "system__file_control_blockS");
   u00082 : constant Version_32 := 16#440739da#;
   pragma Export (C, u00082, "spark__text_ioB");
   u00083 : constant Version_32 := 16#b96d62e1#;
   pragma Export (C, u00083, "spark__text_ioS");
   u00084 : constant Version_32 := 16#68995fa1#;
   pragma Export (C, u00084, "spark__text_io__integer_ioB");
   u00085 : constant Version_32 := 16#df01d5cd#;
   pragma Export (C, u00085, "spark__text_io__integer_ioS");
   u00086 : constant Version_32 := 16#f6fdca1c#;
   pragma Export (C, u00086, "ada__text_io__integer_auxB");
   u00087 : constant Version_32 := 16#b9793d30#;
   pragma Export (C, u00087, "ada__text_io__integer_auxS");
   u00088 : constant Version_32 := 16#181dc502#;
   pragma Export (C, u00088, "ada__text_io__generic_auxB");
   u00089 : constant Version_32 := 16#a6c327d3#;
   pragma Export (C, u00089, "ada__text_io__generic_auxS");
   u00090 : constant Version_32 := 16#18d57884#;
   pragma Export (C, u00090, "system__img_biuB");
   u00091 : constant Version_32 := 16#465d680c#;
   pragma Export (C, u00091, "system__img_biuS");
   u00092 : constant Version_32 := 16#e7d8734f#;
   pragma Export (C, u00092, "system__img_llbB");
   u00093 : constant Version_32 := 16#079a78f2#;
   pragma Export (C, u00093, "system__img_llbS");
   u00094 : constant Version_32 := 16#9777733a#;
   pragma Export (C, u00094, "system__img_lliB");
   u00095 : constant Version_32 := 16#0c681150#;
   pragma Export (C, u00095, "system__img_lliS");
   u00096 : constant Version_32 := 16#0e8808d4#;
   pragma Export (C, u00096, "system__img_llwB");
   u00097 : constant Version_32 := 16#aef65b64#;
   pragma Export (C, u00097, "system__img_llwS");
   u00098 : constant Version_32 := 16#428b07f8#;
   pragma Export (C, u00098, "system__img_wiuB");
   u00099 : constant Version_32 := 16#281cef9e#;
   pragma Export (C, u00099, "system__img_wiuS");
   u00100 : constant Version_32 := 16#7ebd8839#;
   pragma Export (C, u00100, "system__val_intB");
   u00101 : constant Version_32 := 16#55826ebe#;
   pragma Export (C, u00101, "system__val_intS");
   u00102 : constant Version_32 := 16#b44f9ae7#;
   pragma Export (C, u00102, "system__val_unsB");
   u00103 : constant Version_32 := 16#90d70d7a#;
   pragma Export (C, u00103, "system__val_unsS");
   u00104 : constant Version_32 := 16#b3aa7b17#;
   pragma Export (C, u00104, "system__val_lliB");
   u00105 : constant Version_32 := 16#8703a221#;
   pragma Export (C, u00105, "system__val_lliS");
   u00106 : constant Version_32 := 16#9d39c675#;
   pragma Export (C, u00106, "system__memoryB");
   u00107 : constant Version_32 := 16#445a22b5#;
   pragma Export (C, u00107, "system__memoryS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  interfaces%s
   --  system%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.htable%s
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.os_lib%s
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  system.soft_links%s
   --  system.unsigned_types%s
   --  system.img_biu%s
   --  system.img_biu%b
   --  system.img_llb%s
   --  system.img_llb%b
   --  system.img_llw%s
   --  system.img_llw%b
   --  system.img_wiu%s
   --  system.img_wiu%b
   --  system.val_int%s
   --  system.val_lli%s
   --  system.val_llu%s
   --  system.val_uns%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_uns%b
   --  system.val_llu%b
   --  system.val_lli%b
   --  system.val_int%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_cnv%s
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.io_exceptions%s
   --  ada.tags%s
   --  ada.streams%s
   --  ada.streams%b
   --  interfaces.c%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.exceptions.machine%s
   --  system.file_control_block%s
   --  system.file_io%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  ada.finalization%b
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.secondary_stack%s
   --  system.file_io%b
   --  interfaces.c%b
   --  ada.tags%b
   --  system.soft_links%b
   --  system.os_lib%b
   --  system.secondary_stack%b
   --  system.traceback%s
   --  ada.exceptions%b
   --  system.traceback%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  ada.text_io.integer_aux%s
   --  ada.text_io.integer_aux%b
   --  angles%s
   --  angles%b
   --  main%s
   --  spark%s
   --  spark.text_io%s
   --  spark.text_io%b
   --  as_io_wrapper%s
   --  main%b
   --  spark.text_io.integer_io%s
   --  spark.text_io.integer_io%b
   --  as_io_wrapper%b
   --  END ELABORATION ORDER


end ada_main;
