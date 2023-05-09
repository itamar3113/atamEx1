.global _start

.section .text
_start:
#your code here
	mov (num), %eax
	cmp $0, %eax
	js negative_HW1
	xor %ebx, %ebx
	movq destination, %rdi
loop_HW1:
	lea source(%ebx), %rsi
	cmp %rdi, %rsi
	je shift_dest_HW1
	cmp $1, %eax
	jl end_HW1
	movb source(%ebx), %r10b 
	movb %r10b, destination(%ebx)
	add $1, %ebx
	sub $1, %eax
	jmp loop_HW1
	negative_HW1:
	mov %eax, (destination)
shift_dest_HW1:
	lea (%eax, %ebx, -1), %ecx
	cmp $1, %eax
	jl end_HW1
	movb source(%ebx), %r10b 
	movb %r10b, destination(%ecx)
	add $1, %ebx
	add $1, %ecx
	sub $1, %eax
	jmp loop_HW1
end_HW1:
