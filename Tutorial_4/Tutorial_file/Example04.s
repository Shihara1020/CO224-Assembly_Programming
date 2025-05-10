.global main
.text

main:
    sub sp,sp,#4
    str lr,[sp,#0]
    sub sp,sp,#8
    
    @ get first integer
    ldr r0,=formats1
    bl printf

    ldr r0,=formats
    mov r1,sp
    bl scanf

    @ get second integer
    ldr r0,=formats2
    bl printf

    ldr r0,=formats
    add r1,sp,#4
    bl scanf 


    ldr r1,[sp]
    ldr r2,[sp,#4]

    cmp r1,r2
    beq print_equal

print_not_equal:
    ldr r0,=not_equal_msg
    bl printf
    b exit

print_equal:
    ldr r0,=equal_msg
    bl printf


exit:
    add sp,sp,#8
    ldr lr,[sp,#0]
    add sp,#4
    mov pc,lr

.data
formats1: .asciz "Enter the first integer: "
formats2: .asciz "Enter the first integer: "
formats: .asciz "%d"
not_equal_msg: .asciz "The numbers are not equal.\n"
equal_msg: .asciz "The numbers are equal.\n"







     
