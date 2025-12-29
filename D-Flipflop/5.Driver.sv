class driver ;
  transaction trans ;
  mailbox gen2drv;
  virtual intf vif ;
  
  function new (virtual intf vif ,mailbox gen2drv);
      this.vif = vif ;
    this.gen2drv =  gen2drv;
  endfunction 
  
  task run ();
   
    repeat(4) begin 
      gen2drv.get(trans);
      
      @(negedge vif.clk ) ;
      vif.din <= trans.din;
        vif.rst <= trans.rst;
      trans.display(" signal of driver class ");
    end
  endtask
endclass 
      
      
   
