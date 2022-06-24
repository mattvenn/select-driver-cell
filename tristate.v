`default_nettype none
module tristate_test(input wire active1, input wire active2, output wire [31:0] wbs_dat);

    wrapped_picorv32 pico1(
        .active(active1),
        .vccd1(1'b1),
        .vssd1(1'b0),
        .wbs_dat_o(wbs_dat)
        );

    wrapped_picorv32 pico2(
        .active(active2),
        .vccd1(1'b1),
        .vssd1(1'b0),
        .wbs_dat_o(wbs_dat)
        );

    `ifdef FORMAL
        always @(*)
            assume(active1 + active2 <= 1);
    `endif

endmodule
