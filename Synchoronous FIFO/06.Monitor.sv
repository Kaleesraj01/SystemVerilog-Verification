class monitor ;
  transaction trans;
  mailbox mon2scb;
  virtual intf vif ;
  
  function new (virtual intf vif , mailbox mon2scb  );
    
    this.vif = vif ;
    this.mon2scb = mon2scb;
    
  endfunction 
  
  task go ();
    repeat(6) begin 
      
      trans = new();
      @(posedge vif.clk);
      #1;  
      trans.rst = vif.rst ;
      trans.wr_en = vif.wr_en;
      trans.rd_en = vif.rd_en;
      trans.wr_data = vif.wr_data;
      trans.rd_data = vif.rd_data;
      trans.full = vif.full ;
      trans.empty = vif.empty;
      
      trans.display ("monitor signals ");
      
      mon2scb.put(trans );
    end endtask 
      
endclass 
    
  
