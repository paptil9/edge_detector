

class environment;

  //   static mailbox #(transaction) gen2drv = new();
  // //   mailbox #(transaction) drv2scb = new();
  //  static mailbox #(transaction) pmon2scb = new();

  //   virtual inter_face vinf;

  generator gen;
  driver drv; 
  pmonitor pmon;
  scoreboard scb;

  function new ();
    //     this.vinf=d_config::vinf;
    gen = new();
    drv = new();
    pmon = new();
    scb = new(); 
  endfunction

  task run();
    fork
      gen.run();
      drv.run();
      scb.run();
      pmon.run();
    join
  endtask


endclass
