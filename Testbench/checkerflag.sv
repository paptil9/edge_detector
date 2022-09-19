module checkerflag(input clk, in, Rise_Detect, Fall_Detect);

  // Assertions are added here
  property s1;
    $rose(in) |-> Rise_Detect
  endproperty

  RiseDetection: assert property (@(posedge clk) s1 );
  FallDetection: assert property (@(posedge clk) $fell(in) |-> Fall_Detect);


endmodule
