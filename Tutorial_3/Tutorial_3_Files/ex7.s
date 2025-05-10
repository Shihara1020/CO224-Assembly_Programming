@ ARM Assembly - exercise 7 
@ Group Number : 06

	.text 	@ instruction memory

	
@ Write YOUR CODE HERE	

@ ---------------------

Fibonacci:
	sub sp,sp,#12    @ Reserve stack space
	str lr,[sp,#8]   @ Save return address
	str r4,[sp,#4]   @ Save r4
	str r0,[sp,#0]   @ Save n

	cmp r0,#2        @ Compare n with 2
	ble base_case    @ If n<=2,got to base case 

	@ Recursive call : fibbonacci(n-1)
	sub r0,r0,#1     @ r0=n-1
	bl Fibonacci     @ call fibbonacci(n-1)
	mov r4,r0        @ Store result in r4

    @ Recursive call : fibbonacci(n-2)
	ldr r0,[sp,#0]    @ Restore original n
	sub r0,r0,#2      @ r0=n-2
	bl Fibonacci      @ call fibbonacci(n-2)

	add r0,r0,r4      @ r0=fibbonacci(n-1) + fibbonacci(n-2)
	b end               

base_case:
	mov r0,#1         @ Base case
	add sp,sp,#12     
	mov pc,lr         @ Return

end:
	ldr r4,[sp,#4]     @ Restore r4
	ldr lr,[sp,#8]     @ Restore lr
	add sp,sp,#12
	mov pc,lr












@ ---------------------
	
	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4, #8 	@the value n

	@ calling the Fibonacci function
	mov r0, r4 	@the arg1 load
	bl Fibonacci
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
format: .asciz "F_%d is %d\n"

