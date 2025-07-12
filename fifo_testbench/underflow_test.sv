class underflow_test;
  // Task for underflow test
    task underflow_test_case();
      begin
        rst_gen rst_gen_h=new();
        data_out_check = data_out;
        // Load a single value
        write_en = 1;
        data_in = 16'hA5A5;
        #10;
        write_en = 0;
        #10;

        rst_gen_h.reset_test();

        // Attempt to read while empty
        read_en = 1;
        #10;
        read_en = 0;
        if (!underflow) begin
          $error("Underflow Test: Underflow flag should be asserted");
          error_count++;
        end
        if (data_out != data_out_check) begin
          $error("Underflow Test: Data out should be unchanged from last read value when underflow occurs.");
          error_count++;
        end
        //else $warning("Read Data %0d", data_out);
      end
    endtask
endclass

  
