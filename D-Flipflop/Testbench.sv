`include "interface.sv"
`include "test.sv"

module tb;
  
  intf intff(); // interface
   initial begin
    intff.clk = 0;
    forever #5 intff.clk = ~intff.clk;
  end
  initial begin
    intff.rst=1;
    #5;
    intff.rst=0;//deassert rst;
  end
  
  test tst (intff); // rtest 
  
  dff dut (.clk (intff.clk), .din(intff.din) , .q(intff.q) , .rst(intff.rst) );
  
endmodule 
