module counter
#(
  parameter integer WIDTH=5
 )
 (
  input  wire clk  ,
  input  wire rst  ,
  input  wire load ,
  input  wire enab ,
  input  wire [WIDTH-1:0] cnt_in ,
  output reg  [WIDTH-1:0] cnt_out 
 );

  
//////////////////////////////////////////////////////////////////////////////
//TO DO: DEFINE THE COUNTER COMBINATIONAL LOGIC using FUNCTION AS INSTRUCTED//
//////////////////////////////////////////////////////////////////////////////
function [WIDTH-1:0] cnt_func;
input rst, load, enab;
input [WIDTH-1:0] cnt_in;
input [WIDTH-1:0] cnt_out;

integer cont;
if (rst) begin
         cont <= {WIDTH{1'b0}};
         cnt_func <= cont; //reseta o valor de saida
    end
    else begin
        if (enab) begin
            if (load) begin
                cont <= cnt_in;
                cnt_func <= cont;
            end
            else begin
                cont <= cont + 1;
                cnt_func <= cont;
            end
        end
        else begin
            cnt_func <= 0;
        end
    end
endfunction
  always @(posedge clk)
     cnt_out <= cnt_func (rst, load, enab,cnt_in, cnt_out); //function call

endmodule
