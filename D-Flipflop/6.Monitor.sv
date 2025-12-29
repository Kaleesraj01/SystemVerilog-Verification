class monitor ;
  transaction trans ;
  mailbox mon2scr;
  virtual intf vif ;
  
  function new (virtual intf vif ,mailbox mon2scr);
  this.vif = vif ;
    this.mon2scr = mon2scr ;
    endfunction
  
  task run ();
    repeat(4)
  begin
    
    trans = new();
    
   
   
    @(posedge vif.clk );
    #1; 
    
    trans.din = vif.din;
    trans.rst = vif.rst;
    trans.q   = vif.q; 
    trans.display("mon cls signal");
      mon2scr.put(trans);
    
  end
  endtask 
endclass 
    
    
    
