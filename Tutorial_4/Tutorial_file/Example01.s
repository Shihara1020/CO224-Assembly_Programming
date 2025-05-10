.global main
.text

main:
    sub sp,sp,#4
    str lr,[sp,#0]

    sub sp,sp,#4
    ldr r0,=formats1
    bl printf

    ldr r0, =formats
    mov r1,sp
    bl scanf

    
    ldr r1,[sp,#0]
    ldr r0, =formatp
    bl printf

    add sp,sp,#4
    
exit:
    ldr lr,[sp,#0]
    add sp,sp,#4
    mov pc,lr


.data
formats1: .asciz "Enter the number: "
formats: .asciz "%d"
formatp: .asciz "The number is %d\n"