#ECE 366 Sample Program 3
# Author: Trung Le,  Wenjing Rao
#
#	This program contains 3 arrays: A , B, C
#	It calculates C[i] = A[i] XOR B[i]	
#	and stores back into array C

.data
	A:	.word	0, -1, 0xFFFF0000, 0x0F0F0F0F, 0x33333333, 0xCCCCCCCC, 
			0x66666666, 0xFFFF
	B:	.word 	5,8,-2,-1, -3, -4, -5, -6
	C:	.word	10, 20, 30, 40, 50, 60, 70, 80
	D: 	.word	0xAABBCCDD	# marker of boundary. 

.text
	addi $t0,$zero,0x2000		# Base address of array A
	addi $t1,$t0,32			# Base address of array B  
	addi $t2,$t0,64			# Base address of array C
	addi $t3,$0,8			# init counter = 8 (# in each array) 	

loop:	
	lw $s0,0($t0)			# Load number of array A[i] into $s0
	lw $s1,0($t1)			# Load number of array B[i] into $s1
	xor $s2,$s0,$s1			# C[i] = A[i] XOR B[i]
	sw $s2,0($t2)			# store C[i] back into array

	addi $t0,$t0,4			# Increment i for A[i], B[i], C[i]
	addi $t1,$t1,4
	addi $t2,$t2,4
	
	subi $t3,$t3,1			# Decrement counter
	beq $t3,$0,exit
	j loop


exit:	j exit			# deadloop after finishing
