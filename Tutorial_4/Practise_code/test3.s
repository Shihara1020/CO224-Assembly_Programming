.global main
.text

main:
    sub sp,sp,#4
    ldr r0,=formats
    mov r1,sp

    bl scanf

    ldr r0,=formatp
    ldrb r1,[sp,#0]

    bl printf

    add sp,sp,#4

    mov r7,#1
    svc #0

.data
formats:.asciz "%c"
formatp:.asciz "The charater is %c\n"