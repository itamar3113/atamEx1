.global _start

.section .text
_start:
#your code here
	mov (num), %eax
	cmp $0, %eax
	js negative_HW1
	xor %ebx, %ebx
loop_HW1:
	cmp $8, %eax
	jge quad_HW1
	cmp $4, %eax
	jge double_HW1
	cmp $2, %eax
	jge word_HW1
	cmp $1, %eax
	jge byte_HW1
	jmp end_HW1
quad_HW1:
	movq source(%ebx), %r10 
	movq %r10, destination(%ebx)
	add $8, %rbx
	sub $8, %eax
	jmp loop_HW1
double_HW1:
	movl source(%ebx), %r10d 
	movl %r10d, destination(%ebx)
	add $4, %rbx
	sub $4, %eax
	jmp loop_HW1
word_HW1:
	movw source(%ebx), %r10w 
	movw %r10w, destination(%ebx)
	add $2, %rbx
	sub $2, %eax
	jmp loop_HW1
byte_HW1:
	movb source(%ebx), %r10b 
	movb %r10b, destination(%ebx)
	add $1, %rbx
	sub $1, %eax
	jmp loop_HW1
	negative_HW1:
	mov %eax, (destination)
end_HW1:
