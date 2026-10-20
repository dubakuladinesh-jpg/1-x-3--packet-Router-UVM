// UVM Sequence Item for 8-bit, 3-channel packet router
import uvm_pkg::*;
`include "uvm_macros.svh"

class router_seq_item extends uvm_sequence_item;
  
  // 8-bit payload and 3-channel (2-bit) destination address
  rand bit [1:0] dest_addr;
  rand bit [7:0] payload;
  bit            parity;
  
  // Constraints for valid routing
  constraint valid_addr { dest_addr inside {2'b00, 2'b01, 2'b10}; }
  
  `uvm_object_utils_begin(router_seq_item)
    `uvm_field_int(dest_addr, UVM_ALL_ON)
    `uvm_field_int(payload, UVM_ALL_ON)
    `uvm_field_int(parity, UVM_ALL_ON)
  `uvm_object_utils_end

  function new(string name = "router_seq_item");
    super.new(name);
  endfunction
  
  // Post-randomize hook to calculate even parity
  function void post_randomize();
    parity = ^payload; 
  endfunction

endclass
