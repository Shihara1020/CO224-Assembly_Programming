.global main
.text

main:
    sub sp,sp,#4
    ldr r0, =formats
    mov r1,sp
    bl scanf

    
    ldr r1,[sp,#0]
    ldr r0, =formatp
    bl printf

    add sp,sp,#4
    mov r7,#1
    svc #0


.data
formats: .asciz "%d"
formatp: .asciz "The number is %d\n"