.global main
.text

findLength:
    sub sp,sp,#4
    str r4,[sp,#0]

    mov r4,r0
    mov r1,#0 @len counter

loop:
    ldrb r3,[r4,#0]

    cmp r3,#0
    beq exit

    add r4,r4,#1
    add r1,r1,#1   @ r1 increased by one in each loop
    b loop


exit:
    ldr r4,[sp,#0]
    add sp,sp,#4
    mov pc,lr
        

main:
    sub sp,sp,#100
    ldr r0,=formatr
    bl printf

    ldr r0,=formats
    mov r1,sp
    bl scanf

    mov r0,sp

    bl findLength

    ldr r0,=formatp
    mov  r1,r1
    bl printf

    add sp,sp,#100
    mov r7,#1
    svc #0

.data
formatr: .asciz "Enter a string: "
formats : .asciz "%s"
formatp : .asciz "String length is %d\n"