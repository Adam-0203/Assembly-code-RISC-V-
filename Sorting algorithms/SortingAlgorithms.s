.data
L:    .word 34, 7, 23, 87, 12, 5, 9, 66, 18, 42
size: .word 10
L1:   .word 34, 7, 23, 87, 12, 5, 9, 66, 18, 42
L2:   .word 34, 7, 23, 87, 12, 5, 9, 66, 18, 42
L3:   .word 34, 7, 23, 87, 12, 5, 9, 66, 18, 42
L4:   .word 34, 7, 23, 87, 12, 5, 9, 66, 18, 42
newline:    .asciiz "\n\n"
newline_:    .asciiz "\n"
space:      .asciiz " "
nbr_inst:   .asciiz "The number of instructions : "
prefix_0:   .asciiz "The original Array : \n["
prefix_1:   .asciiz "The bubble sorted Array : \n["
prefix_2:   .asciiz "The selection sorted Array : \n["
prefix_3:   .asciiz "The insertion sorted Array : \n["
prefix_4:   .asciiz "The quick sorted Array : \n["
suffix:     .asciiz "]\n"
comma:      .asciiz ", "


.text




main:
    la t2, L
    lw t1, size

    li a0, 4
    la a1, prefix_0
    ecall
    jal ra, print_list
    li a0, 4
    la a1, newline_
    ecall


    la t2, L1
    li t6, 0
    jal ra, bubble_sort

    li a0, 4
    la a1, prefix_1
    ecall
    jal ra, print_list
    li a0, 4
    la a1, nbr_inst
    ecall
    addi a0, x0, 1
    addi a1, t6, 0
    ecall
    li a0, 4
    la a1, newline
    ecall


    la t2, L2
    li t6, 0
    jal ra, selection_sort

    li a0, 4
    la a1, prefix_2
    ecall
    jal ra, print_list
    li a0, 4
    la a1, nbr_inst
    ecall
    addi a0, x0, 1
    addi a1, t6, 0
    ecall
    li a0, 4
    la a1, newline
    ecall

    la t2, L3
    li t6, 0
    jal ra, insertion_sort

    li a0, 4
    la a1, prefix_3
    ecall
    jal ra, print_list
    li a0, 4
    la a1, nbr_inst
    ecall
    addi a0, x0, 1
    addi a1, t6, 0
    ecall
    li a0, 4
    la a1, newline
    ecall

    la t2, L4
    li t6, 0
    jal ra, quick_sort

    li a0, 4
    la a1, prefix_4
    ecall
    jal ra, print_list
    li a0, 4
    la a1, nbr_inst
    ecall
    addi a0, x0, 1
    addi a1, t6, 0
    ecall
    li a0, 4
    la a1, newline
    ecall
    

    li a0, 10
    ecall



insertion_sort:
    addi s1,x0, 1
    addi t6, t6,1

    
    _LOOP1_:
        beq  s1, t1, _FIN_
        addi t6, t6,1

        addi s2, s1, 0 
        addi t6, t6,1


        _LOOP2_:
            beq s2,x0,_PREP_LOOP1_
            addi t6, t6,1
            addi s3,s2,-1
            addi t6, t6,1
            slli s4,s2,2
            addi t6, t6,1
            slli s5,s3,2
            addi t6, t6,1
            add s4,s4,t2
            addi t6, t6,1
            add s5,s5,t2
            addi t6, t6,1

            lw s6, 0(s4)
            addi t6, t6,1
            lw s7, 0(s5)
            addi t6, t6,1

            bge s6,s7, _PREP_LOOP1_
            addi t6, t6,1

            sw s6, 0(s5)
            addi t6, t6,1
            sw s7, 0(s4)
            addi t6, t6,1

            addi s2,s2,-1
            addi t6, t6,1
            beq x0,x0,_LOOP2_
            addi t6, t6,1


    _PREP_LOOP1_:
        addi s1,s1,1 
        addi t6, t6,1
        beq x0,x0,_LOOP1_
        addi t6, t6,1

    _FIN_:
        ret







selection_sort:
    li s1, 0
    addi t6, t6,1
    LOOP1_:
        beq s1, t1, FIN_
        addi t6, t6,1
        add s2, x0, s1
        addi t6, t6,1
        add s3, x0, s1
        addi t6, t6,1
        LOOP2_:
            blt t1, s2, PREP_LOOP1_
            addi t6, t6,1

            slli s5, s2, 2
            addi t6, t6,1
            slli s6, s3, 2
            addi t6, t6,1
            add s5, t2,s5
            addi t6, t6,1
            add s6, t2,s6 
            addi t6, t6,1
            lw s7, 0(s5)
            addi t6, t6,1
            lw s8, 0(s6)
            addi t6, t6,1

            bge s7,s8,NEXT_
            addi t6, t6,1
            addi s3, s2,0
            addi t6, t6,1

            NEXT_:
                addi s2,s2,1
                addi t6, t6,1
                beq x0,x0,LOOP2_
                addi t6, t6,1

        PREP_LOOP1_:
            slli s5, s1, 2
            addi t6, t6,1
            add s5, t2, s5
            addi t6, t6,1
            lw s7, 0(s5)
            addi t6, t6,1

            sw s8, 0(s5)
            addi t6, t6,1
            sw s7, 0(s6)
            addi t6, t6,1

            addi s1, s1, 1
            addi t6, t6,1
            beq x0,x0, LOOP1_
            addi t6, t6,1
            

    FIN_:
        la t2, L2
        ret
    

bubble_sort:
    li s1, 0
    addi t6, t6,1
    li s0, 9
    addi t6, t6,1
    LOOP1:
        beq s1, t1, FIN
        addi t6, t6,1
        li s2, 0
        addi t6, t6,1
        sub s3, s0, s1
        addi t6, t6,1
        LOOP2:
            beq s2, s3, PREP_LOOP1
            addi t6, t6,1
            addi s4, s2, 1
            addi t6, t6,1

            slli s5, s2, 2
            addi t6, t6,1
            slli s6, s4, 2
            addi t6, t6,1
            add s5,s5,t2
            addi t6, t6,1
            add s6,s6,t2
            addi t6, t6,1
            lw s7, 0(s5)
            addi t6, t6,1
            lw s8, 0(s6)
            addi t6, t6,1

            bge s8, s7, NO_SWAP
            addi t6, t6,1
            sw s7, 0(s6)
            addi t6, t6,1
            sw s8, 0(s5)
            addi t6, t6,1

            NO_SWAP:
                addi s2,s2,1
                addi t6, t6,1
                beq x0,x0,LOOP2
                addi t6, t6,1

        PREP_LOOP1:
            addi s1, s1, 1
            addi t6, t6,1
            beq x0,x0, LOOP1
            addi t6, t6,1

    FIN:
        la t2, L1
        addi t6, t6,1
        ret

      
print_list:
        li t0, 0
        li s0, 9
        loop:
            beq t0, t1, END
            slli t3, t0, 2
            add t3, t3, t2
            lw t4, 0(t3)

            addi a0,x0, 1
            addi a1,t4, 0
            ecall
 
            beq t0, s0, NEXT
            li a0, 4
            la a1, comma
            ecall
            NEXT:
                addi t0,t0,1
                beq x0,x0,loop

        END: 
            li a0, 4
            la a1, suffix
            ecall
            ret

quick_sort:
    # Save return address and other registers we'll use
    addi sp, sp, -24
    addi t6,t6,1
    sw ra, 0(sp)
    addi t6,t6,1
    sw s1, 4(sp)
    addi t6,t6,1
    sw s2, 8(sp)
    addi t6,t6,1
    sw s3, 12(sp)
    addi t6,t6,1
    sw s4, 16(sp)
    addi t6,t6,1
    sw s5, 20(sp)
    addi t6,t6,1
    
    # Call the recursive quick sort function with lo=0, hi=size-1
    li a0, 0           # lo = 0
    addi t6,t6,1
    addi a1, t1, -1    # hi = size - 1
    addi t6,t6,1
    jal ra, quick_sort_recursive
    addi t6,t6,1
    
    # Restore registers and return
    lw ra, 0(sp)
    addi t6,t6,1
    lw s1, 4(sp)
    addi t6,t6,1
    lw s2, 8(sp)
    addi t6,t6,1
    lw s3, 12(sp)
    addi t6,t6,1
    lw s4, 16(sp)
    addi t6,t6,1
    lw s5, 20(sp)
    addi t6,t6,1
    addi sp, sp, 24
    addi t6,t6,1
    jr ra
    addi t6,t6,1

# Quick sort recursive function
# a0 = lo, a1 = hi
quick_sort_recursive:
    # Check if lo < hi
    bge a0, a1, quick_sort_done
    addi t6,t6,1
    
    # Save parameters for recursive calls
    addi sp, sp, -16
    addi t6,t6,1
    sw ra, 0(sp)
    addi t6,t6,1
    sw a0, 4(sp)  # save lo
    addi t6,t6,1
    sw a1, 8(sp)  # save hi
    addi t6,t6,1
    
    # Call partition(arr, lo, hi)
    jal ra, partition
    addi t6,t6,1
    
    # a0 now contains pivot index
    sw a0, 12(sp)  # save pivot
    addi t6,t6,1
    
    # First recursive call: quick_sort_recursive(arr, lo, pivot-1)
    lw a0, 4(sp)   # lo
    addi t6,t6,1
    lw a1, 12(sp)  # pivot
    addi t6,t6,1
    addi a1, a1, -1  # pivot - 1
    addi t6,t6,1
    jal ra, quick_sort_recursive
    addi t6,t6,1
    
    # Second recursive call: quick_sort_recursive(arr, pivot+1, hi)
    lw a0, 12(sp)  # pivot
    addi t6,t6,1
    addi a0, a0, 1   # pivot + 1
    addi t6,t6,1
    lw a1, 8(sp)   # hi
    addi t6,t6,1
    jal ra, quick_sort_recursive
    addi t6,t6,1
    
    # Restore stack and return
    lw ra, 0(sp)
    addi t6,t6,1
    addi sp, sp, 16
    addi t6,t6,1
    
quick_sort_done:
    jr ra
    addi t6,t6,1

# Partition function for quick sort
# a0 = lo, a1 = hi
# Returns pivot index in a0
partition:
    # Save registers
    addi sp, sp, -24
    addi t6,t6,1
    sw ra, 0(sp)
    addi t6,t6,1
    sw s1, 4(sp)
    addi t6,t6,1
    sw s2, 8(sp)
    addi t6,t6,1
    sw s3, 12(sp)
    addi t6,t6,1
    sw s4, 16(sp)
    addi t6,t6,1
    sw s5, 20(sp)
    addi t6,t6,1
    
    # s1 = lo, s2 = hi
    mv s1, a0
    addi t6,t6,1
    mv s2, a1
    addi t6,t6,1
    
    # Choose pivot as rightmost element (arr[hi])
    slli s3, s2, 2     # s3 = hi * 4
    addi t6,t6,1
    add s3, t2, s3     # s3 = address of arr[hi]
    addi t6,t6,1
    lw s4, 0(s3)       # s4 = arr[hi] (pivot value)
    addi t6,t6,1
    
    # Initialize i to lo-1
    addi s5, s1, -1    # s5 = i = lo - 1
    addi t6,t6,1
    
    # For j = lo to hi-1
    mv a0, s1          # a0 = j = lo
    addi t6,t6,1
    
partition_loop:
    bge a0, s2, partition_end  # if j >= hi, exit loop
    addi t6,t6,1
    
    # Get arr[j]
    slli s3, a0, 2     # s3 = j * 4
    addi t6,t6,1
    add s3, t2, s3     # s3 = address of arr[j]
    addi t6,t6,1
    lw a1, 0(s3)       # a1 = arr[j]
    addi t6,t6,1
    
    # If arr[j] <= pivot
    bgt a1, s4, partition_next
    addi t6,t6,1
    
    # Increment i
    addi s5, s5, 1     # i++
    addi t6,t6,1
    
    # Swap arr[i] and arr[j]
    slli s3, s5, 2     # s3 = i * 4
    addi t6,t6,1
    add s3, t2, s3     # s3 = address of arr[i]
    addi t6,t6,1
    lw a1, 0(s3)       # a1 = arr[i]
    addi t6,t6,1
    
    slli a2, a0, 2     # a2 = j * 4
    addi t6,t6,1
    add a2, t2, a2     # a2 = address of arr[j]
    addi t6,t6,1
    lw a3, 0(a2)       # a3 = arr[j]
    addi t6,t6,1
    
    # Perform swap
    sw a3, 0(s3)       # arr[i] = arr[j]
    addi t6,t6,1
    sw a1, 0(a2)       # arr[j] = arr[i]
    addi t6,t6,1
    
partition_next:
    addi a0, a0, 1     # j++
    addi t6,t6,1
    j partition_loop
    addi t6,t6,1
    
partition_end:
    # Swap arr[i+1] and arr[hi]
    addi s5, s5, 1     # i = i + 1
    addi t6,t6,1
    
    # Get arr[i+1]
    slli s3, s5, 2     # s3 = (i+1) * 4
    addi t6,t6,1
    add s3, t2, s3     # s3 = address of arr[i+1]
    addi t6,t6,1
    lw a1, 0(s3)       # a1 = arr[i+1]
    addi t6,t6,1
    
    # Get arr[hi]
    slli a2, s2, 2     # a2 = hi * 4
    addi t6,t6,1
    add a2, t2, a2     # a2 = address of arr[hi]
    addi t6,t6,1
    lw a3, 0(a2)       # a3 = arr[hi]
    addi t6,t6,1
    
    # Perform swap
    sw a3, 0(s3)       # arr[i+1] = arr[hi]
    addi t6,t6,1
    sw a1, 0(a2)       # arr[hi] = arr[i+1]
    addi t6,t6,1
    
    # Return i+1 as pivot position
    mv a0, s5
    addi t6,t6,1
    
    # Restore registers
    lw ra, 0(sp)
    addi t6,t6,1
    lw s1, 4(sp)
    addi t6,t6,1
    lw s2, 8(sp)
    addi t6,t6,1
    lw s3, 12(sp)
    addi t6,t6,1
    lw s4, 16(sp)
    addi t6,t6,1
    lw s5, 20(sp)
    addi t6,t6,1
    addi sp, sp, 24
    addi t6,t6,1
    jr ra
    addi t6,t6,1