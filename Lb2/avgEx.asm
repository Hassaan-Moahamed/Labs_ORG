.data
promptN: .asciiz "Enter number of integers (n): "
promptNum: .asciiz "Enter number: "
avgMsg: .asciiz "Average = "
newline: .asciiz "\n"

.text
main:
    li $v0, 4
    la $a0, promptN
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $t1, 0
    li $t2, 0

read_loop:
    beq $t1, $t0, done_read
    li $v0, 4
    la $a0, promptNum
    syscall

    li $v0, 5
    syscall
    add $t2, $t2, $v0

    addi $t1, $t1, 1
    j read_loop

done_read:
    div $t2, $t0
    mflo $t3

    li $v0, 4
    la $a0, avgMsg
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall
