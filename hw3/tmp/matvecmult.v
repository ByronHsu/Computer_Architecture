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
reg [7:0]   vector_x_r [0:15], vector_x_w[0:15];
reg [7:0]   part_matrix_a_r[0:15], part_matrix_a_w[0:15];
reg [7:0]   vector_y_r  [0:15], vector_y_w[0:15];
reg [7:0]   vector_b_r  [0:15], vector_b_w[0:15];
reg finish_r, finish_w;
reg [7:0]   temp;
reg [3:0] counter_r, counter_w;

always @(*) begin
    for(i=0;i<16;i=i+1) begin
        vector_x_w[i] = vector_x[8*i+:8];
    end
    
    for(i=0;i<16;i=i+1) begin
        vector_b_w[i] = vector_b[8*i+:8];
    end

    for(i=0;i<16;i=i+1) begin
        vector_y_w[i] = vector_y_r[i];
    end

    for(i=0;i<16;i=i+1) begin
        part_matrix_a_w[i] = Q[8*i+:8];
    end

    temp = 
        vector_x_w[15] * part_matrix_a_w[0] +
        vector_x_w[14] * part_matrix_a_w[1] +
        vector_x_w[13] * part_matrix_a_w[2] +
        vector_x_w[12] * part_matrix_a_w[3] +
        vector_x_w[11] * part_matrix_a_w[4] +
        vector_x_w[10] * part_matrix_a_w[5] +
        vector_x_w[9] * part_matrix_a_w[6] +
        vector_x_w[8] * part_matrix_a_w[7] +
        vector_x_w[7] * part_matrix_a_w[8] +
        vector_x_w[6] * part_matrix_a_w[9] +
        vector_x_w[5] * part_matrix_a_w[10] +
        vector_x_w[4] * part_matrix_a_w[11] +
        vector_x_w[3] * part_matrix_a_w[12] +
        vector_x_w[2] * part_matrix_a_w[13] +
        vector_x_w[1] * part_matrix_a_w[14] +
        vector_x_w[0] * part_matrix_a_w[15];

    finish_w = 1'b0;
    counter_w = counter_r;

    if (RST)
        counter_w = 1'b0;
    else if (counter_r < 4'd15) begin
        counter_w = counter_r + 1'b1;
        vector_y_w[counter_r] = vector_y_r[counter_r] + 2 * temp + vector_b_w[counter_r];  
    end
    else begin
        finish_w = 1'b1;
        if (finish_r==1'b0)
            vector_y_w[15] = vector_y_r[15] + 2 * temp + vector_b_w[15];
    end

    vector_y = {vector_y_r[15], vector_y_r[14], vector_y_r[13], vector_y_r[12], vector_y_r[11], vector_y_r[10], vector_y_r[9], vector_y_r[8], vector_y_r[7], vector_y_r[6], vector_y_r[5], vector_y_r[4], vector_y_r[3], vector_y_r[2], vector_y_r[1], vector_y_r[0]};
    finish = finish_r;
    A = counter_w;
end


always @(posedge CLK or posedge RST) begin
    if (RST) begin
        // reset
        counter_r <= 1'b0;
        finish_r <= 1'b0;

        for(i=0;i<16;i=i+1) begin
            vector_y_r[i] <= 1'b0;
            part_matrix_a_r[i] <= 1'b0;
        end
    end
    else begin
        // current state logic
        counter_r <= counter_w;
        finish_r <= finish_w;

        for(i=0;i<16;i=i+1) begin
            vector_y_r[i] <= vector_y_w[i];
            part_matrix_a_r[i] <= part_matrix_a_w[i];
        end
    end
end

endmodule