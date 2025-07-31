module top;
  import uvm_pkg::*;
  
  alu_intf intf();
  
  initial
    begin
      uvm_config_db #(virtual alu_intf)::set(null,"*","intf",intf);
    end
  
    initial
    begin
      intf.clk = 0;
      forever begin
        #5 intf.clk = ~intf.clk;
      end
    end
  
  dut_wrapper wrapper(.intf(intf.DUT)); // this connects DUT to the interface
  
  initial begin
          run_test();
    `uvm_info ("tb","running TB success",UVM_DEBUG);
  end
  
    // Dump waves
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
  end
  
  //for coverage add an instance here
  
/* final
  begin
    //if coverage not 100%, report an error
    if ($get_coverage() != 100)
      `uvm_error("TOP",$sformatf("coverage is not 100%, it is %f",$get_coverage()))
  end
  */
endmodule

