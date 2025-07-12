`include "test_run.sv"

module fifo_tb;

  // Instantiate the FIFO
  fifo #(.DATA_WIDTH(DATA_WIDTH),.DEPTH(DEPTH),.ADDR_WIDTH(ADDR_WIDTH)) uut (.clk(clk),.reset_n(reset_n),.write_en(write_en),.read_en(read_en),.data_in(data_in),.data_out(data_out),.full(full),.empty(empty),.almost_full(almost_full),.almost_empty(almost_empty),.overflow(overflow),.underflow(underflow)
  );
  //test handle
  test_run test_run_h;
  // Testbench procedure
  initial begin
    // Initialize signals
    clk = 0;
    reset_n = 0;
    write_en = 0;
    read_en = 0;
    data_in = 0;
    data_out_check = '0;

    //Start waveform
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    //test cases
    test_run_h=new();
    test_run_h.test_cases();


    // Report results
    if (error_count == 0) begin
      $display("\n!!  All tests completed successfully !!!!! \n");
    end else begin
      $display("Test completed with %0d errors", error_count);
    end

    $finish;
  end

endmodule
