//Code your design here
module dff (
  input logic  clk, rst ,
  input logic din ,
  output logic q);
  
  always @(posedge clk or posedge rst ) begin 
    if (rst)
      q<=1'b0;
    
    else 
      q<= din ;
    
  end 
endmodule 
