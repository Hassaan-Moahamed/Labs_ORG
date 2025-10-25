.data
menu: .asciiz "Enter a choice (1-3): "
case1: .asciiz "You chose case 1\n"
case2: .asciiz "You chose case 2\n"
case3: .asciiz "You chose case 3\n"
invalid: .asciiz "Invalid choice!\n"

.text
main:
    li $v0, 4
    la $a0, menu
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    beq $t0, 1, do_case1
    beq $t0, 2, do_case2
    beq $t0, 3, do_case3
    j default_case

do_case1:
    li $v0, 4
    la $a0, case1
    syscall
    j exit

do_case2:
    li $v0, 4
    la $a0, case2
    syscall
    j exit

do_case3:
    li $v0, 4
    la $a0, case3
    syscall
    j exit

default_case:
    li $v0, 4
    la $a0, invalid
    syscall

exit:
    li $v0, 10
    syscall
