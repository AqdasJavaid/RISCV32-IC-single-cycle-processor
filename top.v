
module AKEANA_PO_AJ (input clk,rst);

wire [31:0]pc,inst,rs1,rs2,rd,imm,imm_c,imm_w,w_data,src1,src2,data_mem_R;
wire [4:0]addr_src1,addr_src2,addr_A,addr_B,addr_D,opcode;
wire [3:0]alu_sel;
wire [2:0]opr,mode,func3,imm_sel;
wire [1:0]sel,pc_sel,wb_sel;
wire reg_we,func7_5th_bit,c_inst_flag,br_eq,br_lt,br_un,B_sel,A_sel,data_mem_we;

assign rs1 = A_sel ? pc:src1;
assign rs2 = B_sel ? imm:src2;
assign imm = c_inst_flag ? imm_c :imm_w;
assign w_data = (wb_sel==0) ? data_mem_R:
				(wb_sel==1) ? rd :
				(wb_sel==2) ? pc +3'd4: 32'd0;


program_counter i_program_counter(.*);
inst_mem i_inst_mem (.*);
alu i_alu(.*);
register_file i_register_file(.*);
decompressor i_decompressor(.*);
branch_comp i_branch_comp(.*);
controller i_controller(.*);
data_mem i_data_mem(.*,.addr(rd[9:0]));
imm_generator i_imm_generator (.*,.imm_val(inst[31:7]));

endmodule
