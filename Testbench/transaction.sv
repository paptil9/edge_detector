class transaction;

  rand logic in;

  logic Rise_Detect, Fall_Detect, Next_input;

  //   constraint binary_dist { in dist {0:=80, 1:=50}; } 
  constraint binary { soft in inside {0,1}; } 

endclass
