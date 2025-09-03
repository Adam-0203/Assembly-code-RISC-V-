.data
space:  .asciiz " "
newline: .asciiz "\n"

A:  .word 1,2,3
    .word 4,5,6
    .word 7,8,9

B:  .word 1,2,3
    .word 4,5,6
    .word 7,8,9

C: .space 36

.text

main:
    addi x15,x0,3
    addi x16,x0,6

    la x1, A
    la x2, B
    la x3, C

    li x21, 9
    li x20, 0
    la x22, C

    li x31, 9
    li x30, 0

    LOOP:   beq x30,x31, AFFICHER
            lw x4, 0(x1)
            lw x5, 0(x2)
            add x6,x4,x5 

            sw x6, 0(x3)

            addi x1,x1,4
            addi x2,x2,4
            addi x3,x3,4
            addi x30, x30, 1
            beq x0,x0, LOOP

    AFFICHER:   beq x21, x20, EXIT
                
                lw x29, 0(x22)
                addi a0, x0,1
                addi a1, x29, 0
                ecall

                li a0, 4
                la a1, space
                ecall

                addi x22, x22, 4
                addi x20, x20, 1

                beq x20,x15, NEXT2
                beq x20,x16, NEXT2

                NEXT1 : 
                        beq x0,x0, AFFICHER
                NEXT2 : 
                        li a0, 4
                        la a1, newline
                        ecall
                        beq x0,x0, AFFICHER

    EXIT : addi x0,x0, 0

            





    
