// v1. Author: Nae-Chyun Chen
// v2. Author: Yan-Lun Wu
// 2019 Fall, Computer Architecture
// Lecturer: Prof. Yi-Chang Lu

module findmax(
    CLK,
    RST,
    x,
    max_r,
    argmax_r,
    finish_r
);

input               CLK;
input               RST;
input       [7:0]   x;
output reg  [7:0]   max_r;
output reg  [3:0]   argmax_r;
output reg          finish_r;

reg     [7:0]       max_w;
reg     [3:0]       argmax_w;
reg     [2:0]       counter_r, counter_w;
reg                 finish_w;

always @(*) begin
    max_w = max_r;
    argmax_w = argmax_r;
    finish_w = 1'b0;
    counter_w = counter_r;

    if (RST) begin
        counter_w = 1'b0;
    end
    else if (counter_r < 3'b111) begin
        counter_w = counter_r + 1'b1;
    end
    else begin
        finish_w = 1;
    end

    if ( x>max_r && finish_r==1'b0 ) begin
        max_w = x;
        argmax_w = counter_r;
    end
end



always @(posedge CLK or posedge RST) begin
    if (RST) begin
        // reset
        counter_r <= 1'b0;
        finish_r <= 1'b0;
        max_r <= 1'b0;
        argmax_r <= 1'b0;
    end
    else begin
        counter_r <= counter_w;
        finish_r <= finish_w;
        max_r <= max_w;
        argmax_r <= argmax_w;
    end
end

endmodule