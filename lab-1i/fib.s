	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, r6, lr}

	@ R4 = R0 - 0 (update flags)
    subs r4, r0, #0
	@ if(R0 <= 0) goto .L3 (which returns 0)
    ble .L3

	@ Compare R4 wtih 1
    cmp r4, #1
	@ If R4 == 1 goto .L4 (which returns 1)
    beq .L4

    subs r3, r4, 2   @ r3 is iterator, sub 2 due to fib[0], fib[1] omitted
    mov r4, 1        @ a = 1
    mov r5, 1        @ b = 1
    beq .L2
.L1:
    add r6, r4, r5   @ c = a + b
    mov r4, r5       @ a = b
    mov r5, r6       @ b = c
    subs r3, r3, #1
    beq .L2
    b .L1

.L2:
    mov r0, r5       @ return b

	pop {r3, r4, r5, r6, pc}		@EPILOG

	@ END CODE MODIFICATION
.L3:
	mov r0, #0			@ R0 = 0
	pop {r3, r4, r5, pc}		@ EPILOG

.L4:
	mov r0, #1			@ R0 = 1
	pop {r3, r4, r5, pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
