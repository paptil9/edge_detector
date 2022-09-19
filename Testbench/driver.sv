class driver;

  transaction txn;
  virtual inter_face vinf;
  //   mailbox #(transaction) gen2drv;
  //   mailbox #(transaction) drv2scb;

  function new();
    this.vinf=d_config::vinf;
    //     this.gen2drv=gen2drv;
    //     this.drv2scb=drv2scb;
  endfunction

  task run;
    forever begin
      @(posedge vinf.clk);
      d_config::gen2drv.get(txn);
      vinf.in = txn.in;

      d_config::drv2scb.put(txn); 
      $display("running from the driver %d  -----------",txn.in);
    end


  endtask


endclass
