// UVM Monitor for 1x3 Packet Router
import uvm_pkg::*;
`include "uvm_macros.svh"

class router_monitor extends uvm_monitor;
  `uvm_component_utils(router_monitor)
  
  virtual router_if vif;
  uvm_analysis_port #(router_seq_item) item_collected_port;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_port = new("item_collected_port", this);
    if(!uvm_config_db#(virtual router_if)::get(this, "", "vif", vif))
      `uvm_fatal("MON", "Could not get virtual interface")
  endfunction

  virtual task run_phase(uvm_phase phase);
    router_seq_item item = router_seq_item::type_id::create("item");
    forever begin
      @(posedge vif.clk);
      if(vif.valid) begin
        item.dest_addr = vif.dest_addr;
        item.payload   = vif.payload;
        item.parity    = vif.parity;
        // Send data to scoreboard via TLM port
        item_collected_port.write(item);
      end
    end
  endtask
endclass
