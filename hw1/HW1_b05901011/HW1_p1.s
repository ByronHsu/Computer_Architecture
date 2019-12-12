.data
str1: .asciiz	"Before sorting: \n"
str2: .asciiz	"\nResult:\n"
str3: .asciiz	"\n"
num: .word -1 3 -5 7 -9 2 -4 6 -8 10
str4: .asciiz   "\ni:\n"
str5: .asciiz   "\nj:\n"

.text
main:
    #print initiate
    li $v0, 4
    la $a0, str1
    syscall
    la $a0, num	#a0=num
    la $a1, 10
    jal prints
	
    #TODO
    la $a0, num	#a0=num
    la $a1, 10
    jal sort

    #print result
    li $v0, 4
    la $a0, str2
    syscall
    la $a0, num	#a0=num
    la $a1, 10
    jal prints
	
# -----
#  Done, terminate program.
    li	$v0, 10				# terminate
    syscall					# system call

.end main

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


    for1:
        bge $s1, $s3, exit1 # if (i >= length) exit
        addi $s2, $s1, -1 # s2: j, j = i - 1
                
        for2:
            slti $t0, $s2, 0 # if (j < 0) back to for1
            beq $t0, 1, exit2

            sll $t1, $s2, 2 # j -> byte addr
            add $t2, $s0, $t1 # get a[j]
            lw $t3, 0($t2)
            lw $t4, 4($t2)

            slt $t0, $t3, $t4 # if (a[j] < a[j + 1]) back to for1
            beq $t0, 1, exit2
            # swap a[j], a[j + 1]
            move $a0, $s0 # load args
            move $a1, $s2 # load args
            jal swap

            addi $s2, $s2, -1
            j for2
        exit2:
            addi $s1, $s1, 1
            j for1

    # =========================
    # Load Original S variable
    # =========================
    exit1:
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

prints:
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
    lw $s0, 0($sp)
    lw $s1, 4($sp)
    lw $s2, 8($sp)
    lw $s3, 12($sp)
    addi $sp, $sp, 16
    jr $ra
