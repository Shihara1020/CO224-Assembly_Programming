.global main
.text

main:
    sub sp,sp,#100
    ldr r0,=formats
    mov r1,sp

    bl scanf
    
    mov r4,sp
loop:    
    ldr r0,=formatp
    ldrb r1,[r4,#0]
    cmp r1,#0
    beq exit
    bl printf

    add r4,r4,#1
    b loop

exit:    
    add sp,sp,#100

    
    mov r7,#1
    svc #0

.data
formats:.asciz "%s"
formatp:.asciz "The charater is %c\n"