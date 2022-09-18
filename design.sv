// CANDIDATE NAME : Prajwal Patil
//-------------------------------------------------------------------------
// SPECIFICATION: Create a logical circuit that detects the edge of a
// signal and reports which edge--a rising edge or falling edge-
// accounting for starting and reset events.
//
// Note: If there is no edge change, no signal flag(s) should be asserted.
//-------------------------------------------------------------------------
// DUT Description :
/*
				Input signal: in 
                Output signal: Rise_Detect (to detect the rising edge of the signal)
                			   Fall_Detect (to detect the falling edge of the in(input) signal)
*/


//-------------------------------------------------------------------------
// Describe all your assumptions
//-------------------------------------------------------------------------
///////////////////////////

/*
		Questions : * With respect note given, should there be an extra signal for no edge change?
        			* What exactly accounting for start and reset events?

		Assumption: * I created two output flag signals, assumed that  the output flag signals should not be asserted on the no edge change, so will be in 0.
        			* Thought that the flags should be detected even in the reset and start event
                    * Did not add the reset signal 
*/

///////////////////////////
// Code your DUT here
module edge_detect ( input logic clk, in,
                    output logic Rise_Detect, Fall_Detect
                   );

  logic delay;


  always_ff@(posedge clk) 
    begin
      delay <= in;
    end

  always_comb
    begin
      Rise_Detect = in & ~delay;
      Fall_Detect = ~in & delay;
      //      $display("in:%d  -=====>>>> Rise_Detect: %b, Fall_Detect: %b", in, Rise_Detect, Fall_Detect);
    end

  //   // Assertions are added here
  //   property s1;
  //     $rose(in) |-> Rise_Detect
  //   endproperty

  //   c1: assert property (@(posedge clk) s1 );
  //   c2: assert property (@(posedge clk) $fell(in) |-> Fall_Detect);


endmodule




  
//   always_comb
//     begin
//       if(Rise_Detect=='x)
//         Rise_Detect = '0;
//       else 
//         Rise_Detect =  in & ~delay;;


//       if(Fall_Detect=='x)
//         Fall_Detect = '0;
//       else 
//         Fall_Detect = ~in & delay;;
//     end
