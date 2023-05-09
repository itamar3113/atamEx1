.global _start

.section .text
_start:
    leaq source, %rsi
    leaq destination, %rdi
    mov num, %ecx
    cmp $0, %ecx
    js negative_HW1
    xor %rbx, %rbx
    xor %rdx, %rdx
    
    movsx %ecx, %rcx
    cmp %rsi, %rdi
    jle no_overlap_HW1
    
    mov %rdi, %rax
    sub %rsi, %rax
    cmp %rcx, %rax
    jge no_overlap_HW1
    
    leaq (%rsi, %rcx), %r8
    leaq (%rdi, %rcx), %r9
    sub $1, %r8
    sub $1, %r9

goback_HW1:
    movb (%r8), %r10b
    movb %r10b, (%r9)
    sub $1, %r8
    sub $1, %r9
    dec %rcx
    cmp $0, %rcx
    jg goback_HW1
    jmp end_ex2_HW1 

no_overlap_HW1:
    movb (%rsi, %rdx), %r9b
    movb %r9b, (%rdi, %rdx)
    inc %rdx
    dec %rcx
    cmp $0, %rcx
    jg no_overlap_HW1
    jmp end_ex2_HW1

negative_HW1:
    movl (num), %eax
    movl %eax, destination
    
end_ex2_HW1: