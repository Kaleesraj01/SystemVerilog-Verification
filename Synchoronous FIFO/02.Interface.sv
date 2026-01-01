interface intf #(parameter int WIDTH = 8);

  logic              wr_en;
  logic              rd_en;
  logic              full;
  logic              empty;
  logic [WIDTH-1:0]  wr_data;
  logic [WIDTH-1:0]  rd_data;
  logic              clk;
  logic              rst;

endinterface
