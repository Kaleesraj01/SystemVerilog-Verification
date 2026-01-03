`include "interface.sv"
`include "test.sv"
module tb ;
  intf intff ();
  
  initial  begin 
   
     intff.rst=1;
    	#10;
    	intff.rst=0;	
    intff.clk=0;
    
    forever #5 intff.clk = ~intff.clk ;
    
   
  end 
  
  
  test tstt (intff);
  fifo dut (.clk(intff.clk)  ,.wr_en(intff.wr_en ), .rd_en(intff.rd_en) , .wr_data(intff.wr_data) , .rd_data(intff.rd_data) , .full(intff.full) , .empty(intff.empty) ,  .rst(intff.rst)) ;
    
 
  initial begin 
    
    $dumpfile("fifo_tb.vcd");
    $dumpvars(0, tb);
  end
   
  
            
            endmodule 
    
  
