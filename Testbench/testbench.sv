
// ------------------------------ Verification Plan ----------------------

/*
		Tried with the linear verification and complete class based verification 
        Linear: created the task: send data signal, which sends the input signal 


        In Class based, the complete Testbench environment is created which has different classes for randomizing and sending to DUT and receiving the ouput from the DUT and the scoreboard to check using the display statement which is time consuming, so assertions are added


*/

// ------------------------------------------------------------------------


`include "topC.svh"

module top;



  bit clk;

  inter_face intf(clk);

  edge_detect DUT (.clk(intf.clk), 
                   .in(intf.in), 
                   .Rise_Detect(intf.Rise_Detect),
                   .Fall_Detect(intf.Fall_Detect));
  test TEST ();

  // assertion binding
  bind edge_detect checkerflag  CFL(.clk(intf.clk), 
                                    .in(intf.in), 
                                    .Rise_Detect(intf.Rise_Detect),
                                    .Fall_Detect(intf.Fall_Detect));

  always #5 clk = ~clk;


  covergroup cvg_cg @(posedge clk);
    in_cp: coverpoint intf.in ;  // one way since it is of 1 bit

    rise_cp: coverpoint intf.Rise_Detect{
      bins zero = {0};
      bins ones = {1};
    }
    fall_cp : coverpoint intf.Fall_Detect{
      bins zero = {0};
      bins ones = {1};
    } 

  endgroup



  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0); 
      //       intf.in=0;

      d_config::vinf= intf;
    end

  //   cvg_cg CVG = new();
  cvg_cg CVG;
  
  initial
    begin
      CVG = new();
      CVG.sample();
      
      #1000 $finish;
    end

  
  
  
  // TO print the final value of the coverage
  final 
  begin
    $display("---------------------: Coverage: %f--------", CVG.get_coverage());
  end


endmodule




// // Linear Testbench to detect the risigng and falling edge

// module tb;

//   bit clk;
//   logic in;
//   logic Rise_Detect;
//   logic  Fall_Detect;

//   edge_detect DUT (.*);

//   always #5 clk = ~clk;

//   initial
//     begin
//       clk = 0;
//       $dumpfile("dump.vcd");
//       $dumpvars(0);
//     end


//   initial
//     begin
//       in=1;
//       repeat(2) @(posedge clk);
//       send_data();
//       send_data();
//       repeat(3) @(posedge clk);
//       send_data();
//       #100 $finish;
//     end



//   task send_data;
//     repeat(3) begin
//       in=0;
//       @(posedge clk);
//       in=1;
//       @(posedge clk);
//     end
//   endtask

// endmodule
