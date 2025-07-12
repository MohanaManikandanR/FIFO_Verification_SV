class clk_gen;
  task clock_gen();
    fork 
    // Clock generation
      forever #5 clk = ~clk;
    join_none
  endtask
endclass
