// v1. Author: Nae-Chyun Chen
// v2. Author: Yan-Lun Wu
// 2019 Fall, Computer Architecture
// Lecturer: Prof. Yi-Chang Lu

`timescale 1ns/10ps
`define CYCLE       10
`define ENDCYCLE    1000
`ifdef SDF
	`define SDFFILE     "./matvecmult_syn.sdf"	  // Modify your sdf file name
`endif

`ifdef  tb1
  `define MATA		"./data/matrix_A_t1.dat"
  `define VECX		"./data/vector_x_t1.dat"
  `define VECB		"./data/vector_b_t1.dat"
  `define VECY		"./data/vector_y_t1.dat"
`endif
`ifdef  tb2
  `define MATA		"./data/matrix_A_t2.dat"
  `define VECX		"./data/vector_x_t2.dat"
  `define VECB		"./data/vector_b_t2.dat"
  `define VECY		"./data/vector_y_t2.dat"
`endif
`ifdef  tb3
  `define MATA		"./data/matrix_A_t3.dat"
  `define VECX		"./data/vector_x_t3.dat"
  `define VECB		"./data/vector_b_t3.dat"
  `define VECY		"./data/vector_y_t3.dat"
`endif

module testfixture();

    // parameter declare
    integer   i;

    // register declare
    reg [7:0]       vecx_mem   [0:15];
    reg [7:0]       vecy_mem   [0:15];
    reg [7:0]       vecb_mem   [0:15];
    reg [7:0]       golden     [0:15];
    reg				err_count;

    reg             CLK;
    reg             RST;
    reg  [127:0]	vector_b, vector_x;
    wire [127:0]	vector_y;
    reg  [127:0]	vector_y_gold;
    wire            finish;
    wire [3:0]		A;
    reg  [127:0]	Q;
    wire [127:0]	Q_SRAM;

    // module declare
    matvecmult main(
        .CLK(CLK),
        .RST(RST),
        .vector_x(vector_x),
        .vector_b(vector_b),
        .vector_y(vector_y),
        .Q(Q),
        .A(A),
        .finish(finish)
    );

    SRAM memory (
        .CLK(CLK),.D(128'dz),.A(A),.WEN(1'b1),.Q(Q_SRAM)
    );

    // for gate level netlist
    `ifdef SDF
        initial begin
			$sdf_annotate(`SDFFILE, main);
			@(posedge finish)
			$display("SDF File %s were used for this simulation.", `SDFFILE);
		end
    `endif

    // dump wave file
    initial begin
        $fsdbDumpfile("matvecmult.fsdb");
        $fsdbDumpvars(0,testfixture,"+mda");
    end

    // clock generate
    always #(`CYCLE/2) CLK  = ~CLK;

    // input patterns and golden
    initial	$readmemb (`VECB, vecb_mem);
    initial $readmemb (`VECX, vecx_mem);
    initial $readmemb (`VECY, vecy_mem);


    // -------------------  start here !!! ----------------------
    always@(*) begin
        Q = Q_SRAM;
        vector_x = {
            vecx_mem[15],vecx_mem[14],vecx_mem[13],vecx_mem[12],
            vecx_mem[11],vecx_mem[10],vecx_mem[9],vecx_mem[8],
            vecx_mem[7],vecx_mem[6],vecx_mem[5],vecx_mem[4],
            vecx_mem[3],vecx_mem[2],vecx_mem[1],vecx_mem[0]
        };
        vector_y_gold = {
            vecy_mem[15],vecy_mem[14],vecy_mem[13],vecy_mem[12],
            vecy_mem[11],vecy_mem[10],vecy_mem[9],vecy_mem[8],
            vecy_mem[7],vecy_mem[6],vecy_mem[5],vecy_mem[4],
            vecy_mem[3],vecy_mem[2],vecy_mem[1],vecy_mem[0]
        };
        vector_b = {
            vecb_mem[15],vecb_mem[14],vecb_mem[13],vecb_mem[12],
            vecb_mem[11],vecb_mem[10],vecb_mem[9],vecb_mem[8],
            vecb_mem[7],vecb_mem[6],vecb_mem[5],vecb_mem[4],
            vecb_mem[3],vecb_mem[2],vecb_mem[1],vecb_mem[0]
        };
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
    parameter DATA_WL   = 128,
    parameter ADDR_WL   = 4
)(
    input   CLK,
    input   [DATA_WL-1:0]   D,
    input   [ADDR_WL-1:0]   A, 
    input   WEN,
    
    output reg  [DATA_WL-1:0]   Q
);
    localparam DATA_WS  = 2**ADDR_WL;

    reg [DATA_WL-1:0]   ram[DATA_WS-1:0];
    // reg [63:0]     mata_mem   [0:7];
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
