// Code your design here
// Code your design here module fifo #[()
  

module fifo #(parameter width=8 , depth =8) 
  ( input logic clk , rst , wr_en , rd_en ,
   input logic [width-1:0]wr_data ,
   output logic [width-1:0]rd_data ,
   output logic full , empty );
  
  logic [width-1:0] mem [0:depth-1]; // mem allocation ;
  
  localparam fifo_depth_log = $clog2(depth); // 3 
  
  logic [fifo_depth_log :0] wr_ptr , rd_ptr;
//   logic [$clog2(depth+1)-1:0] cnt ;
  
  //write condition 
  
  always @(posedge clk or posedge rst) begin
  if (rst) begin 
    wr_ptr <= 0 ;
//     cnt<=0;
  end 
    else if (wr_en==1 && !full ) begin 
      mem[wr_ptr[fifo_depth_log-1:0]] <= wr_data;
    wr_ptr <= wr_ptr+1 ;
  end 
  end 
    
  always@(posedge clk or posedge rst) 
    if (rst) begin
      rd_ptr <= 0 ;
      rd_data<=0;
//       cnt1<=0;
    end 
  else if  (rd_en==1&& !empty) begin
    rd_data <= mem[rd_ptr[fifo_depth_log-1:0]];
    rd_ptr <= rd_ptr+1 ;
  end 
    
  assign full = (({~wr_ptr[fifo_depth_log],wr_ptr[fifo_depth_log-1:0]})== (rd_ptr));
                               
  assign empty = (wr_ptr==rd_ptr);
endmodule
