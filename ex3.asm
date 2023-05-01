.global _start

.section .text
_start:
#your code here
	xor %r8, %r8
	xor %r9, %r9
	movq $-4, %r10
	movl (array1), %eax
	movl (array2), %ebx
loop_HW1:
	test %eax, %eax
	jz array1_done_HW1
	test %ebx, %ebx
	jz array2_done_HW1
	cmp %ebx, %eax
	je equal_HW1
	jg array1_HW1
	add $4, %r9
	cmpl mergedArray(%r10), %ebx
    cmove array2(%r9), %ebx
	je loop_HW1
	add $4, %r10
	movl %ebx, mergedArray(%r10)
	movl array2(%r9), %ebx
	jmp loop_HW1
equal_HW1:
	add $4, %r8
	add $4, %r9
	cmpl mergedArray(%r10), %ebx
    cmove array1(%r8), %eax
    cmove array2(%r9), %ebx
	je loop_HW1
	add $4, %r10
	movl %ebx, mergedArray(%r10)
	movl array1(%r8), %eax
	movl array2(%r9), %ebx
	jmp loop_HW1
array1_HW1:
	add $4, %r8
	cmpl mergedArray(%r10), %eax
    cmove array1(%r8), %eax
	je loop_HW1
	add $4, %r10
	movl %eax, mergedArray(%r10)
	movl array1(%r8), %eax
	jmp loop_HW1
array1_done_HW1:
	test %ebx, %ebx
	jz end_HW1
	add $4, %r9
 	cmpl mergedArray(%r10), %ebx
    cmove array2(%r9), %ebx
	je array1_done_HW1
	add $4, %r10
	movl %ebx, mergedArray(%r10)
	movl array2(%r9), %ebx
	jmp array1_done_HW1
array2_done_HW1:
	test %eax, %eax
	jz end_HW1
	add $4, %r8
	cmpl mergedArray(%r10), %eax
    cmove array1(%r8), %eax
	je array2_done_HW1
	add $4, %r10
	movl %eax, mergedArray(%r10)
	movl array1(%r8), %eax
	jmp array2_done_HW1
end_HW1:
    add $4, %r10
	movl $0, mergedArray(%r10)

