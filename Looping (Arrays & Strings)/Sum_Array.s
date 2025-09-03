.data 
arr : .word 1,2,3,4,5

.text

main:
    la t0, arr
    addi x20, x0, 0
    addi x4, x0, 5
    addi x30, x0, 0

    LOOP :  bge x20, x4, EXIT
            slli t1, x20 ,2
            add t1, t1, t0
            lw x1 , 0(t1)
            add x30, x30, x1
            addi x20, x20, 1
            beq x0, x0, LOOP

    EXIT : addi a0, x0, 1
           addi a1, x30, 0
           ecall
