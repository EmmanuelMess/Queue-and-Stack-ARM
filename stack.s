.global spush
.global spop
.global l_stack
.global stack

.data
stack: .space 4096 /* sizeof(str_tok_t) * 256 */
l_stack: .word 0

/*
typedef struct { // sizeof(str_tok_t) = 16
	const char *s;
	int len, prec, assoc;
} str_tok_t;
*/

/*
void spush(str_tok_t x) {
	stack[l_stack++] = x;
	return x;
}
*/

.text
spush:

    @ 4-11 callee saved
    push {r4-r6}

    ldr r4, =l_stack
    ldr r5, [r4]            @ r5 is len
    lsl r5, #4              @ log2(sizeof(str_tok_t)) = 4

    ldr r6, =stack          @ r6 is &stack

    add r6, r6, r5
    stm r6, {r0-r3}

    ldr r4, =l_stack
    ldr r5, [r4]            @ r5 is len
    add r5, r5, #1
    str r5, [r4]

    pop {r4-r6}
    bx lr

/*
str_tok_t spop() {
	return stack[--l_stack];
}
*/

spop:
    ldr r4, =l_stack
    ldr r5, [r4]            @ r5 is len
    sub r5, r5, #1
    str r5, [r4]

