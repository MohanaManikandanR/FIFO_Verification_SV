class simultaneous_read_write_empty_test;
  // Task for simultaneous read and write while empty test
    task simultaneous_read_write_empty_test_case();
      begin
        rst_gen rst_gen_h=new();
        data_out_check = data_out; // grab current output value to check if it changes
        // Call reset
        rst_gen_h.reset_test();

        // Attempt to write and read simultaneously
        write_en = 1;
        read_en = 1;
        data_in = 16'h1234;
        #10;
        //write_en = 0;
        read_en = 0;
        #10;
        if (data_out != data_out_check) begin
          $error("Simultaneous Read/Write While Empty Test: Data out should be unchanged on first simultaneous read/write");
          error_count++;
        end
        if (!underflow) begin
          $error("Simultaneous Read/Write While Empty Test: Underflow flag should be asserted on first simultaneous read/write");
          error_count++;
        end

        // Verify empty flag clears and almost empty is asserted
        if (empty) begin
          $error("Simultaneous Read/Write While Empty Test: FIFO should not be empty after first write");
          error_count++;
        end
        if (!almost_empty) begin
          $error("Simultaneous Read/Write While Empty Test: FIFO should be almost empty after first write");
          error_count++;
        end

        // Test valid simultaneous read and write
        write_en = 1;
        read_en = 1;
        data_in = 16'h5678;
        #10;
        write_en = 0;
        read_en = 0;
        #10;
        if (data_out != 16'h1234) begin
          $error("Simultaneous Read/Write While Empty Test: Data mismatch on simultaneous read/write: expected 16'h1234, got %0h", data_out);
          error_count++;
        end
        if (empty) begin
          $error("Simultaneous Read/Write While Empty Test: FIFO should not be empty after simultaneous read/write");
          error_count++;
        end
        if (!almost_empty) begin
          $error("Simultaneous Read/Write While Empty Test: FIFO should be almost empty after simultaneous read/write");
          error_count++;
        end
      end
    endtask
endclass
