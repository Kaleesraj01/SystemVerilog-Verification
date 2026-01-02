class driver;
  transaction trans ;
  mailbox gen2drv;
  virtual intf vif ;
  
  function new (virtual intf vif , mailbox gen2drv);
    this.gen2drv = gen2drv ;
    this.vif = vif ;
  endfunction 
  
  task go ();
    	
    repeat(4) begin 
  
      gen2drv.get(trans);
      @(negedge  vif.clk);
      #2;
      vif.rst <= trans.rst ;
      vif.wr_en <= trans.wr_en;
      vif.rd_en <= trans.rd_en;
      vif.wr_data <= trans.wr_data ;
      
      trans.display ("driver signal ");
      
    end 
      endtask 
      endclass
      
    
  
 
