.data
my_string: .asciiz "Hello"

.text

main:
    addi x20, x0, 0
    la t0, my_string
    lb x1, 0(t0)

    LOOP :  beq x1, x0, EXIT
            addi x20, x20, 1
            add t1, t0, x20
            lb x1, 0(t1)
            beq x0, x0, LOOP

    EXIT :  addi a0, x0, 1
            addi a1, x20, 0
            ecall
