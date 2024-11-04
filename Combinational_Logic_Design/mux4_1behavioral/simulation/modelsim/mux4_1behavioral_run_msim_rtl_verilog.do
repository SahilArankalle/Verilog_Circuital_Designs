transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Sahil/Desktop/Maven/Programs/Lab\ 3/mux4_1behavioral {C:/Users/Sahil/Desktop/Maven/Programs/Lab 3/mux4_1behavioral/mux4_1behavioral.v}

vlog -vlog01compat -work work +incdir+C:/Users/Sahil/Desktop/Maven/Programs/Lab\ 3/mux4_1behavioral {C:/Users/Sahil/Desktop/Maven/Programs/Lab 3/mux4_1behavioral/mux4_1behavioral_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L maxv_ver -L rtl_work -L work -voptargs="+acc"  mux4_1behavioral_tb

add wave *
view structure
view signals
run -all
