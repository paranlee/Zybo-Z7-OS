# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 90 \
    name p_0_1_0_0_0268_389_lcssa100 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_0_1_0_0_0268_389_lcssa100 \
    op interface \
    ports { p_0_1_0_0_0268_389_lcssa100 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 91 \
    name p_0_0_0_0_0266_383_lcssa97 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_0_0_0_0_0266_383_lcssa97 \
    op interface \
    ports { p_0_0_0_0_0266_383_lcssa97 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 92 \
    name trunc_ln496_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_trunc_ln496_1 \
    op interface \
    ports { trunc_ln496_1 { I 13 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 93 \
    name bytePlanes_plane01 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_bytePlanes_plane01 \
    op interface \
    ports { bytePlanes_plane01_din { O 64 vector } bytePlanes_plane01_num_data_valid { I 11 vector } bytePlanes_plane01_fifo_cap { I 11 vector } bytePlanes_plane01_full_n { I 1 bit } bytePlanes_plane01_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 94 \
    name icmp_ln501 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_icmp_ln501 \
    op interface \
    ports { icmp_ln501 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 95 \
    name cmp43_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp43_2 \
    op interface \
    ports { cmp43_2 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 96 \
    name cmp43_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp43_1 \
    op interface \
    ports { cmp43_1 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 97 \
    name sub40_cast56 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sub40_cast56 \
    op interface \
    ports { sub40_cast56 { I 13 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 98 \
    name cmp43 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp43 \
    op interface \
    ports { cmp43 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 99 \
    name img \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_img \
    op interface \
    ports { img_dout { I 24 vector } img_num_data_valid { I 2 vector } img_fifo_cap { I 2 vector } img_empty_n { I 1 bit } img_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 100 \
    name p_0_1_0_0_0268_388_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_0_1_0_0_0268_388_out \
    op interface \
    ports { p_0_1_0_0_0268_388_out { O 8 vector } p_0_1_0_0_0268_388_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 101 \
    name p_0_0_0_0_0266_382_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_0_0_0_0_0266_382_out \
    op interface \
    ports { p_0_0_0_0_0266_382_out { O 8 vector } p_0_0_0_0_0266_382_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName system_v_frmbuf_wr_0_0_flow_control_loop_pipe_sequential_init_U
set CompName system_v_frmbuf_wr_0_0_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix system_v_frmbuf_wr_0_0_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


