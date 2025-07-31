.PHONY: clean build run

clean:
	rm -rf csrc simv* simv.daidir ucli.key run.log urg*
build:
	vcs -sverilog -ntb_opts uvm-1.2 -f tb_pkg.f testbench.sv

run:
	./simv +UVM_TESTNAME=alu_test +UVM_VERBOSITY=UVM_LOW -l run.log $(ARGS)

coverage:
	urg -dir simv.vdb -show text
