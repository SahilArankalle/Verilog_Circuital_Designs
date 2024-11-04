transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Sahil/Desktop/Maven/Programs/mux4x1_buffer {C:/Users/Sahil/Desktop/Maven/Programs/mux4x1_buffer/mux4x1_buffer.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sahil/Desktop/Maven/Programs/mux4x1_buffer {C:/Users/Sahil/Desktop/Maven/Programs/mux4x1_buffer/decoder2x4.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sahil/Desktop/Maven/Programs/mux4x1_buffer {C:/Users/Sahil/Desktop/Maven/Programs/mux4x1_buffer/tri_state_buffer.v}

vlog -vlog01compat -work work +incdir+C:/Users/Sahil/Desktop/Maven/Programs/mux4x1_buffer {C:/Users/Sahil/Desktop/Maven/Programs/mux4x1_buffer/mux4x1_buffer_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L maxv_ver -L rtl_work -L work -voptargs="+acc"  mux4x1_buffer_tb

add wave *
view structure
view signals
run -all
