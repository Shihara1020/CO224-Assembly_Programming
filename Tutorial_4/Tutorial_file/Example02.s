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

getSum:
    ldr r1,[sp,#0]
    ldr r2,[sp,#4]
    
    ldr r0,=formatp
    add r1,r1,r2
    bl printf

    add sp,sp,#8
    mov r7,#1
    svc #0

.data
formats1: .asciz "Enter the first integer: "
formats2: .asciz "Enter the first integer: "
formats: .asciz "%d"
formatp: .asciz "The sum two integer is %d\n"








     
