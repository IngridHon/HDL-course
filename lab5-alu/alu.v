module alu #(parameter WIDTH = 8)(input wire [WIDTH-1:0] in_a, input wire[WIDTH-1:0] in_b, input wire[2:0] opcode, output reg [WIDTH-1:0] alu_out, output reg a_is_zero);
always @(*) begin
    case (opcode)//parametro opcode que irei olhar
        3'b000: begin 
            alu_out = in_a; 
            if (in_a == 0)
            a_is_zero = 1;
            else
            a_is_zero = 0;
            break;
        end
        3'b001: begin 
            alu_out = in_a; 
            if (in_a == 0)
            a_is_zero = 1;
            else
            a_is_zero = 0;
            break;
        end
        3'b010: begin 
            alu_out = in_a + in_b; 
            if (in_a == 0)
            a_is_zero = 1;
            else
            a_is_zero = 0;
            break;
        end
        3'b011: begin 
            alu_out = in_a & in_b; 
            if (in_a == 0)
            a_is_zero = 1;
            else
            a_is_zero = 0;
            break;
        end 
        3'b100: begin 
            alu_out = in_a ^ in_b; 
            if (in_a == 0)
            a_is_zero = 1;
            else
            a_is_zero = 0;
            break;
        end
        3'b101: begin 
            alu_out = in_b; 
            if (in_a == 0)
            a_is_zero = 1;
            else
            a_is_zero = 0;
            break;
        end
        3'b110: begin 
            alu_out = in_a; 
            if (in_a == 0)
            a_is_zero = 1;
            else
            a_is_zero = 0;
            break;
        end
        3'b111: begin 
            alu_out = in_a; 
            if (in_a == 0)
            a_is_zero = 1;
            else
            a_is_zero = 0;
            break;
        end


        default: 
    endcase
end
endmodule