.data
my_string: .asciiz "Hello"
new_string: .asciiz ""

.text

main:
    addi x20, x0, 0
    la t0, my_string
    la x30, new_string
    lb x1, 0(t0)

    LOOP :  beq x1, x0, EXIT
            add t1, t0, x20
            add x31, x30, x20
            lb x1, 0(t1)
            sb x1, 0(x31)
            
            addi x20, x20, 1
            beq x0, x0, LOOP

    EXIT :  li a0, 4
            la a1, new_string
            ecall
