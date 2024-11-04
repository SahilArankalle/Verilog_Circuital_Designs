transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Sahil/Desktop/Maven/Programs/Lab\ 5/8x16_RualPort_AsyncRAM {C:/Users/Sahil/Desktop/Maven/Programs/Lab 5/8x16_RualPort_AsyncRAM/ram8x16_asynch_dualport.v}

vlog -vlog01compat -work work +incdir+C:/Users/Sahil/Desktop/Maven/Programs/Lab\ 5/8x16_RualPort_AsyncRAM {C:/Users/Sahil/Desktop/Maven/Programs/Lab 5/8x16_RualPort_AsyncRAM/dualport_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L maxv_ver -L rtl_work -L work -voptargs="+acc"  dualport_tb

add wave *
view structure
view signals
run -all
