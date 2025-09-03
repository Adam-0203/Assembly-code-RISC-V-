.data
space:  .asciiz " "
newline: .asciiz "\n"

A:  .word 1, 2, 3
    .word 4, 5, 6
    .word 7, 8, 9

B:  .word 1, 2, 3
    .word 4, 5, 6
    .word 7, 8, 9

C: .space 36 

.text
main: 
    la x20, A
    la x21, B
    la x22, C

    addi x30,x0,3

    addi x1,x0,0
    LOOP1:
        beq x1,x30, AFFICHER_PREP
        addi x2,x0,0

        LOOP2:
            beq x2,x30,LOOP1_PREP

            addi x10,x0,0

            addi x3,x0,0
            LOOP3:
                beq x3,x30,LOOP2_PREP

                slli x4,x1,2
                slli x5,x2,2
                slli x6,x3,2

                mul x7,x4,x30
                add x7,x7,x6
                add x7,x7,x20
                lw x7, 0(x7)

                mul x8,x6,x30
                add x8,x8,x5
                add x8,x8,x21
                lw x8, 0(x8)

                mul x9,x7,x8
                add x10,x10,x9
                addi x3,x3,1
                beq x0,x0, LOOP3

            LOOP2_PREP:
                mul x7,x4,x30
                add x7,x7,x5
                add x7,x7,x22
                sw x10, 0(x7)

                addi x2,x2,1
                beq x0,x0,LOOP2

        LOOP1_PREP:
            addi x1,x1,1
            beq x0,x0,LOOP1


    

    AFFICHER_PREP:  li x21, 9
                    li x20, 0
                    la x22, C
                    addi x15,x0,3
                    addi x16,x0,6
                    beq x0,x0, AFFICHER
                
                
    AFFICHER: 
                beq x21, x20, EXIT           
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
