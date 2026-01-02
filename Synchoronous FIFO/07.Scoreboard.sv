class scoreboard ;
   transaction trans ;
  mailbox mon2scb;
  bit [7:0] q[$];   // reference model

  
  function new (mailbox mon2scb);
    this.mon2scb = mon2scb;
  endfunction
  
  task go ();
    
    bit[7:0] expected_data;
    
    
    repeat (4) begin 
      
      mon2scb.get(trans);
      //write 
      if (trans.wr_en && !trans.full) begin 
        q.push_back(trans.wr_data);
        $display("scbwrite =%0b",trans.wr_data);
      end
       // read
      if (trans.rd_en && !trans.empty) begin 
        if (q.size()==0 ) begin
          $error("READ when reference FIFO empty!");
        end 
        else begin
          expected_data = q.pop_front();
     
      
      if(expected_data === trans.rd_data)
        $display ("MATCH trans.rd_data=%0b",trans.rd_data);
      else 
        $display("MISMATCH   ,  exp data=%0b  , act data =%0b ",expected_data,trans.rd_data  );
      
        end
          
      end
    end 
//        -> trans.done;
  endtask 
endclass 

    
  
  
   
