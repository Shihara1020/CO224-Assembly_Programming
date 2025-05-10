@ ARM Assembly - lab 3.1
@ 
@ Roshan Ragel - roshanr@pdn.ac.lk
@ Hasindu Gamaarachchi - hasindu@ce.pdn.ac.lk

	.text 	@ instruction memory

	
@ Write YOUR CODE HERE	

@ ---------------------	
mypow:
    sub sp,sp,#12    
	str lr,[sp,#8]    @ Save return address
	str r4,[sp,#4]    @ Save x (base)
	str r5,[sp,#0]    @ Save n

    cmp r1,#1
	beq base_case     @ If exponent ==1 ,return base 
    
	mov r4,r0         @ Sav base in r4
	mov r5,r1         @ Save exponent in r5

	sub r1,r1,#1       @ n=n-1 
    bl mypow           @ Recursive call :mypow(x,n-1)

	mul r0,r0,r4       @ result=returned_value*x
	b end_case





base_case:
	mov r0,r0   @ If n==1,return x


end_case:
    ldr lr, [sp, #8]    @ Restore return address
    ldr r4, [sp, #4]    @ Restore r4
    ldr r5, [sp, #0]    @ Restore r5
    add sp, sp, #12     @ Clean up stack
    mov pc, lr          @ Return from function












@ ---------------------	

	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4, #8 	@the value x
	mov r5, #3 	@the value n
	

	@ calling the mypow function
	mov r0, r4 	@the arg1 load
	mov r1, r5 	@the arg2 load
	bl mypow
	mov r6,r0
	

	@ load aguments and print
	ldr r0, =format
	mov r1, r4
	mov r2, r5
	mov r3, r6
	bl printf

	@ stack handling (pop lr from the stack) and return
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

	.data	@ data memory
format: .asciz "%d^%d is %d\n"

