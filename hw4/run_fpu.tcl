# Import Design
read_file ./FPSingleCycleMIPS.v

current_design [get_designs FPSingleCycleMIPS]
link

source -echo -verbose ./FPSingleCycleMIPS.sdc

# Compile Design
current_design [get_designs FPSingleCycleMIPS]

set high_fanout_net_threshold 0

uniquify
set_fix_multiple_port_nets -all -buffer_constants [get_designs *]

set_max_area 0

compile

# Output Design
current_design [get_designs FPSingleCycleMIPS]

remove_unconnected_ports -blast_buses [get_cells -hierarchical *]

set bus_inference_style {%s[%d]}
set bus_naming_style {%s[%d]}
set hdlout_internal_busses true
change_names -hierarchy -rule verilog
define_name_rules name_rule -allowed {a-z A-Z 0-9 _} -max_length 255 -type cell
define_name_rules name_rule -allowed {a-z A-Z 0-9 _[]} -max_length 255 -type net
define_name_rules name_rule -map {{"\\*cell\\*" "cell"}}
define_name_rules name_rule -case_insensitive
change_names -hierarchy -rules name_rule

# rename when you do FPU part!
write_sdf -version 2.1 ./FPSingleCycleMIPS_syn.sdf
write -hierarchy -format verilog -output ./FPSingleCycleMIPS_syn.v
write -hierarchy -format ddc -output ./FPSingleCycleMIPS_syn.ddc                       
report_area -nosplit -hierarchy > ./area.txt
report_timing > ./timing.txt