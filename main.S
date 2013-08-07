.code64
.globl _start

.section .text

_start:
    movq     %rax,  %rdi
    movq     $0x3c, %rax
    syscall
