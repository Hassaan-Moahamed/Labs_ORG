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

    # read user input
    li $v0, 5
    syscall
    move $a0, $v0       # n → a0

    jal fib             # call recursive fib

    move $t0, $v0       # save answer

    # print text
    li $v0, 4
    la $a0, resultMsg
    syscall

    # print answer
    li $v0, 1
    move $a0, $t0
    syscall

    # exit
    li $v0, 10
    syscall


#################################
# RECURSIVE FIB FUNCTION
# fib(n):
#   if n == 0 return 0
#   if n == 1 return 1
#   return fib(n-1) + fib(n-2)
#################################

fib:
    # save return address
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    # base case: n == 0
    beq  $a0, $zero, fib_return_zero

    # base case: n == 1
    li   $t0, 1
    beq  $a0, $t0, fib_return_one

    # save n
    addi $sp, $sp, -4
    sw   $a0, 0($sp)

    #### fib(n-1)
    addi $a0, $a0, -1
    jal fib
    move $t1, $v0       # save fib(n-1)

    #### restore n
    lw   $a0, 0($sp)
    addi $sp, $sp, 4

    #### fib(n-2)
    addi $a0, $a0, -2
    jal fib
    move $t2, $v0       # save fib(n-2)

    #### return sum
    add  $v0, $t1, $t2
    j fib_exit

fib_return_zero:
    move $v0, $zero
    j fib_exit

fib_return_one:
    li $v0, 1

fib_exit:
    # restore return address
    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra
