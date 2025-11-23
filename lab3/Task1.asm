.data
msg:      .asciiz "Enter a number: "
resultMsg:.asciiz "\nFibonacci number is: "

.text
.globl main

main:
    # print message
    li $v0, 4
    la $a0, msg
    syscall

    # read int n
    li $v0, 5
    syscall
    move $a0, $v0       # n → a0

    jal fib_iterative   # call iterative fib

    move $t0, $v0       # save result

    # print result message
    li $v0, 4
    la $a0, resultMsg
    syscall

    # print fibonacci number
    li $v0, 1
    move $a0, $t0
    syscall

    # exit
    li $v0, 10
    syscall


###########################################
# ITERATIVE FIBONACCI FUNCTION
# fib_iterative(n):
#   if n==0 return 0
#   if n==1 return 1
#   loop to compute fib(n)
###########################################

fib_iterative:
    # base cases
    beq $a0, $zero, fib0
    li  $t1, 1
    beq $a0, $t1, fib1

    # setup
    li $t2, 0       # f0
    li $t3, 1       # f1
    move $t4, $a0   # counter = n

loop_iter:
    add $t5, $t2, $t3   # t5 = f0 + f1
    move $t2, $t3       # shift
    move $t3, $t5
    addi $t4, $t4, -1
    bgt $t4, 1, loop_iter

    move $v0, $t5
    jr $ra

fib0:
    move $v0, $zero
    jr $ra

fib1:
    li $v0, 1
    jr $ra
