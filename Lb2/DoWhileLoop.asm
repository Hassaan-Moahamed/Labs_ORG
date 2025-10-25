.data
messege:.asciiz "program that reads numbers from the user and sums them until the user enters zero"
num: .asciiz "Please enter number: "
res :.asciiz "result is : "
newLine: .asciiz"\n"

.text
#first

main:
    li $v0,4
    la $a0,messege
    syscall

    li $v0,4
    la $a0,newLine
    syscall
   
    move $t0,$zero
    do:
        li $v0 ,4
        la $a0,num
        syscall

        li $v0,5
        syscall
        move $t1 ,$v0
        add $t0,$t0,$t1
    while:
        bne $t1 ,$zero,do
    endwhile:
        li $v0,4
        la $a0 ,res
        syscall

        li $v0,1
        move $a0,$t0
        syscall
    li $v0,4
    la $a0 ,newLine
    syscall


exit:
 li $v0,10
 syscall


#seconed

# main:
#         li $v0,4
#         la $a0,messege
#         syscall

#         li $v0,4
#         la $a0,newLine
#         syscall

#         move $t0,$zero

#         do_Loop:
#             li $v0,4
#             la $a0,num
#             syscall

#             li $v0 ,5
#             syscall
#             move $t1, $v0


#             add $t0,$t0,$t1

#             bne $t1 ,$zero , do_Loop


#         li $v0 ,4
#         la $a0,res
#         syscall

#         li $v0, 1
#         move $a0 ,$t0
#         syscall

#         li $v0,4
#         la $a0,newLine
#         syscall


# exit:
#  li $v0,10
# syscall
