// v1. Author: Nae-Chyun Chen
// v2. Author: Yan-Lun Wu
// 2019 Fall, Computer Architecture
// Lecturer: Prof. Yi-Chang Lu

module matvec2x2(
    CLK,
    RST,
    vector_x,
    vector_y,
    Q,
    A,
    finish
);

input               CLK;
input               RST;
input       [15:0]  vector_x;
output reg  [15:0]  vector_y;
input       [15:0]  Q;
output reg          A;
output reg          finish;

integer             i;
reg     [7:0]       vector_x_r [0:1], vector_x_w [0:1];
reg     [7:0]       part_matrix_a_r [0:1], part_matrix_a_w [0:1];
reg     [7:0]       vector_y_r [0:1], vector_y_w [0:1];
reg                 finish_r, finish_w;
reg     [7:0]       temp;
reg                 counter_r, counter_w;

always @(*) begin
    // vector_x_w: stores input data x
    vector_x_w[0]=vector_x[7:0];
    vector_x_w[1]=vector_x[15:8];
    // vector_y_w: stores output data y
    vector_y_w[1] = vector_y_r[1];
    vector_y_w[0] = vector_y_r[0];
    // part_matrix_a_w: stores input data from A
    part_matrix_a_w[0]=Q[7:0];
    part_matrix_a_w[1]=Q[15:8];

    // temp: computes a1*x1+a2*x2
    temp = 
        vector_x_w[0]*part_matrix_a_w[1]+
        vector_x_w[1]*part_matrix_a_w[0];

    finish_w = 1'b0;
    counter_w = counter_r;

    if (RST)
        counter_w = 1'b0;
    else if (counter_r < 1'b1) begin
        counter_w = counter_r + 1'b1;
        vector_y_w[0] = vector_y_r[0]+temp;
    end
    else begin
        // counter_r=1; prepare to raise finish_r and compute vector_y_w[1]
        finish_w = 1'b1;
        if (finish_r==1'b0)
            vector_y_w[1] = vector_y_r[1]+temp;
    end
    
    // output
    vector_y = { vector_y_r[1],vector_y_r[0] };
    finish = finish_r; // finish_r;
    A = counter_w;
end


always @(posedge CLK or posedge RST) begin
    if (RST) begin
        // reset
        counter_r <= 1'b0;
        finish_r <= 1'b0;
        // Note that the usage of 'for' in Verilog is different with c++
        for (i=0;i<2;i=i+1) begin
            vector_y_r[i] <= 1'b0;
            part_matrix_a_r[i] <= 1'b0;
        end
        // vector_y_r[1] <= 0;
        // vector_y_r[0] <= 0;
        // part_matrix_a_r[1] <= 0;
        // part_matrix_a_r[0] <= 0;
    end
    else begin
        counter_r <= counter_w;
        finish_r <= finish_w;
        for (i=0;i<2;i=i+1) begin
            vector_y_r[i] <= vector_y_w[i];
            part_matrix_a_r[i] <= part_matrix_a_w[i];
        end
        // vector_y_r[1] <= vector_y_w[1];
        // vector_y_r[0] <= vector_y_w[0];
        // part_matrix_a_r[1] <= part_matrix_a_w[1];
        // part_matrix_a_r[0] <= part_matrix_a_w[0];
    end
end

endmodule