module counter (
    input wire clk,
    input wire rst,
    output reg [3:0] count
);
    // Standard synchronous reset block for ISO 26262 functional safety
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 4'b0000;
        end else begin
            count <= count + 1'b1;
        end
    end
endmodule
