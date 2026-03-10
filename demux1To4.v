module demux1To4(
    input [3:0] In, //4 bit data coming in
    input [1:0] Select, 
    input Enable,
    output [3:0] local_lib, local_fire, local_school, local_shack //4 bit data to reviever
);

assign local_lib    = (Select == 2'b00 ? In : 0) & {4{Enable}}; //Send to libary if 00 
assign local_fire   = (Select == 2'b01 ? In : 0) & {4{Enable}}; //Send to fire if 01
assign local_school = (Select == 2'b10 ? In : 0) & {4{Enable}}; //Send to school if 10
assign local_shack  = (Select == 2'b11 ? In : 0) & {4{Enable}}; //Send to shack if 11

endmodule