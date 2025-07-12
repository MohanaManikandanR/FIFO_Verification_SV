class rst_gen;
  task reset_test();
    // Apply reset
    #10 reset_n = 0;
    #10 reset_n = 1;

     // Verify empty flag is set
      if (!empty) $fatal("Simultaneous Read/Write While Empty Test: FIFO should be empty after reset");
  endtask
endclass
