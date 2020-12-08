.global qpush
.global l_queue
.global queue

.data
queue: .space 6144 /* sizeof(str_tok_t) * 256 */
l_queue: .word 0

/*
void qpush(str_tok_t x) {
	queue[l_queue++] = x;
	return x;
}
*/

.text
qpush:
    @ 4-11 callee saved
    push {r4-r11}

    ldr r4, =l_queue
    ldr r5, [r4]            @ r5 is len
    lsl r5, #4              @ log2(sizeof(str_tok_t)) = 4

    ldr r6, =queue          @ r6 is &stack

    add r6, r6, r5
    stm r6, {r0-r3}

    ldr r4, =l_queue
    ldr r5, [r4]            @ r5 is len
    add r5, r5, #1
    str r5, [r4]

    pop {r4-r11}
    bx lr
