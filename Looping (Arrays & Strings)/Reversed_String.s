.data
my_string: .asciiz "Hello"
reversed_string: .asciiz ""

.text
main:
    addi x20, x0, 0
    addi x30, x0, 0
    la t0, my_string
    la x2, reversed_string
    lb x1, 0(t0)

    LOOP :  beq x1, x0, CONTINUE
            addi x20, x20, 1
            add t1, t0, x20
            lb x1, 0(t1)
            beq x0, x0, LOOP

    CONTINUE :  addi x20, x20, -1
                lb x1, 0(t0)

    LOOP1 : beq x1, x0, EXIT
            add t1, t0, x20
            lb x1, 0(t1)
            add x3,x2,x30
            sb x1, 0(x3)
            addi x20, x20, -1
            addi x30, x30, 1
            beq x0, x0, LOOP1

    EXIT :  li a0, 4
            la a1, reversed_string
            ecall
