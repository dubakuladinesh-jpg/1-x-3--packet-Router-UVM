// Top-Level UVM Testbench for 1x3 Packet Router
import uvm_pkg::*;
`include "uvm_macros.svh"

module tb_top;
  bit clk;
  
  // Clock generation
  always #5 clk = ~clk;

  // Instantiate Interface
  router_if vif(clk);
  
  // Note: DUT instantiation goes here in a live simulation
  // router_top dut (.clk(vif.clk), .reset(vif.reset), .valid(vif.valid)...);

  initial begin
    // Pass interface to the configuration database
    uvm_config_db#(virtual router_if)::set(null, "*", "vif", vif);
    
    // Start the UVM test
    run_test("router_test");
  end
endmodule
