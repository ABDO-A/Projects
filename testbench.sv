module 16bit_CPU;
  
  reg signed [15:0] a, b; 
  reg signed [15:0] exp;
  reg [2:0] op;
  
  wire ex;
  wire signed [15:0] z;
  
  reg ok, flag, tmp, zero;
  
  yAlu mine(z, ex, a, b, op);
  
  initial
    begin
		
      repeat(10)
        begin
          a = $random; b = $random; tmp = $random % 2;
          if (tmp === 0) b = a;
          
          flag = $value$plusargs("op=%d", op);
          if (flag === 0) $display("missing input: op");
          
          if (op === 0) exp = a & b;
          else if (op === 1) exp = a | b;
          else if (op === 2) exp = a + b;
          else if (op === 6) exp = a - b;
          else if (op === 7) exp = (a<b) ? 1:0;
          else $display("not supported op");
          zero = (exp === 0)? 1:0;
           
          #1;	// delay 

          if(zero === ex) 
            ok = 1;
          else 
            ok = 0;
          $display("ok=%d a=%d b=%d op=%d z=%d zero=%2d ex=%2d", ok, a, b, op, z, zero, ex);
          
          if(exp === z)
            $display("Pass: op=%d a=%d b=%d z=%d expect=%d", op, a, b, z, exp);
          else 
            $display("Fail: op=%d a=%d b=%d z=%d expect=%d", op, a, b, z, exp);
        end     
    $finish;
    end
endmodule
