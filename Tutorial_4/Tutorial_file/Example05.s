.global main
.text

main:
    sub sp,sp,#4
    str lr,[sp,#0]
    
    sub sp, sp, #4           @ Allocate space on stack to store input

    ldr r0,=formati
    bl printf

    ldr r0, =input_fmt       @ Format string for scanf
    mov r1, sp               @ Store input at sp
    bl scanf

    ldr r4, [sp,#0]             @ Load the input number N to r4
    mov r5, #1               @ Initialize counter to 1

print_loop:
    cmp r5, r4               @ Compare counter with N
    bgt end_loop             @ If r1 > N, exit loop

    ldr r0, =output_fmt      @ Format string for printf
    mov r1,r5               @ Set r1 = current number to print
    bl printf

    add r5, r5, #1           @ r1 = r1 + 1
    b print_loop             @ Repeat loop

end_loop:
    add sp, sp, #4           @ Restore stack
    
exit:
    ldr lr,[sp,#0]
    add sp,#4
    mov pc,lr

.data
formati: .asciz "Enter integer: "
input_fmt:  .asciz "%d"
output_fmt: .asciz "%d\n"
