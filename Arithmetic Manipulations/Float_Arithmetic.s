.data 
value_5 : .float 5
value_9 : .float 9
value_32 : .float 32
farh : .float 30

.text
main:
    la x5, value_5
    flw f5, 0(x5)

    la x9, value_9
    flw f9, 0(x9)

    la x30, value_32
    flw f30, 0(x30)

    la x1, farh
    flw f1, 0(x1)

    fdiv.s f2, f5, f9
    fsub.s f1, f1,f30
    fmul.s f1,f1,f2

    add x0, x0,x0
