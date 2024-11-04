transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Sahil/Desktop/Maven/Programs/priority_ckt {C:/Users/Sahil/Desktop/Maven/Programs/priority_ckt/priority_ckt.v}

vlog -vlog01compat -work work +incdir+C:/Users/Sahil/Desktop/Maven/Programs/priority_ckt {C:/Users/Sahil/Desktop/Maven/Programs/priority_ckt/priority_ckt_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L maxv_ver -L rtl_work -L work -voptargs="+acc"  priority_ckt_tb

add wave *
view structure
view signals
run -all
