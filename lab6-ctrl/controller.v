module controller (input wire [2:0] opcode, phase, input wire zero, output reg sel, rd, ld_ir, halt, inc_pc, ld_ac, wr, ld_pc, data_e);
    always @ (*) begin
        case (phase) 
         3'b000: begin
            sel = 1;
            rd = 0;
            ld_ir = 0;
            halt = 0;
            inc_pc = 0;
            ld_ac = 0;
            wr = 0;
            ld_pc = 0;
            data_e = 0;
            break;
            end
            3'b001: begin
                sel = 1;
                rd = 1;
                ld_ir = 0;
                halt = 0;
                inc_pc = 0;
                ld_ac = 0;
                wr = 0;
                ld_pc = 0;
                data_e = 0;
                break;
            end
            3'b010: begin
                sel = 1;
                rd = 1;
                ld_ir = 1;
                halt = 0;
                inc_pc = 0;
                ld_ac = 0;
                wr = 0;
                ld_pc = 0;
                data_e = 0;
                break;
            end 
            3'b011: begin
                sel = 1;
                rd = 1;
                ld_ir = 1;
                halt = 0;
                inc_pc = 0;
                ld_ac = 0;
                wr = 0;
                ld_pc = 0;
                data_e = 0;
                break;
            end
            3'b100: begin
                sel = 0;
                rd = 0;
                ld_ir = 0;
                halt = (opcode == 3'b000) ? 1 : 0;
                inc_pc = 1;
                ld_ac = 0;
                wr = 0;
                ld_pc = 0;
                data_e = 0;
                break;
            end
            3'b101: begin
                sel = 0;
                if (opcode == 3'b010 || opcode == 3'b011 || opcode == 3'b100 || opcode == 3'b101)
                    rd = 1;
                else
                    rd = 0;
                ld_ir = 0;
                halt = 0;
                inc_pc = 0;
                ld_ac = 0;
                wr = 0;
                ld_pc = 0;
                data_e = 0;
                break;
            end
             3'b101: begin
                sel = 0;
                if (opcode == 3'b010 || opcode == 3'b011 || opcode == 3'b100 || opcode == 3'b101)
                    rd = 1;
                else
                    rd = 0;
                ld_ir = 0;
                halt = 0;
                inc_pc = (zero && opcode == 3'b001) ? 1 : 0;
                ld_ac = 0;
                wr = 0;
                ld_pc = (opcode == 3'b111) ? 1 : 0;
                data_e = (opcode == 3'b110) ? 1 : 0;
                break;
            end
            3'b111: begin
                sel = 0;
                if (opcode == 3'b010 || opcode == 3'b011 || opcode == 3'b100 || opcode == 3'b101) begin
                    rd = 1;
                    ld_ac = 1;
                end
                else begin
                    rd = 0;
                    ld_ac = 0;
                end 
                ld_ir = 0;
                halt = 0;
                inc_pc = 0;
                wr = (opcode == 3'b110) ? 1 : 0;
                ld_pc = (opcode == 3'b111) ? 1 : 0;
                data_e = (opcode == 3'b110) ? 1 : 0;
                break;
            end

        endcase
    end
    endmodule