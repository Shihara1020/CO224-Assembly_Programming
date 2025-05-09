.global main
.text

main:
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

calculate:
    ldr r0,[sp,#0]
    ldr r1,[sp,#4]
    
    mov  r2,#1 
    mov r2,r2,lsl r1
    mul r3,r0,r2
    mov r1,r3
    
    ldr r0,=formatp
    bl printf

    add sp,sp,#8
    mov r1,#1
    svc #0
.data
formats1: .asciz "Enter the first integer: "
formats2: .asciz "Enter the first integer: "
formats: .asciz "%d"
formatp: .asciz "The X*2**Y is %d\n"








     
