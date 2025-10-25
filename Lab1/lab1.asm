.data
name:   .asciiz "Name   : Hassaan Mohamed Ahmed Lashin\n"
id:     .asciiz "ID     : 20812022100325\n"
course: .asciiz "Course : CSE321-Computer-Organization\n"

.text
main:
    # name
    li $v0, 4
    la $a0, name
    syscall

    # id
    li $v0, 4
    la $a0, id
    syscall

    # course
    li $v0, 4
    la $a0, course
    syscall

    # Exit  
    li $v0, 10
    syscall
#=====================================Lab1
# .data
# hello: .asciiz "hello war"
# .text
# main:
#     li $v0 ,4
#     la $a0, hello

#     syscall

#     li $v0 , 10
    
#     syscall