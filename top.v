module top(
    input [15:0] sw,
    input btnL, btnU, btnD, btnR, btnC,
    output[15:0] led
);

wire [3:0] connect;
wire [1:0] muxSel, demuxSel;

assign muxSel   = {btnU, btnL}; //Sel[1] = btnU, Sel[0] = btnL
assign demuxSel = {btnR, btnD}; //Sel[1] = btnR, Sel[0] = btnD

mux4To1 mux(
    .is_CEO(sw[3:0]),
    .is_Me(sw[7:4]),
    .is_Fred(sw[11:8]),
    .is_Jill(sw[15:12]),
    .Select(muxSel), //Pick the sender
    .Enable(btnC), //Enables the system
    .Y(connect) //data goes to demux
);

demux1To4 demux(
    .In(connect), //data coming from mux
    .Select(demuxSel), //Select the reviever
    .Enable(btnC), //Enable the system
    .local_lib(led[3:0]),
    .local_fire(led[7:4]),
    .local_school(led[11:8]),
    .local_shack(led[15:12])
);

endmodule