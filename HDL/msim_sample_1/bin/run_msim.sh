#!/bin/sh

# RTL directory
RTL_DIR="../rtl"

# make work dir
if [ ! -e ./work ]; then
    vlib ./work
fi

sim_file=$1
echo "Test Scenario=" $sim_file

# compile
vlog \
    +notimingchecks \
    -sv \
    -y ${RTL_DIR} \
    +incdir+${RTL_DIR}/+ \
    +libext+.v+ \
    ${sim_file}

# simulation
## if you use on CUI
# vsim -c -keepstdout test_module <<EOF
## if you use on GUI
vsim -gui test_module <<EOF
run -all

EOF
