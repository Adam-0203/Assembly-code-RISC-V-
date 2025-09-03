main:
    # Step 1: Extract bits 16-11 from x5
    lui x8, 16
    addi x8, x8, 3072       # Load mask 0xFC00 into x8
    and x7, x5, x8     # Apply the mask to extract bits 16-11

    # Step 2: Shift the extracted bits to align with bits 31-26 in x6
    slli x7, x7, 15       # Shift left by 15 to move bits to positions 26-31

    # Step 3: Load a mask to clear bits 31-26 in x6
    li x10,x0, 0xFFFFFFFF81FFFFFF      # Load mask 0xFC00 into x8
    or x9, x7, x10   # Mask to clear bits 31-26 (0x81FFFFFF = 10000001111111111111111111111111 in binary)

    # Step 4: Insert the shifted bits into x6
    or x6, x5, x7         # Combine x6 with the shifted bits from x5
    and x6, x6, x9        # Apply the mask to clear the original bits 31-26 in x6
    
