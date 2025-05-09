    .global main
    .text

main:
    sub sp, sp, #100       @ Allocate 100 bytes on stack for input string

    ldr r0, =str_in_fmt    @ Format string for scanf: "%s"
    mov r1, sp             @ Buffer location (SP points to our string)
    bl scanf               @ scanf("%s", sp)

    ldr r0, =str_out_fmt   @ Format string for printf
    mov r1, sp             @ Pass the string to printf
    bl printf              @ printf("You typed: %s\n", sp)

    add sp, sp, #100       @ Clean up stack

    mov r7, #1             @ Exit syscall
    svc #0

    .data

str_in_fmt:   .asciz "%s"
str_out_fmt:  .asciz "You typed: %s\n"
