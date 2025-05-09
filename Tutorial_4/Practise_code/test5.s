.global main
.text

main:
    sub sp, sp, #40          @ Reserve space for 10 integers (4 bytes * 10)

    mov r4, #0               @ r4 = loop counter
    mov r5, sp               @ r5 = base address of array

read_loop:
    cmp r4, #5              @ loop 10 times
    beq print_loop_start     @ if done, go to print

    ldr r0, =formats         @ prompt: scanf format "%d"
    add r1, r5, r4, LSL #2   @ r1 = address of array[i]
    bl scanf

    add r4, r4, #1
    b read_loop

print_loop_start:
    mov r4, #0               @ reset loop counter

print_loop:
    cmp r4, #5
    beq exit

    ldr r0, =formatp
    add r1, r5, r4, LSL #2   @ r1 = address of array[i]
    ldr r1, [r1]             @ r1 = array[i] value
    bl printf

    add r4, r4, #1
    b print_loop

exit:
    add sp, sp, #40          @ restore stack
    mov r7, #1               @ exit syscall
    svc #0

.data
formats:  .asciz "%d"
formatp:  .asciz "Number: %d\n"
