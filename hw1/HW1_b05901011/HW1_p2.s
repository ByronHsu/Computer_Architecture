.data
str3:   .asciiz	"\t"
str4:   .asciiz	"\n"
data_i:	.word 208, 37, 181, 125, 192, 90, 20, 154, 28, 35
        .word 231, 108, 9, 114, 66, 51, 14, 68, 246, 222
        .word 33, 234, 71, 165, 130, 65, 136, 167, 2, 148
        .word 233, 203, 12, 181, 179, 158, 199, 176, 198, 141
        .word 162, 245, 25, 193, 228, 121, 239, 191, 209, 37
        .word 25, 168, 210, 71, 245, 90, 34, 115, 222, 218
        .word 72, 10, 178, 174, 140, 212, 146, 22, 22, 159
        .word 140, 217, 81, 168, 36, 150, 120, 59, 102, 90
        .word 245, 239, 243, 42, 39, 141, 4, 233, 67, 131
        .word 247, 174, 9, 31, 66, 234, 86, 39, 205, 103
        .word 41, 194, 112, 128, 215, 73, 42, 211, 111, 20
        .word 248, 190, 98, 245, 65, 194, 203, 138, 233, 62
        .word 245, 101, 196, 87, 208, 193, 80, 255, 47, 32
        .word 124, 168, 203, 150, 63, 98, 135, 20, 68, 47
		.word 205, 44, 48, 58, 237, 145, 43, 113, 38, 62
data_o:	.word 0, 0, 0, 0, 0, 0, 0, 0
        .word 0, 0, 0, 0, 0, 0, 0, 0
        .word 0, 0, 0, 0, 0, 0, 0, 0
        .word 0, 0, 0, 0, 0, 0, 0, 0
        .word 0, 0, 0, 0, 0, 0, 0, 0
        .word 0, 0, 0, 0, 0, 0, 0, 0
        .word 0, 0, 0, 0, 0, 0, 0, 0
        .word 0, 0, 0, 0, 0, 0, 0, 0
        .word 0, 0, 0, 0, 0, 0, 0, 0
        .word 0, 0, 0, 0, 0, 0, 0, 0
        .word 0, 0, 0, 0, 0, 0, 0, 0
        .word 0, 0, 0, 0, 0, 0, 0, 0
        .word 0, 0, 0, 0, 0, 0, 0, 0
buffer:	.word 0,  0,  0,  0,  0,  0,  0,  0,  0	#You may store nine value here and sort it

.text
main:

    #print result
    la $a1, data_o
    la $s2, 13  #smaller rows
    la $s3, 8   #smaller cols

    move $s1, $a1 # load data_o to s1
    la $s0, data_i # load data_i t0 s0
    la $s6, buffer # load buffer to s6

    li $s4, 0 # r = 0
medianfor1:
    bge $s4, $s2, medianexit1 # if(r >= 13) break
    li $s5, 0 # c = 0
medianfor2:
    bge $s5, $s3, medianexit2 # if(c >= 8) break

    # buffer[0] = data_i[r][c]
    li $a0, 0 # t2: store buffer index
    addi $a1, $s4, 0
    addi $a2, $s5, 0
    jal assign

    # buffer[1] = data_i[r][c + 1]
    li $a0, 1
    addi $a1, $s4, 0
    addi $a2, $s5, 1

    jal assign

    # buffer[2] = data_i[r][c + 2]
    li $a0, 2
    addi $a1, $s4, 0
    addi $a2, $s5, 2

    jal assign

    # buffer[3] = data_i[r + 1][c]
    li $a0, 3
    addi $a1, $s4, 1
    addi $a2, $s5, 0

    jal assign

    # buffer[4] = data_i[r + 1][c + 1]
    li $a0, 4
    addi $a1, $s4, 1
    addi $a2, $s5, 1

    jal assign

    # buffer[5] = data_i[r + 1][c + 2]
    li $a0, 5
    addi $a1, $s4, 1
    addi $a2, $s5, 2

    jal assign

    # buffer[6] = data_i[r + 2][c]
    li $a0, 6
    addi $a1, $s4, 2
    addi $a2, $s5, 0

    jal assign

    # buffer[7] = data_i[r + 2][c + 1]
    li $a0, 7
    addi $a1, $s4, 2
    addi $a2, $s5, 1

    jal assign

    # buffer[8] = data_i[r + 2][c + 2]
    li $a0, 8
    addi $a1, $s4, 2
    addi $a2, $s5, 2

    jal assign

    # la $a0, buffer
    # la $a1, 9
    # jal printline

    la $a0, buffer
    la $a1, 9
    jal sort
    lw $t0, 16($s6)

    # data_o[r][c] = t0
    mul $t1, $s4, $s3 # offset = r * in_col
    add $t1, $t1, $s5 # offset += c
    sll $t1, $t1, 2 # offset -> byte addr
    add $t1, $s1, $t1
    sw $t0, 0($t1)
    # la $a0, buffer
    # la $a1, 9
    # jal printline
    # la $a1, data_o
    # jal prints

    addi $s5, $s5, 1 # c = c + 1
    j medianfor2
medianexit2:
    addi $s4, $s4, 1 # r = r + 1
    j medianfor1
medianexit1:
    la $a1, data_o
    jal prints
    # -----
    #  Done, terminate program.
    li	$v0, 10				# terminate
    syscall					# system call
.end main
	
assign:
    # Function: assign data_i[r][c] to buffer[i]
    # Args: a0: i, a1: r, a2: c
    addi $t0, $s3, 2 # out_c = in_c + 2
    mul $t0, $a1, $t0 # offset = r * out_c
    add $t0, $t0, $a2 # offset += c
    sll $t0, $t0, 2 # offset = offset * 4
    add $t1, $s0, $t0 # addr = offset + data_i[0]
    lw $t2, 0($t1) # t2 = a[r][c]
    sll $t0, $a0, 2 # -> byte
    add $t3, $s6, $t0 # t3 = &buffer[i]
    sw $t2, 0($t3) # buffer[i] = t2
    jr $ra

prints:
    la $t0, 0				#i
printforloop1:
    bge $t0, $s2, printexit1
    la $t1, 0				#j
printforloop2:
    bge $t1, $s3, printexit2

    li $v0, 1 				# print_int
    lw $t2, 0($a1)
    move $a0, $t2
    syscall
    li $v0, 4
    la $a0, str3
    syscall
    addi $a1, $a1, 4
    #j=j+1
    addi $t1, $t1, 1
    j printforloop2
printexit2:
    #i=i+1
    li $v0, 4
    la $a0, str4
    syscall
    addi $t0, $t0, 1
    j printforloop1
printexit1:
    jr $ra

printline:
    addi $sp, $sp, -16
    sw $s3, 12($sp)
    sw $s2 8($sp)
    sw $s1, 4($sp)
    sw $s0, 0($sp)

    move $s0, $zero
    move $s2, $a0
    move $s3, $a1
printloop:
    bge $s0, $s3, printexit
    sll $s1, $s0, 2
    add $t2, $s2, $s1
    lw $t3, 0($t2)
    li $v0, 1 # print_int
    move $a0, $t3
    syscall

    li $v0, 4
    la $a0, str3
    syscall 

    addi $s0, $s0, 1
    j printloop
printexit:
    li $v0, 4
    la $a0, str3
    syscall

    lw $s0, 0($sp)
    lw $s1, 4($sp)
    lw $s2, 8($sp)
    lw $s3, 12($sp)
    addi $sp, $sp, 16
    jr $ra

# non-leaf function, so it need to temporarily store $s, $a, $ra
sort:
# =========================
# Save Original S variable
# =========================
addi $sp, $sp, -20
sw $ra, 16($sp)
sw $s3, 12($sp)
sw $s2, 8($sp)
sw $s1, 4($sp)
sw $s0, 0($sp)
# ==========================

move $s0, $a0 # move a[] to s0
move $s3, $a1 # move length to s3
li $s1, 0 # s1: i, i = 0


sortfor1:
    bge $s1, $s3, sortexit1 # if (i >= length) exit
    addi $s2, $s1, -1 # s2: j, j = i - 1
            
    sortfor2:
        slti $t0, $s2, 0 # if (j < 0) back to sortfor1
        beq $t0, 1, sortexit2

        sll $t1, $s2, 2 # j -> byte addr
        add $t2, $s0, $t1 # get a[j]
        lw $t3, 0($t2)
        lw $t4, 4($t2)

        slt $t0, $t3, $t4 # if (a[j] < a[j + 1]) back to sortfor1
        beq $t0, 1, sortexit2
        # swap a[j], a[j + 1]
        move $a0, $s0 # load args
        move $a1, $s2 # load args
        jal swap

        addi $s2, $s2, -1
        j sortfor2
    sortexit2:
        addi $s1, $s1, 1

        # la $a0, buffer
        # la $a1, 9
        # jal printline
        j sortfor1

# =========================
# Load Original S variable
# =========================
sortexit1:
lw $s0, 0($sp)
lw $s1, 4($sp)
lw $s2, 8($sp)
lw $s3, 12($sp)
lw $ra, 16($sp)
addi $sp, $sp, 20
jr $ra
# ==========================



swap:
    sll $t1, $a1, 2
    add $t1, $a0, $t1
    lw $t0, 0($t1)
    lw $t2, 4($t1)
    sw $t2, 0($t1)
    sw $t0, 4($t1)
    jr $ra