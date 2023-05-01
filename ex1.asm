.global _start

.section .text

_start:
	#your code here
	movq (num), %rax
	xor %bl, %bl
loop_HW1:
	test %rax, %rax
	je end_HW1
	testq $1, %rax
	je final_HW1
	inc %rbx
final_HW1:
	shr %rax
	jmp loop_HW1
end_HW1:
	mov %bl, (Bool)

