class generator ;
  transaction trans ;
  mailbox gen2drv;
//   event done ;
  function new (mailbox gen2drv);
    this.gen2drv = gen2drv ;
  endfunction 
  
  task go();
    repeat (4) begin 
      
      trans = new();
      
      assert(trans.randomize());
      
      gen2drv.put(trans);
      
      trans.display ( " generator signals ");
//       @(done);
    end 
    $display("------------");
  endtask
endclass 
