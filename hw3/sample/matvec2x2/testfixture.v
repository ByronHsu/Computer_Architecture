// v1. Author: Nae-Chyun Chen
// v2. Author: Yan-Lun Wu
// 2019 Fall, Computer Architecture
// Lecturer: Prof. Yi-Chang Lu

`timescale 1ns/10ps
`define CYCLE       100
`define ENDCYCLE    1000
`define VECX        "./data/vector_x.dat"

`ifdef  tb1
  `define MATA		"./data/matrix_A_t1.dat"
  `define VECY		"./data/vector_y_t1.dat"
`endif
`ifdef  tb2
  `define MATA		"./data/matrix_A_t2.dat"
  `define VECY		"./data/vector_y_t2.dat"
`endif


module testfixture();

    // parameter declare
    integer   i;

    // register declare
    reg [7:0]       vecx_mem   [0:2];
    reg [7:0]       vecy_mem   [0:2];
    reg [7:0]       golden     [0:2];
    reg [14:0]      err_count;

    reg             CLK;
    reg             RST;
    wire [15:0]     vector_y;
    reg  [15:0]     vector_x;
    reg  [15:0]     vector_y_gold;
    wire            finish;
    wire            A;
    reg  [15:0]     Q;
    wire [15:0]     Q_SRAM;

    // module declare
    matvec2x2 main(
        .CLK(CLK),
        .RST(RST),
        .vector_x(vector_x),
        .vector_y(vector_y),
        .Q(Q),
        .A(A),
        .finish(finish)
    );

    SRAM memory (
        .CLK(CLK),.D(16'dz),.A(A),.WEN(1'b1),.Q(Q_SRAM)
    );

    // dump wave file
    initial begin
        $fsdbDumpfile("matvec2x2.fsdb");
        $fsdbDumpvars(0,testfixture,"+mda");
    end

    // clock generate
    always #(`CYCLE/2) CLK  = ~CLK;

    // input patterns and golden
    initial $readmemb (`VECX, vecx_mem);
    initial $readmemb (`VECY, vecy_mem);


    // -------------------  start here !!! ----------------------
    always@(*) begin
        Q = Q_SRAM;
        vector_x      = { vecx_mem[1],vecx_mem[0] };
        vector_y_gold = { vecy_mem[1],vecy_mem[0] };
    end

    initial begin
        CLK = 0;
        RST = 0;
        @(negedge CLK)  RST = 1;
        #(`CYCLE*2)     RST = 0;
    end

    // ------------------ verify !!! --------------------
    initial begin	
        $display("-----------------------------------------------------\n");
        $display("START!!! Simulation Start .....\n");
        $display("-----------------------------------------------------\n");
        err_count = 0;
        #(`CYCLE*3);
        i = 0;	

        @(posedge finish)
        #(`CYCLE);
        if (vector_y == vector_y_gold)
            err_count = 0;
        else 
            err_count = 1;
        if ( err_count == 0) begin
            $display("============================================\n");
            $display(" Congratulations!!! Your answer is correct! \n");
			$display("			 .**,.                                          		   ");
			$display("                  ,/////(///(//(,                                    ");
			$display("                 ,       /,/,                                        ");
			$display("                          **                                         ");
			$display("                          .**                                        ");
			$display("                         */(((((((##(((*.                            ");
			$display("                     ,(((((((((/     ,((((((/.                       ");
			$display("                  ./((/.   ./(/        ((((((((*                     ");
			$display("                ,((((,       **     O  .(((((((((/                   ");
			$display("              .((((((    O .  / /#(     /    ./@((((                 ");
			$display("             ((((((((     ./* ,* ##    ,.  .,    ,(((,               ");
			$display("            (((((((/.*     (@,#@@(   ,*  ,,     .**(((               ");
			$display("           /((((/     ,,    *##,.##   ,.    .,*,.   .((              ");
			$display("          *((((    .**.      #@@#@*    *,,           *(*             ");
			$display("          (((#**.               /      ,*,,,.       .*((             ");
			$display("          ((...         ..      .,               .,*  /(.  .,*,,     ");
			$display("          ((        .*,       .*#@@@@@@@@@@@@@@@@/    /(,.*     .*   ");
			$display("          ((.  ,*,       ,(@@#@@@@@@@@@@@@@@@@@@@,    ((.,        *  ");
			$display("          /((,*    ./#@@@@@@successfully!@@@@@@@#     #/*,        *  ");
			$display("          .((,   ,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,    ,#(((*     .*   ");
			$display("      ...  .((.   .#@@@@@@@@@@@@@@@#(///////#@@,     (((((((((*      ");
			$display("    ,     * *((     @@@@@@@(/////////////////((     /#((((((((       ");
			$display("  ,.       .  ((.    .@@##//////////////////(.     .((((((((*        ");
			$display("  *         ((((#,      /(////////////////(.     ,@#(((((((          ");
			$display("   *       (((((((@(       ,/(///////(/*.      *#@((((((#.           ");
			$display("     ,**((((((((((((#@*                    .(@@@(((((((.             ");
			$display("         ,((((((((((((#@@#/,.         .,(#@@@(. (((((.               ");
			$display("            ((((((((((((((##@@@@@@@@(,,(#*.      (((                 ");
			$display("               ,/(((((((((,       /*,,,**/ .***  (/(                 ");
			$display("                     .(((( ,......*..##*.*   *. *((.                 ");
			$display("                       (((/ *     .*,.*,*..* ./(((#*                 ");
			$display("                       ((((((,..*/*,***,,,((((((((..                 ");
			$display("                      ,,(((((((((((###((((((((((*   ,                ");
			$display("                      *  *((((((((/.*   *          ..                ");
			$display("                       ..        ..     ..       ..                  ");
			$display("                        ..     ..  *      ..   ..                    ");
			$display("                          .....             ...          			   ");
            $display("============================================\n");
            end
        else
            $display("The result is incorrect QAQ. \n");
            $display("Your answer   : %b", vector_y);
            $display("Correct answer: %b", vector_y_gold);
        $finish;
    end

    // check time-out
    initial begin
        #(`CYCLE*`ENDCYCLE);
        $display("Time-out Error! Maybe there is something wrong with the 'finish' signal \n");
        $finish;
    end

endmodule


module SRAM #(
    parameter DATA_WL   = 16,
    parameter ADDR_WL   = 1
)(
    input   CLK,
    input   [DATA_WL-1:0]   D,
    input   [ADDR_WL-1:0]   A, 
    input   WEN,
    
    output reg  [DATA_WL-1:0]   Q
);
    localparam DATA_WS  = 2**ADDR_WL;

    
    reg [DATA_WL-1:0]   ram[DATA_WS-1:0];
    // reg                 mata_mem   [0:7];
    initial $readmemb (`MATA, ram);
    
    always @(posedge CLK)begin
        if (!WEN)begin
            ram[A] <= D;
            Q  <= D;
        end else begin
            Q  <= ram[A];
        end
    end

endmodule
