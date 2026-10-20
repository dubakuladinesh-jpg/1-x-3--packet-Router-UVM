// UVM Environment for 1x3 Packet Router
import uvm_pkg::*;
`include "uvm_macros.svh"

class router_env extends uvm_env;
  `uvm_component_utils(router_env)

  router_agent      agent;
  router_scoreboard scbd;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent = router_agent::type_id::create("agent", this);
    scbd  = router_scoreboard::type_id::create("scbd", this);
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    // Connect monitor to scoreboard for TLM analysis
    agent.monitor.item_collected_port.connect(scbd.item_collected_export);
  endfunction
endclass
