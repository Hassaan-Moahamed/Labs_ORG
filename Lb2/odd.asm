.data
mesg: .asciiz "please eneter integer"
resev : .asciiz "nums is even"
resodd : .asciiz "nums is odd"

newline:.asciiz "\n"
.text
 
main:
    li $v0 ,4
    la $a0,mesg
    syscall

    li $v0 ,5
    syscall

    move $t0 ,$v0
    li  $t1,2
    div $t0 , $t1

    mfhi $s0
    mflo $s1
if:
    beq $s0 , $zero ,elif
    la $a0 ,resodd
    j else
elif:
    la $a0 ,resev
    j else
else:
    li $v0 ,4
    syscall
exit:
 li $v0 ,10
 syscall

    


