// UVM Agent for 1x3 Packet Router
import uvm_pkg::*;
`include "uvm_macros.svh"

class router_agent extends uvm_agent;
  `uvm_component_utils(router_agent)
  
  uvm_sequencer #(router_seq_item) sqr;
  router_driver                    drv;
  router_monitor                   monitor;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sqr     = uvm_sequencer#(router_seq_item)::type_id::create("sqr", this);
    drv     = router_driver::type_id::create("drv", this);
    monitor = router_monitor::type_id::create("monitor", this);
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    // Connect sequencer to driver
    drv.seq_item_port.connect(sqr.seq_item_export);
  endfunction
endclass
