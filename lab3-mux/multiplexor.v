module mutiplexor #(parameter WIDTH = 5)(input reg [WIDTH:0] in0, input reg [WIDTH:0] in1, input reg sel, output wire [WIDTH:0] mux_out in1);

  always @(*)  //(*) se qualquer uma das entradas mudarem ele aciona
    begin
     
     if (sel == 1'b0)
     mux_out = in0;
     else
     mux_out = in1;
    end

endmodule