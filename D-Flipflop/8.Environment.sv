`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"


class environment;
  generator gen;
  transaction trans;
  monitor mon;
  scoreboard scr;
  driver drv;
  mailbox mon2scr;
  mailbox gen2drv;
  virtual intf vif ;
  
  function new ( virtual intf vif);
    
  
    gen2drv = new();
      mon2scr = new();
    gen     = new(gen2drv);
    drv     = new (vif , gen2drv);
    mon     = new (vif , mon2scr);
    scr     = new (mon2scr);
    
  endfunction 
  
  task run();
    
    fork //start all together
      gen.run();
      drv.run();
      mon.run();
      scr.run();
    join 
  endtask
  
endclass
    
   
