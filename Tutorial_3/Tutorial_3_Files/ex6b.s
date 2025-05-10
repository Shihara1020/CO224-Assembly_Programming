@ ARM Assembly - Recursive Factorial
@ Group Number : 06

.global main
.text

fact:
    sub sp,sp,#8       @ Allocate 8 bytes on stack (for LR and n)
    str lr,[sp,#4]     @ Save return address (LR)
    str r0,[sp,#0]     @ Save original n value

    cmp r0,#1          @ Compare n with 1
    ble base_case      @ If n <= 1, branch to base_case

    sub r0,r0,#1       @ n = n - 1
    bl fact            @ Recursive call: fact(n-1)

    ldr r4,[sp,#0]     @ Restore original n from stack
    mul r0,r0,r4       @ result = n * fact(n-1)

    ldr lr,[sp,#4]     @ Restore return address
    add sp,sp,#8       @ Deallocate stack space
    mov pc,lr          @ Return to caller

base_case:
    mov r0,#1          @ Return 1 (base case)
    ldr lr,[sp,#4]     @ Restore return address
    add sp,sp,#8       @ Deallocate stack space
    mov pc,lr          @ Return to caller





main:
	sub sp,sp,#4
	str lr,[sp,#0]
    
	mov r4,#5
	mov r0,r4
	bl fact

	mov r5,r0
	ldr r0,=formats
	mov r1,r4
	mov r2,r5
	bl printf

exit:
	ldr lr,[sp,#0]
	add sp,sp,#4
	mov pc,lr
	
.data

formats: .asciz "The factorial of %d is %d\n" 


