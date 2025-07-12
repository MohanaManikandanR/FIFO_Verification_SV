`include "signals.sv"
`include "clk_gen.sv"
`include "rst_gen.sv"
`include "basic_wr_rd_test.sv"
`include "underflow_test.sv"
`include "overflow_test.sv"
`include "simultaneous_rd_wr_empty_test.sv"
`include "simultaneous_rd_wr_full_test.sv"
class test_run;
  //initial begin not used in class
  //handle
  clk_gen clk_gen_h;
  rst_gen  rst_gen_h;
  basic_wr_rd_test basic_wr_rd_test_h;
  underflow_test  underflow_test_h;
  overflow_test overflow_test_h;
  simultaneous_read_write_empty_test simultaneous_read_write_empty_test_h;
  simultaneous_read_write_full_test simultaneous_read_write_full_test_h;
  task test_cases();
    //new address
    clk_gen_h=new();
    rst_gen_h=new();
    basic_wr_rd_test_h=new();
    underflow_test_h=new();
    overflow_test_h=new();
    simultaneous_read_write_empty_test_h=new();
    simultaneous_read_write_full_test_h=new();
      //task 
      clk_gen_h.clock_gen();
      rst_gen_h.reset_test();
      basic_wr_rd_test_h.basic_write_read_test();
      underflow_test_h.underflow_test_case();
      overflow_test_h.overflow_test_case();
      simultaneous_read_write_empty_test_h.simultaneous_read_write_empty_test_case();
      simultaneous_read_write_full_test_h.simultaneous_read_write_full_test_case();
    endtask
endclass
    
    
