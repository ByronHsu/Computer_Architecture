// v1. Author: Nae-Chyun Chen
// v2. Author: Yan-Lun Wu
// 2019 Fall, Computer Architecture
// Lecturer: Prof. Yi-Chang Lu

`timescale 1ns/10ps
`define CYCLE       100
`define ENDCYCLE    1000

module testfixture();
    // parameter declare
    integer         i;
    reg             err_count;

    // register declare
    reg             CLK;
    reg             RST;
    reg     [7:0]   x;
    wire    [7:0]   max;
    wire    [2:0]   argmax;
    wire            finish;

    // module declare
    findmax main(
        .CLK(CLK),
        .RST(RST),
        .x(x),
        .max_r(max),
        .argmax_r(argmax),
        .finish_r(finish)
    );

    // dump wave file
    initial begin
        $fsdbDumpfile("findmax.fsdb");
        $fsdbDumpvars(0,testfixture,"+mda");
    end

    // clock generate
    always #(`CYCLE/2) CLK  = ~CLK;

    // -------------------  start here !!! ----------------------
    initial begin
        CLK = 0;
        RST = 0;
        x=9;
        @(negedge CLK)  RST = 1;
        #(`CYCLE*2)     RST = 0;
        @(posedge CLK)#1  x = 8;
        @(posedge CLK)#1  x = 3;
        @(posedge CLK)#1  x = 4;
        @(posedge CLK)#1  x = 5;
        @(posedge CLK)#1  x = 6;
        @(posedge CLK)#1  x = 7;
        @(posedge CLK)#1  x = 1;
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
        if (max == 9 && argmax==0)
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
            $display("Your answer   : (%2d, %2d)", max, argmax);
            $display("Correct answer: (%2d, %2d)", 9, 0);
        $finish;
    end

    // check time-out
    initial begin
        #(`CYCLE*`ENDCYCLE);
        $display("Time-out Error! Maybe there is something wrong with the 'finish' signal \n");
        $finish;
    end

endmodule