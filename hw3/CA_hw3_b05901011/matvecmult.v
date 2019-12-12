module matvecmult(
    CLK,
    RST,
    vector_x,
    vector_b,
    vector_y,
    Q,
    A,
    finish
);

input               CLK;
input               RST;
input       [127:0]	vector_x;
input       [127:0]	vector_b;
output  reg [127:0]	vector_y;
input       [127:0]	Q;
output  reg [3:0]   A;
output  reg         finish;

// declaration
integer i;
reg [7:0] y_r [15:0];
reg [7:0] y_w [15:0];
reg [7:0] temp;

reg [7:0] x [0:15], b [0:15], w [0:15];
reg [7:0] counter_w, counter_r;

always @(*) begin
    // for convenient
    for(i=0;i<16;i=i+1) begin
        x[i] = vector_x[8*i+:8];
    end
    
    for(i=0;i<16;i=i+1) begin
        b[i] = vector_b[8*i+:8];
    end

    for(i=0;i<16;i=i+1) begin
        w[i] = Q[8*i+:8];
    end

    for(i=0;i<16;i=i+1) begin
        y_w[i] = y_r[i];
    end

    temp = 
        x[15] * w[0] +
        x[14] * w[1] +
        x[13] * w[2] +
        x[12] * w[3] +
        x[11] * w[4] +
        x[10] * w[5] +
        x[9] * w[6] +
        x[8] * w[7] +
        x[7] * w[8] +
        x[6] * w[9] +
        x[5] * w[10] +
        x[4] * w[11] +
        x[3] * w[12] +
        x[2] * w[13] +
        x[1] * w[14] +
        x[0] * w[15];
    
    counter_w = counter_r;
    finish = 1'b0;
    
    if (RST) begin
        counter_w = 1'b0;
        // output
        finish = 1'b0;
    end
    else if (counter_r < 8'd16) begin
        counter_w = counter_r + 1'b1;
        y_w[counter_r] = 2 * temp + b[counter_r];
    end
    else begin
        // output
        finish = 1'b1;
    end

    // output
    A = counter_w;
    vector_y = {y_r[15], y_r[14], y_r[13], y_r[12], y_r[11], y_r[10], y_r[9], y_r[8], y_r[7], y_r[6], y_r[5], y_r[4], y_r[3], y_r[2], y_r[1], y_r[0]};
end


always @(posedge CLK or posedge RST) begin
    if (RST) begin
        // reset
        counter_r <= 1'b0;

        for(i=0;i<16;i=i+1) begin
            y_r[i] <= 1'b0;
        end
    end
    else begin
        counter_r <= counter_w;
        for(i=0;i<16;i=i+1) begin
            y_r[i] <= y_w[i];
        end
    end
end

endmodule