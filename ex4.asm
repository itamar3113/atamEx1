.global _start

.section .text
_start:
	movq head, %rax
	movq $head, %rdi
	movl Value, %ebx
loop1_HW1:
	testq %rax, %rax
	jz end_HW1
	movl (%rax), %ecx
	cmp %ecx, %ebx
	je find_source_HW1
	lea 4(%rax), %rdi
	movq 4(%rax), %rax
	jmp loop1_HW1
find_source_HW1:
	movq head, %rbx
	movq $head, %rsi
	movq Source, %rdx	
loop2_HW1:
	cmp %rbx, %rdx
	je replace_HW1
	lea 4(%rbx), %rsi 
	movq 4(%rbx), %rbx
	jmp loop2_HW1
replace_HW1:
	movq (%rdi), %r8
	movq (%rsi), %r9
	movq %r9, (%rdi) 
	movq %r8, (%rsi)
	movq 4(%rdx), %rcx
	movq 4(%rax), %rbx
	movq %rcx, 4(%rax)
	movq %rbx, 4(%rdx)

end_HW1:


	
	
	

	
	
	
	
	