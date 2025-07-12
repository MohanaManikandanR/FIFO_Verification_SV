class basic_wr_rd_test;
  // Task for basic write and read test
    task basic_write_read_test();
      begin
        // Write values from 0 to DEPTH-1
        for (int i = 0; i < DEPTH; i++) begin
          write_en = 1;
          data_in = i;
          #10;
          write_en = 0;
          #10;
        end

        // Check full flag
        if (!full) begin
          $error("Basic Write/Read Test: FIFO should be full");
          error_count++;
        end

        // Read values back and verify
        for (int i = 0; i < DEPTH; i++) begin
          read_en = 1;
          #10;
          read_en = 0;
          if (data_out != i) begin
            $error("Basic Write/Read Test: Data mismatch at index %0d: expected %0d, got %0d", i, i, data_out);
            error_count++;
          end
          #10;
        end

        // Check empty flag
        if (!empty) begin
          $error("Basic Write/Read Test: FIFO should be empty");
          error_count++;
        end

        // Check overflow and underflow flags
        if (overflow) begin
          $error("Basic Write/Read Test: FIFO should not overflow");
          error_count++;
        end
        if (underflow) begin
          $error("Basic Write/Read Test: FIFO should not underflow");
          error_count++;
        end
      end
    endtask
endclass
