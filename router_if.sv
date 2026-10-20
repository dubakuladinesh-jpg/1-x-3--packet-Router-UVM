// SystemVerilog Interface for 1x3 Packet Router
interface router_if(input bit clk);
  logic       reset;
  logic       valid;
  logic [1:0] dest_addr;
  logic [7:0] payload;
  logic       parity;
endinterface
