.data
newLine: .asciiz"\n"

.text
main:
    
    li $t1 ,11
    li $t0,1

while:
    beq		$t0, $t1, endwhile

    li $v0,1
    move $a0,$t0
    syscall

    li $v0,4
    la $a0,newLine
    syscall

    addi $t0,$t0,1

    j	while
        
    
endwhile:


Exit:
    li $v0,10
    syscall
    