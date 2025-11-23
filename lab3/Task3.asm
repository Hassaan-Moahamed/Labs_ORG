.data
A:  .word 4
B:  .word 6

.text

# ===========================
# Function: compute(a, b)
# returns (a + b) * 2
# ===========================
compute:
    # ----- Callee-save -----
    addi $sp, $sp, -8       # allocate stack frame
    sw   $ra, 4($sp)        # save return address
    sw   $s0, 0($sp)        # save s0

    add  $s0, $a0, $a1      # s0 = a + b
    sll  $v0, $s0, 1        # v0 = s0 * 2

    # ----- Callee-restore -----
    lw   $s0, 0($sp)
    lw   $ra, 4($sp)
    addi $sp, $sp, 8        # deallocate stack

    jr   $ra


# ===========================
# main function (caller)
# ===========================
main:
    lw   $t0, A
    lw   $t1, B
    li   $s0, 99            # s0 is callee-saved, but compute uses s0 -> must save it!

    # ----- Caller-save -----
    addi $sp, $sp, -4
    sw   $s0, 0($sp)        # save s0 before calling compute

    move $a0, $t0
    move $a1, $t1
    jal  compute

    move $t3, $v0           # result

    # ----- Caller-restore -----
    lw   $s0, 0($sp)
    addi $sp, $sp, 4

    jr $ra
