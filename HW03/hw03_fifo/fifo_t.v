// Put your file header here
//

module stimulus;
  parameter period = 20;
  parameter delay = 2;

  // declare the signals here

  fifo fifo1 (
    // LAB NOTE:
    // complete the port connection here
  );

  always #(period/2) clk = ~clk;

  initial begin
    `ifdef SYNTHESIS
      $sdf_annotate("fifo_syn.sdf", fifo1);
      $fsdbDumpfile("fifo_syn.fsdb");
    `else
      $fsdbDumpfile("fifo.fsdb");
    `endif
    $fsdbDumpvars;
  end

  initial begin
    clk = 1;
    rst_n = 1;
    idle;
    #(period);
    #(delay)  rst_n = 0;
    #(period*4) rst_n = 1;

    //  
    // Insert an timing offset between clock and reset
    //
//    #(period/2*5+delay) rst_n = 1;
//    #(period/2-delay);
    #(period*2);


    //
    // NOTE: Make the test patterns as comlete as you can.
    //       You can change all of them.
    //
    #(period) idle;
    #(period) popping;
    #(period) pushing(8'd1);
    #(period) idle;
    #(period) pushing(8'd2);
    #(period) pushing(8'd3);
    #(period) popping;
    #(period) pushing(8'd4);
    #(period) invalid;
    #(period) popping;
    #(period) pushing(8'd5);
    #(period) popping;
    #(period) idle;
    #(period) idle;
    #(period) idle;
    #(period) idle;

    ...
    ...
    ...


    #(period) idle;
    #(period*4);
    $finish;
  end

  // tasks
  task idle;
    begin
      push = 0;
      pop = 0;
      datain = 8'b0;
    end
  endtask
  task pushing;
    input [7:0] data;
    begin
      push = 1;
      pop = 0;
      datain = data;
    end
  endtask
  task popping;
    begin
      push = 0;
      pop = 1;
    end
  endtask
  task invalid;
    begin
      push = 1;
      pop = 1;
    end
  endtask
endmodule
