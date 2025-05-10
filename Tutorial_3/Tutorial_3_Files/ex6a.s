@ ARM Assembly - Recursive Factorial
@ Group Number : 06

    .text   @ instruction memory

@ ---------------------
fact:
    SUB sp, sp, #8        @ Allocate stack space for lr and r0
    STR lr, [sp, #4]      @ Save return address
    STR r0, [sp, #0]      @ Save input n

    CMP r0, #1            @ Compare n with 1
    BGT recurse           @ If n > 1, go to recurse
    MOV r0, #1            @ Base case: if n <= 1, return 1
    ADD sp, sp, #8        @ Restore stack
    MOV pc, lr            @ Return

recurse:
    SUB r0, r0, #1        @ r0 = n - 1
    BL fact               @ Recursive call: fact(n - 1)
    MOV r12, r0           @ Save result in r12

    LDR r0, [sp, #0]      @ Reload original n
    LDR lr, [sp, #4]      @ Restore return address
    ADD sp, sp, #8        @ Restore stack

    MUL r0, r0, r12       @ result = n * fact(n - 1)
    MOV pc, lr            @ Return to caller

@ ---------------------
.global main
main:
    SUB sp, sp, #4
    STR lr, [sp, #0]

    MOV r4, #5            @ Input value: n = 5

    MOV r0, r4            @ Pass n to r0
    BL fact               @ Call factorial function
    MOV r5, r0            @ Store result in r5

    LDR r0, =format       @ Prepare for printf
    MOV r1, r4            @ First argument to printf: n
    MOV r2, r5            @ Second argument: fact(n)
    BL printf

    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

    .data
format: .asciz "Factorial of %d is %d\n"
