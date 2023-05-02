.global _start

.section .text
_start:
	movq new_node, %rcx # rcx = val
	movq root, %rax # rax = root
    test %rax, %rax
    jne L1
    movq $new_node, root
    jmp end
	
L1:	
	movq (%rax), %rbx # rbx =  -> value
	cmp %rbx, %rcx
	jg L2
	je end # need to check if possible if not don another comp
	movq 8(%rax), %rdx # rdx = lson
    test %rdx, %rdx
    je L3
    movq %rdx, %rax
    jmp L1
	
L2:
    movq 16(%rax), %rax # rdx = rson
    test %rdx, %rdx     # if rdx != null
    je L4
    movq %rdx, %rax
    jmp L1

L3:
    movq %new_node, 8(%rax)
    jmp end
	
L4:
	movq $new_node, 16(%rax)
 
 end: