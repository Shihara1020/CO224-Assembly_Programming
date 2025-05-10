@ Lab   - 04
@ Group - 06

.global main
.text

main:
    sub sp,sp,#4
    str lr,[sp,#0]         @ save return address

    ldr r0,=formats1
    bl printf              @ printf("enter the number of strings: ")

    sub sp,sp,#4
    ldr r0,=formats2
    mov r1,sp
    bl scanf               @ scanf("%d",&num)

    

    ldr r4,[sp,#0]         @ r4 = number of strings
    add sp,sp,#4

    cmp r4,#0
    blt Invalid            @ if r4<0.got to Invalid
    beq exit

    mov r5,#0              @ r5 = loop index

@ === Input loop for each string ===
loop:
    cmp r5,r4
    beq exit               @ If all string processed, exit

    ldr r0,=formats3 
    mov r1,r5
    bl printf              @ printf("Enter input string %d: ", r5)


    sub sp,sp,#200         @ Allocate 200 bytes for current string
    mov r6,sp              @ r6 = current string buffer
    
    
    ldr r0,=formatG
    mov r1,sp
    bl scanf               @ scanf("%*c%[^\n]", sp)
    
    mov r0,r6              @ pass string pointer as argument
    bl reverse             @ reverse(buffer)
    

    @ === Function: print reversed string ===
    ldr r0,=formatp
    mov r1,r5                     
    bl printf                @ printf("Output string %d is", r5)

    ldr r0,=formato
    mov r1,r6
    bl printf
 
    add r5,r5,#1
    add sp,sp,#200         @ Free 200 bytes
    b loop

@ === Function: reverse string ===
reverse:
    sub sp,sp,#24
    str r1,[sp,#0]
    str r2,[sp,#4]
    str r3,[sp,#8]
    str r4,[sp,#12]
    str r5,[sp,#16]
    str lr,[sp,#20]

    mov r1,r0                  @ use r0 (passed argument) as string pointer

find_end:   
    ldrb r2,[r1,#0]
    cmp r2,#0
    beq done
    add r1,r1,#1
    b find_end

done:
    sub r1,r1,#1
    mov r2,r0                  @ r2=start of string

rev_loop:
    cmp r2,r1
    bge rev_done

    ldrb r3,[r2]
    ldrb r4,[r1]

    strb r4,[r2]     @ swap the characters
    strb r3,[r1]

    add r2,r2,#1
    sub r1,r1,#1
    b rev_loop

rev_done:
    ldr r1, [sp, #0]
    ldr r2, [sp, #4]
    ldr r3, [sp, #8]
    ldr r4, [sp, #12]
    ldr r5, [sp, #16]
    ldr lr, [sp, #20]
    add sp, sp, #24
    mov pc, lr
    

@ === Invalid input handling ===
Invalid:
    ldr r0,=formatIN
    bl printf
@ === Program exit ===
exit:
    ldr lr,[sp,#0]
    add sp,sp,#4
    mov pc,lr

.data
formats1: .asciz "Enter the number of strings: \n"
formats2: .asciz "%d"
formatIN: .asciz "Invalid Number \n"
formats3: .asciz "Enter input string %d: \n"
formatG:  .asciz "%*c%[^\n]"
formatp:  .asciz "Output string %d is : \n"
formato:  .asciz "%s\n"