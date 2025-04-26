@ ARM Assembly - lab 2
@ Group Number :

	.text 	@ instruction memory
	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	@ load values
	
	@ Write YOUR CODE HERE
	
	@	Sum = 0;
	@	for (i=0;i<10;i++){
	@			for(j=5;j<15;j++){
	@				if(i+j<10) sum+=i*2
	@				else sum+=(i&j);	
	@			}	
	@	} 
	@ Put final sum to r5


	@ ---------------------

	mov r5,#0
	mov r1,#0  @  i = 0

	floop1:
		cmp r1,#10
		bge exit
		
        @second for loop
		mov r2,#5   @ j= 5
		floop2:
			cmp r2,#15
			bge next_i

			add r3,r1,r2  @ r4=i+j
			cmp r3,#10
			blt add_sum
			
			and r4,r1,r2    @ r4=i&j 
			add r5,r5,r4
			add r2,r2,#1
			b floop2
			
			add_sum:
				add r5,r5,r1,lsl #1
				add r2,r2,#1
				b floop2
		next_i:
		    add r1,r1,#1
			b  floop1
    exit:

		   




	
	
	
	
	
	
	
	
	
	
	
	
	@ ---------------------
	
	
	@ load aguments and print
	ldr r0, =format
	mov r1, r5
	bl printf

	@ stack handling (pop lr from the stack) and return
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

	.data	@ data memory
format: .asciz "The Answer is %d (Expect 300 if correct)\n"

