module inputBuffer (
    input         i_clk,
    input         i_rst,
    input  [23:0] i_data, 
    input         i_data_valid,
    output [167:0] o_data,
    input         i_rd_data
);

    reg [23:0] line [0:1023]; 
    reg [9:0] wrPtr;
    reg [9:0] rdPtr; 

    always @(posedge i_clk) begin
        if (i_data_valid)
            line[wrPtr] <= i_data;
    end

    always @(posedge i_clk) begin
        if (i_rst)
            wrPtr <= 10'd0;
        else if (i_data_valid)
            wrPtr <= wrPtr + 10'd1;
    end

    always @(posedge i_clk) begin
        if (i_rst)
            rdPtr <= 10'd0;
        else if (i_rd_data)
            rdPtr <= rdPtr + 10'd1;
    end

    assign o_data = {
        line[rdPtr],
        line[rdPtr + 1],
        line[rdPtr + 2],
        line[rdPtr + 3],
        line[rdPtr + 4],
        line[rdPtr + 5],
        line[rdPtr + 6]
    };

endmodule
