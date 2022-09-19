class generator;
  transaction txn;
  //   mailbox #(transaction) gen2drv;

  //   function new(mailbox gen2drv);
  //     this.gen2drv = gen2drv;
  //   endfunction
  //   int seed;
  //   function new();
  //     this.srandom($urandom(seed));
  //   endfunction



  task run;
    random_run();
    onlyzeros();
    onlyones();
    random_run();

  endtask



  task random_run;
    repeat(50) begin
      txn = new();
      assert (txn.randomize()) else $display("Not randomized");
      d_config::gen2drv.put(txn);
      //       $display("running from the generator %b adsf---",txn.in); 
    end
  endtask


  task onlyzeros;
    repeat(10) begin
      txn = new();
      assert (txn.randomize() with {in == 0;}) else $display("Not randomized");
      d_config::gen2drv.put(txn);
      //       $display("running from the generator %b adsf---",txn.in); 
    end

  endtask
  task onlyones;
    repeat(10) begin
      txn = new();
      assert (txn.randomize() with {in == 1;}) else $display("Not randomized");
      d_config::gen2drv.put(txn);
      //       $display("running from the generator %b adsf---",txn.in); 
    end

  endtask



endclass
