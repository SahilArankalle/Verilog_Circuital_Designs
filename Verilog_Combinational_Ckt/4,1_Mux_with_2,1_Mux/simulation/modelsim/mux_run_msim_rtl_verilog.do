transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Sahil/Desktop/Maven/Programs/4,1_Mux_with_2,1_Mux {C:/Users/Sahil/Desktop/Maven/Programs/4,1_Mux_with_2,1_Mux/mux4_1.v}

vlog -vlog01compat -work work +incdir+C:/Users/Sahil/Desktop/Maven/Programs/4,1_Mux_with_2,1_Mux {C:/Users/Sahil/Desktop/Maven/Programs/4,1_Mux_with_2,1_Mux/mux_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L maxv_ver -L rtl_work -L work -voptargs="+acc"  mux_tb

add wave *
view structure
view signals
run -all
