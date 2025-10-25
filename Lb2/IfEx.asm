.data

Num               : .asciiz "Enter  number: "
ZeroMess          : .asciiz "the Num is Zero "
PositiveMess      : .asciiz "the Num is Positive "
negativeMess      : .asciiz "the Num is negative"
newLine           : .asciiz "\n"

.text
main:
    li $v0 ,4
    la $a0 ,Num
    syscall

    li $v0 ,5
    syscall

    move $t0 ,$v0

    if:

        bne	$t0, $zero, elsif	
        la $a0 , ZeroMess
        j endif
        
    elsif:

        blez $t0, else
        la $a0 , PositiveMess   
        j endif

        
    else:

        la $a0 ,negativeMess
        j endif


    endif:

        li $v0 ,4
        syscall

    li $v0 , 4
    la $a0 , newLine
    syscall

Exit:
    li $v0 ,10
    syscall