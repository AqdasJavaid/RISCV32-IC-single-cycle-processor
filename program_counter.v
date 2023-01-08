/*iProgram counter
---------------------------------------------------------------------------
| rst	|   pc_sel	 |	 output
---------------------------------------------------------------------------
|  0	|	x    |    0
---------------------------------------------------------------------------
|  1	|	0    |    pc+2
---------------------------------------------------------------------------
|  1	|	1    |    pc+4
---------------------------------------------------------------------------
|  1	|	2    |    pc+imm
---------------------------------------------------------------------------*/

module program_counter#(parameter width = 32)(  

input clk,
input rst,
input [1:0]pc_sel,
output reg [width-1:0]pc,
input [width-1:0]rd  //alu_out

);

wire [width-1:0] count;

always@(posedge clk,negedge rst)  //active low reset
	begin
		case({rst,pc_sel})
			3'b100: pc <= pc + 2'd2;
			3'b101: pc <= pc + 3'd4;
			3'b110: pc <= rd;
			default: pc <= {width{1'b0}}; //active low reset
		endcase
	end

assign count = pc + 3'd4;

endmodule
