.data
	str1: .asciiz "The highest score is: "
	str2: .asciiz "Traceback result:\n"
	nextline: .asciiz "\n"
    space: .asciiz "\t"
	
#####################################################

# This part may change on different testing data
# 1
	seq1: .asciiz "ACACACTA"
	seq2: .asciiz "AGCACACA"
    score: .word 0:81
	dir: .word 0:81

.text

main:	
    li $s0, 8 # seq 1 length
    li $s1, 8 # seq 2 length

# 2
# 	seq1: .asciiz "CAAGAATGTCACAGGTCCAT"
# 	seq2: .asciiz "CAGCATCACACTTA"
# 	score: .word 0:315	#(len1 + 1) * (len2 + 1)
# 	dir: .word 0:315


# .text
# 	main:	
# 		li $s0, 20		#seq 1 length
# 		li $s1, 14		#seq 2 length

# 3
#     seq1: .asciiz "TGCCGAGGCGTCGAGAGACGATAATAGTAGCCAAGCACCTATGGGTCTCCATGTGGCTTTCTTCTCTTGAGTCGCGAGATTACTCTGTCATCAAGTGATCCGTGTAGATTCGCAGTCGAATCAGACGAGAATCCGAAGCTTGCGAAGAGGTTATTTTTAGATTTTGTTTGTTTTTCACATAGCACGGGATGAGGATGTTA"
#     seq2: .asciiz "TTTCTAACGCGGTTGACCCGCTACTTCAACTGTGATCCGCAAAATTAGTTACTTAATTACCTCGGAGACTTTTGTGGTCATACTGTAAGCGTGTGTCTAAATTTACTATGATCACGAGGCGACATGAAGTAGTTTCTCTTTTGATCCTGAACGTACATGAGCCTGTACCGACGAGCAGCCAACTTTGCTGTAAATGGGAT"
#     score: .word 0:40401
#     dir: .word 0:40401


# .text
#     main:
#         li $s0, 200
#         li $s1, 200


#4

#     seq1: .asciiz "CCTGCAAGCC"
#     seq2: .asciiz "ACCTGCACAAATCAAGTTGCTGGGATTGAGCACCGGATGATGGGTCAATAAACCTATGCCAGACTCGATGGCGGGGCGCTGATGGAGCTA"
#     score: .word 0:1001
#     dir: .word 0:1001


# .text
#     main:
#         li $s0, 10
#         li $s1, 90

# 5
#     seq1: .asciiz "AAACTTTTCACGGCCCCGCCATTGAGTAAATCGAGGATTCGAGATCGGCATAGTATTGGCTCGACGGTGAATTAGGATTTGCCTGCTAGCCTCCTCGCGGGAATTAAGTCTTAGAATAGACTCTTACTAATATCCCGCCTTTCATTATTGGTGTTGATTAAAAATTCGCATAGCTAATTTTGACTAAGTATGTAGGCCATCACCAAGGCTGAACGGAGTAGTGATAGGCTCCCCGTCATCTAGGGTTATCGCCTC"
#     seq2: .asciiz "GTCCCACACCGCACCATACGCTATTCCATTGGATGGGAATTCCTAGAAGCTGCCTGGAAGCCTTAGCATTAGTGTAGGTATGCCGGGCGGATGCCGGAGTACGACACGTCGTATGTTTATACATGTCCCGCCAACACGAACTTCGTAAGAAGTCTTACCCTGGAGACGTTTAGATTCGCGCCCCCTACGAGAGGAGCTTACCCTCTATTTTAATTTCTCCGAAACGAAAGCAAACCACCTAAAACCCTACAATAT"
#     score: .word 0:65536
#     dir: .word 0:65536


# .text
#     main:
#         li $s0, 255
#         li $s1, 255

#####################################################


# Mapping:
#   $s0: l1
#   $s1: l2
#   $s2: s1ptr
#   $s3: s2ptr
#   $s4: scoreptr
#   $s5: dirptr
#   $s6: max_dirptr
#   $s7: max_score
#   $t0: i
#   $t1: j
#   $t2: l2 + 1

# Todo
	la $s2, seq1 
    la $s3, seq2
    la $s4, score
    la $s5, dir

    # max_score = 0
    li $s7, 0
    # t2 = 4 * (l1 + 1)
    addi $t2, $s0, 1
    sll $t2, $t2, 2
    
    # scoreptr = scoreptr + 4 * (l1 + 1) + 4 * 1;
    add $s4, $s4, $t2
    addi $s4, $s4, 4
    # dirptr = dirptr + (l1 + 1) + 1;
    add $s5, $s5, $t2
    addi $s5, $s5, 4
    li $t0, 0 # i = 0
    for1:
        bge $t0, $s1, for1end # if(i > l2) break
        la $s2, seq1 # s1ptr = (char*) s1.c_str()
        li $t1, 0 # j = 0
    for2:
        # Tmp mapping:
        #   t5: match_term
        #   t6: left_term
        #   t7: up_term
        bge $t1, $s0, for2end # if(j > l1) break
        lb $t3, 0($s2) # t3 = *s1ptr
        lb $t4, 0($s3) # t4 = *s2ptr

        # match_score = (*s1ptr) == (*s2ptr)? MATCH: MISMATCH
        # t5: match_score
        bne $t3, $t4, else # if(t3 != t4) match_score = -3 
        li $t5, 3 # MATCH
        j endif
        else:
        li $t5, -1 # MISMATCH
        endif:

        # match_term = (*(scoreptr - (l1 + 1) - 1)) + match_score
        # t3: match_term addr
        sub $t3, $s4, $t2
        addi $t3, $t3, -4
        # t3: *(scoreptr - (l1 + 1) - 1)
        lw $t3, 0($t3)
        # t5: (*(scoreptr - (l1 + 1) - 1)) + match_score
        add $t5, $t3, $t5

        # left_term = (*(scoreptr - 1)) + GAP
        # t3: left_term addr
        addi $t3, $s4, -4
        # t3: *(scoreptr - 1)
        lw $t3, 0($t3)
        # t6: *(scoreptr - 1) + GAP
        addi $t6, $t3, -2 # GAP

        # up_term = (*(scoreptr - (l1 + 1))) + GAP
        # t3: up_term addr
        sub $t3, $s4, $t2
        # t3: *(scoreptr - (l1 + 1))
        lw $t3, 0($t3)
        # t7: *(scoreptr - (l1 + 1)) + GAP
        addi $t7, $t3, -2


        # if(left_term >= up_term && left_term >= match_term)
        blt $t6, $t7, left_endif
        blt $t6, $t5, left_endif
        li $t3, 1
        sw $t3, 0($s5)
        sw $t6, 0($s4)
        left_endif:
        
        # if(up_term >= left_term && up_term >= match_term)
        blt $t7, $t6, up_endif
        blt $t7, $t5, up_endif
        li $t3, 2
        sw $t3, 0($s5)
        sw $t7, 0($s4)
        up_endif:

        # if(match_term >= up_term && match_term >= left_term)
        blt $t5, $t7, match_endif
        blt $t5, $t6, match_endif
        li $t3, 3
        sw $t3, 0($s5)
        sw $t5, 0($s4)
        match_endif:

        # if(left_term < 0 && up_term < 0 && match_term < 0)
        li $t3, 0
        bge $t5, $t3, zero_endif
        bge $t6, $t3, zero_endif
        bge $t7, $t3, zero_endif
        sw $t3, 0($s5)
        sw $t3, 0($s4)
        zero_endif:

        # if(*scoreptr >= max_score)
        lw $t3, 0($s4) # t3 = *scoreptr
        blt $t3, $s7, max_endif # condition
        move $s7, $t3 # max_score = *scoreptr
        move $s6, $s5 # max_dirptr = dirptr
        
        max_endif:
        addi $s4, $s4, 4 # scoreptr += 4
        addi $s5, $s5, 4 # dirptr += 4
        addi $s2, $s2, 1 # s1ptr += 1
        addi $t1, $t1, 1 # j++
        j for2
    for2end:
        addi $s4, $s4, 4 # scoreptr += 4
        addi $s5, $s5, 4 # dirptr += 4
        addi $s3, $s3, 1 # s2ptr += 1
        addi $t0, $t0, 1 # i++
        j for1
    for1end:
    # # print score and dir matrix
    # la $t0, score
    # move $a1, $t0
    # jal print

    # li $v0, 4
    # la $a0, nextline
    # syscall

    # la $t0, dir
    # move $a1, $t0
    # jal print

    # li $v0, 4
    # la $a0, nextline
    # syscall

    # print the highest score
    # "The highest score is: "
    li $v0, 4
    la $a0, str1
    syscall

    # print max_score
    li $v0, 1
    move $a0, $s7
    syscall

    
    # nextline
    li $v0, 4
    la $a0, nextline
    syscall

    # ====================
    # Traceback
    # ====================

    # "Traceback result:\n"
    li $v0, 4
    la $a0, str2
    syscall

    trace_while:
    li $t4, 0
    lw $t3, 0($s6) # t3 = *(max_dirptr)
    beq $t3, $t4, trace_whileend

    # print now_dir
    li $v0, 1
    move $a0, $t3
    syscall

    li $t4, 1
    bne $t3, $t4, dir1_endif
    addi $s6, $s6, -4 # traceptr = traceptr - 1;
    dir1_endif:
    
    li $t4, 2
    bne $t3, $t4, dir2_endif
    sub $s6, $s6, $t2 # traceptr = traceptr - (l1 + 1);
    dir2_endif:
    
    li $t4, 3
    bne $t3, $t4, dir3_endif
    # traceptr = traceptr - 1 - (l1 + 1);
    sub $s6, $s6, $t2
    addi $s6, $s6, -4
    dir3_endif:
    
    j trace_while
    trace_whileend:

    #  Done, terminate program.
    li	$v0, 10	
    syscall
.end main


# =========
# Utils
# =========

# Function Name: 
#   print
# Arguments:
#   $a1: (s0 x s1) matrix
# Mapping: 
#   $t0: i
#   $t1: j

print:
    addi $sp, $sp, -12
    sw $t2 8($sp)
    sw $t1, 4($sp)
    sw $t0, 0($sp)

    li $t0, 0 # i = 0
printforloop1:
    addi $t2, $s0, 1 # l1 + 1
    bge $t0, $t2, printexit1
    li $t1, 0 # j = 0
printforloop2:
    addi $t2, $s1, 1 # l1 + 1
    bge $t1, $t2, printexit2
    # == print integar ==
    li $v0, 1   
    lw $t2, 0($a1) # load value to t2  
    move $a0, $t2 # load t2 to print's argument
    syscall
    # == print space ==
    li $v0, 4
    la $a0, space 
    syscall
    # == move a1 pointer == 
    addi $a1, $a1, 4
    # == j += 1 ==
    addi $t1, $t1, 1
    j printforloop2
printexit2:
    # == print nextline ===
    li $v0, 4
    la $a0, nextline
    syscall
    # == i += 1 ==
    addi $t0, $t0, 1
    j printforloop1
printexit1:
    lw $t0, 0($sp)
    lw $t1, 4($sp)
    lw $t2, 8($sp)

    addi $sp, $sp, 12
    jr $ra