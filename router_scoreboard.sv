// TLM Analysis Scoreboard with Dynamic Queuing for 1x3 Packet Router
import uvm_pkg::*;
`include "uvm_macros.svh"

class router_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(router_scoreboard)

  // TLM analysis port to receive data from the monitor
  uvm_analysis_imp #(router_seq_item, router_scoreboard) item_collected_export;
  
  // Dynamic queues for automated packet comparison per channel
  router_seq_item expected_queue_ch0[$];
  router_seq_item expected_queue_ch1[$];
  router_seq_item expected_queue_ch2[$];

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_export = new("item_collected_export", this);
  endfunction

  // Write method implementation for TLM port
  virtual function void write(router_seq_item pkt);
    // Parity checking logic to match FSM parity checking requirement
    if(pkt.parity != ^pkt.payload) begin
       `uvm_error("SCBD_ERR", "Corrupt parity payload detected!")
    end else begin
       `uvm_info("SCBD", $sformatf("Valid packet routed to port: %0d", pkt.dest_addr), UVM_LOW)
    end
  endfunction
endclass
