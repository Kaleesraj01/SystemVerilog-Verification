class transaction ;
  rand bit din;
  bit rst;
  bit q ;
  
  function void display (string name );
    $display ("_______=====%0s=====________", name );
    $display ("din=%0b , q = %0b, rst=%b", din , q ,rst);
  endfunction 
endclass 
    
  
 
 
