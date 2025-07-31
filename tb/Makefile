.PHONY: clean build run

clean:
	rm -rf csrc simv* simv.daidir ucli.key run.log
build:
	vcs -sverilog -ntb_opts uvm-1.2 -f tb_pkg.f testbench.sv

run:
	./simv +UVM_TESTNAME=alu_test +UVM_VERBOSITY=UVM_LOW -l run.log
build2:
	vcs -full64 -licqueue -CFLAGS -DVCS '-timescale=1ns/1ns' '+vcs+flush+all' '+warn=all' '-sverilog' '-ntb_opts uvm-1.2' -f tb_pkg.f testbench.sv +UVM_TESTNAME=alu_test
