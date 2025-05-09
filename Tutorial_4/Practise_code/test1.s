    .global main       @ Define the entry point for the linker
    .text              @ Start of code section

main:
    sub sp, sp, #4     @ Allocate 4 bytes on the stack for input

    ldr r0, =formats   @ Load address of format string "%d"
    mov r1, sp         @ Second argument: address to store user input
    bl scanf           @ Call scanf("%d", sp)

    ldr r1, [sp, #0]   @ Load the input value into r1

    add sp, sp, #4     @ Release the stack space

    ldr r0, =formatp   @ Load address of printf format string
    bl printf          @ Call printf("The number is %d\n", r1)

    mov r7, #1         @ Exit syscall number (for Linux, optional if using main)
    svc #0             @ Make syscall (optional if using main from C)

    .data              @ Start of data segment

formats:   .asciz "%d"                    @ For scanf
formatp:   .asciz "The number is %d\n"    @ For printf
