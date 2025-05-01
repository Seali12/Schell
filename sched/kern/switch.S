/*
 * Your code here for context_switch
 *
 * It should restore the register values in the Trapframe with the 'iret' instruction.
 * This exits the kernel and starts executing some environment's code.
 *
 * This function does not return.
 */

.globl context_switch;
context_switch:
    add $4, %esp
	mov (%esp), %eax
	mov %eax, %esp

    popal #saca 8 valores de 4 bytes cada uno (32 bytes en total)
    pop %es
    pop %ds
    
    add $8, %esp #tf_trapno y tf_errcode no son registros que necesitamos restaurar

    iret #saca 5 valores de la pila EIP, CS, EFLAGS, ESP y SS

spin:
	jmp spin
