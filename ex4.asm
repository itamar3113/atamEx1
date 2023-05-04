.global _start

.section .text
_start:
#your code here
	xor %rdi, %rdi
	xor %rdi, %rdi
	movq head(%rip), %rax
	movq value, %rbx
loop1_HW1:
	testq %rax, %rax
	jz end_HW1
	movq (%rax), %rcx
	cmp %rcx, %rbx
	je find_source_HW1
	lea 8(%rax), %rdi
	movq 16(%rax), %rax
	jmp loop1_HW1
find_source_HW1:
	movq head(%rip), %rbx
	movq source(%rip), %rdx	
loop2_HW1:
	cmp %rbx, %rdx
	je replace_HW1
	lea 8(%rbx), %rsi 
	movq 16(%rbx), %rbx
	jmp loop2_HW1
replace_HW1:
	movq (%rax), %r9
	movq 16(%rax), %r10
	movq (%rdx), %r8
	movq 16(%rdx), %r11
	movq %r9, (%rdx) 
	movq %r10, 16(%rbx)
	movq %r8, (%rax)
	movq %r11, (%rbx)
	movq (%rsi), %rcx
	movq $source, (%rsi)
	movq %rcx, (%rdi)
end_HW1:
	
	
	

	
	
	
	
	