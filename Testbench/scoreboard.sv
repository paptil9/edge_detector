class scoreboard;

  //   mailbox #(transaction) pmon2scb;
  //   mailbox #(transaction) drv2scb;

  //   function new(mailbox drv2scb, mailbox pmon2scb);
  //     this.drv2scb = drv2scb;
  //     this.pmon2scb = pmon2scb;
  //   endfunction

  task run;
    transaction a_txn, p_txn;
    forever 
      begin
        d_config::pmon2scb.get(p_txn);
        d_config::drv2scb.get(a_txn);

        $display("From the scoreboard %b, Rise: %b Fall: %b", a_txn.in, p_txn.Rise_Detect, p_txn.Fall_Detect);
      end

  endtask

endclass
