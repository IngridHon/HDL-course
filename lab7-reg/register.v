module register #(parameter WIDTH = 8) (input wire clk, rst, load, input wire [WIDTH-1:0] data_in, output reg [WIDTH-1:0] data_out);

    reg [WIDTH-1:0] regist;

    always @(posedge clk) begin
        
      if (rst)  begin
        regist <= 0;
        data_out <= 0;
        end
        else if (load) begin
            regist <= data_in;
            data_out <= data_in;
        end
        else begin
            data_out <= regist;
        end
    end

    endmodule