.global _start

.section .text
_start:
	movq head, %rax
	movq $head, %rdi
	movl val, %ebx
	movsx %ebx, %rbx
loop1_HW1:
	testq %rax, %rax
	jz end_HW1
	movq (%rax), %rcx
	cmp %rcx, %rbx
	je find_source_HW1
	lea 8(%rax), %rdi
	movq 8(%rax), %rax
	jmp loop1_HW1
find_source_HW1:
	movq head, %rbx
	movq $head, %rsi
	movq Source, %rdx	
loop2_HW1:
	cmp %rbx, %rdx
	je replace_HW1
	lea 8(%rbx), %rsi 
	movq 8(%rbx), %rbx
	jmp loop2_HW1
replace_HW1:
	movq %rax, (%rsi)
	movq 8(%rdx), %rcx
	movq 8(%rax), %rbx
	movq %rcx, 8(%rax)
	movq %rbx, 8(%rdx)
	movq %rdx, (%rdi) 
	 
end_HW1:




	
	
	

	
	
	
	
	