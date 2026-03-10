module mux4To1 (
    input [3:0] is_CEO, is_Me, is_Fred, is_Jill, //4-bit data 
    input [1:0] Select,
    input Enable,
    output [3:0] Y //4 bit output going to demux
);

    assign Y = (Select == 2'b00 ? is_CEO   : //If 00, then CEO
               Select  == 2'b01 ? is_Me    : //If 01, then Myself
               Select  == 2'b10 ? is_Fred  : is_Jill) & {4{Enable}}; //If 10, then Fred, else Jill

endmodule