.code64
.globl _start

.section .text

_start:
    callq    main

    movq     %rax,  %rdi 
    movq     $0x3c, %rax
    syscall


main:
    pushq    %rsp
    movq     %rsp,    %rbp

    movq     $0x01,   %rax
    movq     $0x01,   %rdi
    movq     $magic,  %rsi
    movq     $0x1a,   %rdx
    syscall

    movq     $0x00,   %rax

    leaveq
    ret


magic:
    rex.WRXB outsl        %ds:(%rsi), (%dx)
    outsl    %ds:(%rsi),  (%dx)
    .byte    0x70,        0x73
    and      %esp,        (%rax)
    .byte    0x49,        0x74,       0x20
    imul     $0x72772061, 0x20(%rbx), %esi
    outsl    %ds:(%rsi),  (%dx)
    outsb    %ds:(%rsi),  (%dx)
    and      %dh,         0x61(%edi)
    .byte    0x79,        0x21,       0x0a

