// UVM Driver for 1x3 Packet Router
import uvm_pkg::*;
`include "uvm_macros.svh"

class router_driver extends uvm_driver #(router_seq_item);
  `uvm_component_utils(router_driver)

  virtual router_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // Fetch the virtual interface from the config DB
    if(!uvm_config_db#(virtual router_if)::get(this, "", "vif", vif))
      `uvm_fatal("DRV", "Could not get virtual interface")
  endfunction

  virtual task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
      drive_item(req);
      seq_item_port.item_done();
    end
  endtask

  // Drive the randomized sequence item to the DUT interface
  virtual task drive_item(router_seq_item req);
    @(posedge vif.clk);
    vif.valid <= 1'b1;
    vif.dest_addr <= req.dest_addr;
    vif.payload <= req.payload;
    vif.parity <= req.parity;
    
    @(posedge vif.clk);
    vif.valid <= 1'b0;
  endtask
endclass
