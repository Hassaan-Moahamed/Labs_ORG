.data

firstNum    : .asciiz "Enter the first number: "
seconedNum  : .asciiz "Enter the seconed number: "
result      : .asciiz "the result is : "

.text
main:
    #messege to enter first num
    li $v0 ,4
    la $a0 , firstNum
    syscall
    #End

    #i user input first num
    li $v0 , 5
    syscall
    move $t0, $v0
    #End 

    #messege to enter sec num
    li $v0,4
    la $a0,seconedNum
    syscall
    #End

    # user input seconed num
    li $v0, 5
    syscall
    move $t1 ,$v0
    #End

    # messege of result
    li $v0, 4
    la $a0 ,result
    syscall
    #End

    #add two numbers in a0 to more less lines 
    add $a0,$t0,$t1
    #End

    #  $v0 ,1 return int in $a0   result
    li $v0,1
    syscall
    #End


Exit:
    
    #Exit
    li $v0 ,10
    syscall
    #End