module branch_comp #(parameter width = 32)(

input signed [width-1:0]src1,
input signed [width-1:0]src2,
input br_un,  //branch unsigned
output reg br_lt,
output reg br_eq
);

always @(*)
	begin
		if(br_un)
			br_lt = ($unsigned(src1) < $unsigned(src2));
		else
			begin
				br_eq = (src1 == src2);
				br_lt = (src1 < src2);
			end
	end

endmodule
