module kernel (
    input         i_clk,
    input [1175:0] i_pixel_data, 
    input         i_pixel_data_valid,
    output reg [23:0] o_convolved_data,
    output reg     o_convolved_data_valid
);

    integer i;
    reg [7:0] kernel[0:48];  
    reg [31:0] multData[0:48];
    reg [31:0] sumR, sumG, sumB; 
    reg        multDataValid;
    reg [23:0] avgPixel;

    initial begin
        for (i = 0; i < 49; i = i + 1)
            kernel[i] = 8'd1;
    end

    always @(posedge i_clk) begin
        for (i = 0; i < 49; i = i + 1) begin
            multData[i] <= kernel[i] * i_pixel_data[i*24 +: 24];
        end
        multDataValid <= i_pixel_data_valid;
    end

    always @(posedge i_clk) begin
        sumR = 0; sumG = 0; sumB = 0;
        for (i = 0; i < 49; i = i + 1) begin
            sumR = sumR + multData[i][23:16];
            sumG = sumG + multData[i][15:8];
            sumB = sumB + multData[i][7:0];
        end

        avgPixel[23:16] <= sumR / 49;
        avgPixel[15:8]  <= sumG / 49;
        avgPixel[7:0]   <= sumB / 49;

        o_convolved_data <= avgPixel;
        o_convolved_data_valid <= multDataValid;
    end

endmodule
