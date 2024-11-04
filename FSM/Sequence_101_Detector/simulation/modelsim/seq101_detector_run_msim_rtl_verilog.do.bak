transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Sahil/Desktop/Maven/Programs/Lab\ 6/Sequence_101_Detector {C:/Users/Sahil/Desktop/Maven/Programs/Lab 6/Sequence_101_Detector/seq101_detector.v}

vlog -vlog01compat -work work +incdir+C:/Users/Sahil/Desktop/Maven/Programs/Lab\ 6/Sequence_101_Detector {C:/Users/Sahil/Desktop/Maven/Programs/Lab 6/Sequence_101_Detector/seq101_detector_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L maxv_ver -L rtl_work -L work -voptargs="+acc"  seq101_detector_tb

add wave *
view structure
view signals
run -all
