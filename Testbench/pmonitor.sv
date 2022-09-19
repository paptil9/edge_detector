class pmonitor;

  transaction txn;
  virtual inter_face vinf;

  //   mailbox #(transaction) pmon2scb;

  function new();
    this.vinf = d_config::vinf;

  endfunction


  task run;
    forever
      begin
        @(negedge vinf.clk);
        txn = new();
        txn.Fall_Detect = vinf.Fall_Detect;
        txn.Rise_Detect = vinf.Rise_Detect;

        d_config::pmon2scb.put(txn);

        $display("From the passive monitor txn.Fall_Detect: %b txn.Rise_Detect: %d ", txn.Fall_Detect, txn.Rise_Detect);

      end

  endtask

endclass
