module memory #(parameter AWIDTH = 5, DWIDTH = 8) (input wire clk, rd, wr input wire [AWIDTH-1:0] addr, inout wire [DWIDTH-1:0] data);//inout é entrada e saída

    reg [DWIDTH-1:0] register [2**AWIDTH-1:0];//2**5 = 32
    reg [DWIDTH-1:0] data_out;

    assign data = (rd) ? data_out : {DWIDTH{1'bz}};//se rd for 1, data = data_out, senão, data = 8'bzzzzzzzz

    always @(posedge clk) begin
        if (wr) begin
            register[addr] <= data;
        end
        else if (rd) begin
            data_out <= register[addr];
        end
    end

    endmodule