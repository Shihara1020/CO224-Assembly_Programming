@ ARM Assembly - exercise 6 
@ Group Number : 06

	.text 	@ instruction memory
	
	
@ Write YOUR CODE HERE	

@ ---------------------	
fact:
   sub sp,sp,#8      @ Make space on stack to save r4 and r5
   str r5,[sp,#4]    @ Save current value of r5 on stack 
   str r4,[sp,#0]    @ Save current value of r4 on stack

   mov r4,r0         @ Copy input number to r4
   mov r0,#1         @ Initialize result=1 in r0

loops:
    cmp r4,#1       @ Compare number with 1
    ble exit        @ if number<=1,exit the loop
	mul r5,r0,r4    @ r5=result*number
	mov r0,r5       @ Move new result to r0
	sub r4,r4,#1    @ number-=1
	b loops         @ Repeat loop

exit:
    ldr r4,[sp,#0]  @ Restore original r4 value from stack
	ldr r5,[sp,#4]  @ Restore original r5 value from stack
	add sp,sp,#8    @ Deallocate 8 bytes
	
	mov pc,lr       @ Return to main function

@ ---------------------	

.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4, #8 	@the value n

	@ calling the fact function
	mov r0, r4 	@the arg1 load
	bl fact
	mov r5,r0
	

	@ load aguments and print
	ldr r0, =format
	mov r1, r4
	mov r2, r5
	bl printf

	@ stack handling (pop lr from the stack) and return
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

	.data	@ data memory
format: .asciz "Factorial of %d is %d\n"

