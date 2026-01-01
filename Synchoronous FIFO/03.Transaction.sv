class transaction   #(parameter int width = 8); 
  rand logic[width-1:0] wr_data ;
  logic [width-1:0] rd_data;
  rand bit  wr_en , rd_en ;
  bit rst;
  logic full ;
  logic empty;
  
  //constraint raj {rst dist {1:=20,0:=80};}
  constraint raju_wr { wr_en dist {1:=80, 0:=20}; }
  constraint raju_rd { rd_en dist {1:=80, 0:=20}; }

  
  
  
  function  void display (string signame);
    $display("%s",signame);
    $display ("rst=%0b , wr_en=%0b , rd_en=%0b , wr_data=%0b ,rd_data=%0b ", rst , wr_en , rd_en, wr_data , rd_data);
    
    endfunction 
  
endclass 
