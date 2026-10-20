// UVM Test for 1x3 Packet Router
import uvm_pkg::*;
`include "uvm_macros.svh"

class router_test extends uvm_test;
  `uvm_component_utils(router_test)
  
  router_env env;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = router_env::type_id::create("env", this);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    `uvm_info("TEST", "Starting Router Simulation...", UVM_LOW)
    #1000; // Let simulation run
    `uvm_info("TEST", "Ending Router Simulation...", UVM_LOW)
    phase.drop_objection(this);
  endtask
endclass
