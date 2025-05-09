.global main
.text

main:
    sub sp,sp,#8
    mov r4,#0
    mov r5,sp

    ldr r0,=formats
    add r1,sp,#0
    bl scanf

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
    mov r7,#1
    svc #0
.data
formats: .asciz "%d"
not_equal_msg: .asciz "The numbers are not equal.\n"
equal_msg: .asciz "The numbers are equal.\n"







     
