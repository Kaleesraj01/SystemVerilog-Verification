class scoreboard ;
 // transaction trans ;
  mailbox mon2scr;
  
  function new (mailbox mon2scr);
    this.mon2scr = mon2scr;
  endfunction
  
  reg exp_q;
  
  task run();
    
    transaction trans;
    repeat (4) begin 
      
      mon2scr.get(trans);
      
      exp_q=(trans.rst==1)?1'b0:trans.din;
      
      if(exp_q==trans.q)
        $display ("++++++ PASS +++++");
      
      else 
        
        $display ("====== FAIL =====");
    end 
  endtask 
endclass 
        
  
  
 
 
