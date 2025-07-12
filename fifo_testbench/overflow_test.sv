class overflow_test;
  // Task for overflow test
    task overflow_test_case();
      begin
        // Fill the FIFO completely
        for (int i = 0; i < DEPTH; i++) begin
          write_en = 1;
          data_in = i;
          #10;
          write_en = 0;
          #10;
        end

        // Attempt to write additional data
        write_en = 1;
        data_in = 16'hFFFF;
        #10;
        write_en = 0;
        if (!overflow) begin
          $error("Overflow Test: Overflow flag should be asserted");
          error_count++;
        end

        // Read out all values and verify
        for (int i = 0; i < DEPTH; i++) begin
          read_en = 1;
          #10;
          read_en = 0;
          if (data_out != i) begin
            $error("Overflow Test: Data mismatch at index %0d: expected %0d, got %0d", i, i, data_out);
            error_count++;
          end
          #10;
        end

        // Ensure the overflowed value is not in the FIFO
        read_en = 1;
        #10;
        read_en = 0;
        if (!empty) begin
          $error("Overflow Test: FIFO should be empty after reading all values");
          error_count++;
        end
      end
    endtask
endclass
