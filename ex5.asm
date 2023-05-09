.global _start

.section .text
_start:
	movq new_node, %rcx # rcx = new_val
	movq root, %rax     # rax = root
    test %rax, %rax
    jne L1_HW1
    movq $new_node, root
    jmp END_EX5_HW1
	
L1_HW1:	
	movq (%rax), %rbx  # rbx = node -> value
	cmp %rbx, %rcx     # if new_val == node -> value
	jg GO_RIGHT_HW1              # if new_val > node -> value - go right
    cmp %rbx, %rcx 
	je END_EX5_HW1             # if new_val ==  node -> value - go to END_EX5_HW1
	movq 8(%rax), %rdx #    %rdx = node -> lson
    test %rdx, %rdx    # if %rdx == null insert node
    je INSERT_LEFT_HW1
    movq %rdx, %rax     # node = node -> lson
    jmp L1
	
GO_RIGHT_HW1:
    movq 16(%rax), %rdx # rdx = rson
    test %rdx, %rdx     # if rdx != null
    je INSERT_RIGHT_HW1
    movq %rdx, %rax
    jmp L1_HW1

INSERT_LEFT_HW1:
    movq $new_node, 8(%rax)
    jmp END_EX5_HW1
	
INSERT_RIGHT_HW1:
	movq $new_node, 16(%rax)
 
END_EX5_HW1:



