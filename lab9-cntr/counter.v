module counter #(parameter WIDTH = 5) (input wire enab, load, clk, rst, input wire [WIDTH-1:0] cnt_in, output reg [WIDTH-1:0] cnt_out);

reg [WIDTH-1:0] cont;

always @(posedge clk or posedge rst) //rst Assincrono

begin
    if (rst) begin
         cont <= {WIDTH{1'b0}};
         cnt_out <= cont; //reseta o valor de saida
    end
    else begin
        if (enab) begin
            if (load) begin
                cont <= cnt_in;
                cnt_out <= cont;
            end
            else begin
                cont <= cont + 1;
                cnt_out <= cont;
            end
        end
        else begin
            cnt_out <= 0;
        end
    end
    
end
    
endmodule