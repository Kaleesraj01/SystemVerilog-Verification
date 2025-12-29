class generator ;
 transaction trans ;
  mailbox gen2drv;
  
  function new(mailbox gen2drv);
    this. gen2drv =  gen2drv;
  endfunction 
  
  task run ();
    repeat (4) begin
      trans = new();
      trans.randomize();
      
      trans.display ("signals of generator ");
      
      gen2drv.put(trans);
    end 
  endtask 
endclass 
    
    
