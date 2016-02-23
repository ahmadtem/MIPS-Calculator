.globl main
.globl end
.globl parse
.globl is_not_int
.globl mult_10
.globl store_int
.globl exp_stored
.globl is_v
.globl is_w
.globl is_x
.globl is_y
.globl is_z
.globl var_placed
.globl prths_src
.globl prths_found
.globl close_prths
.globl found_prths_set
.globl no_prths
.globl DO_MATH
.globl neg_to_pos
.globl handle_negativity
.globl handle_multp
.globl eval_multp
.globl mltp
.globl left_mltp
.globl right_mltp
.globl mltp_loop
.globl mult_done
.globl eval_multp1
.globl eval_multp2
.globl handle_expnt
.globl eval_expnt
.globl eval_expnt1
.globl eval_expnt2
.globl expnt_loop
.globl expnt_ans
.globl expnt_done
.globl handle_divsn
.globl eval_divsn
.globl eval_divsn1
.globl eval_divsn2
.globl divsn
.globl left_divsn
.globl right_divsn
.globl divsn_loop
.globl divsn_done
.globl is_div_sign
.globl div_or_mod_done
.globl handle_mod
.globl handle_add
.globl eval_add
.globl eval_add1
.globl eval_add2
.globl sum_done
.globl end_loop
.globl dont_inc_cnt
.globl inc_cnt
.globl store_value
.globl ans_v
.globl ans_w
.globl ans_x
.globl ans_y
.globl ans_z
.globl chk_final_ans
.globl end_point

.data

v:	.half 15
w:	.half 3
x:	.half 231
y:	.half 100
z:	.half 3
exp:	.asciiz "x=(y/10)+x"

.text

is_v:	
	lh $t1, 0($t7)			# v replaced with its value in t1 
	add $0, $0, $0			# NOP
	beq $0, $0, var_placed		# ALWAYS branch to var_placed
	add $0, $0, $0			# NOP

is_w:
	lh $t1, 2($t7)			# w replaced with its value in t1
	add $0, $0, $0			# NOP
	beq $0, $0, var_placed		# ALWAYS branch to var_placed
	add $0, $0, $0			# NOP

is_x:
	lh $t1, 4($t7)			# x replaced with its value in t1
	add $0, $0, $0			# NOP
	beq $0, $0, var_placed		# ALWAYS branch to var_placed
	add $0, $0, $0			# NOP

is_y:
	lh $t1, 6($t7)			# y replaced with its value in t1
	add $0, $0, $0			# NOP
	beq $0, $0, var_placed		# ALWAYS branch to var_placed
	add $0, $0, $0			# NOP

is_z:
	lh $t1, 8($t7)			# z replaced with its value in t1
	add $0, $0, $0			# NOP
	beq $0, $0, var_placed		# ALWAYS branch to var_placed
	add $0, $0, $0			# NOP

ans_v:
	sw $v0, 0($t7)			# final answer stored in v
	add $0, $0, $0			# NOP
	beq $0, $0, end			# ALWAYS branch to end
	add $0, $0, $0			# NOP

ans_w:
	sw $v0, 2($t7)			# final answer stored in v
	add $0, $0, $0			# NOP
	beq $0, $0, end			# ALWAYS branch to end
	add $0, $0, $0			# NOP

ans_x:
	sw $v0, 4($t7)			# final answer stored in v
	add $0, $0, $0			# NOP
	beq $0, $0, end			# ALWAYS branch to end
	add $0, $0, $0			# NOP

ans_y:
	sw $v0, 6($t7)			# final answer stored in v
	add $0, $0, $0			# NOP
	beq $0, $0, end			# ALWAYS branch to end
	add $0, $0, $0			# NOP

ans_z:
	sw $v0, 8($t7)			# final answer stored in v
	add $0, $0, $0			# NOP
	beq $0, $0, end			# ALWAYS branch to end
	add $0, $0, $0			# NOP

mult_10:
	sub $t1, $t1, 0x0030		# convert ascii to decimal
	sll $t5, $s1, 3			# first part: mult t1 by 8
	sll $t6, $s1, 1			# second part: mult t1 by 2
	add $s1, $t5, $t6		# add both parts and save in s1
	add $s1, $s1, $t1		# add current integer to s1
	beq $0, $0, parse		# ALWAYS branch to parse
	add $0, $0, $0			# NOP

store_int:
	sw $s1, ($sp)			# store s1 in stack
	addi $sp, $sp, 4		# increment stack pointer
	add $s1, $0, $0			# reset s1 to 0

is_not_int:
	lui $t7, 0x1000			# load starting address in t7
	beq $t1, 0x0076, is_v		# if t1==v, branch to is_v 
	add $0, $0, $0			# NOP
	beq $t1, 0x0077, is_w		# if t1==w, branch to is_w 
	add $0, $0, $0			# NOP
	beq $t1, 0x0078, is_x		# if t1==x, branch to is_x 
	add $0, $0, $0			# NOP
	beq $t1, 0x0079, is_y		# if t1==y, branch to is_y 
	add $0, $0, $0			# NOP
	beq $t1, 0x007A, is_z		# if t1==z, branch to is_z 
	add $0, $0, $0			# NOP

var_placed:
	bne $s2, $0, exp_stored		# if next char is NUl, branch to exp_stored
	add $0, $0, $0			# NOP
	sw $t1, ($sp)			# store char in stack
	addi $sp, $sp, 4		# increment stack pointer
	beq $0, $0, parse		# ALWAYS branch to parse
	add $0, $0, $0			# NOP

prths_found:
	addi $s3, $0, 1			# (boolean) s3=1 if expression contains prths
	add $s2, $s2, $s4		# increment temp prths stack pointer by 4
	add $t3, $0, $s2		# temp stack pointer holding prths, s2 stored in t3
	beq $0, $0, prths_src		# ALWAYS branch to prhts_src
	add $0, $0, $0			# NOP (NOTE: t3 stores 4 more than it should)

close_prths:
	add $t0, $t0, $s4		# increment temp stack pointer (initially to char after inner most prths)
	add $t4, $t4, $s4		# increment temp closing prths pointer, t4 by 4
	lw $t1, 0($t0)			# load current value of temp stack pointer, t0 in t1
	add $0, $0, $0			# NOP
	bne $t1, 0x0029, close_prths	# if closing prths not found, branch to close_prths 
	add $0, $0, $0			# NOP
	beq $t1,0x0029,found_prths_set	# if closing prths found, branch to found_prths_set 
	add $0, $0, $0			# NOP

neg_to_pos:
	addi $t5, $0, 0x0020		# store hex value of space char in t5
	add $a0, $a0, $s4		# increment a0 by 4
	lw $t1, ($a0)			# load value of a0 onto t1
	add $0, $0, $0			# NOP
	beq $t5, $t1, neg_to_pos	# if t1 is space, branch to neg_to_pos
	add $0, $0, $0			# NOP

# spaces accounted for by this point
	sub $t0, $t0, 2			# override '-' sign with '+' sign
	sw $t0, 0($s5)			# store '+' sign
	add $0, $0, $0			# NOP
	sub $t1, $0, $t1		# negate value of t1
	sw $t1, 0($a0)			# store the product in place of the '+' sign
	add $0, $0, $0			# NOP
	beq $0, $0, expnt_done		# ALWAYS branch to sum_done
	add $0, $0, $0			# NOP
	add $a0, $a0, $s4		# increment a0 by 4
	beq $0, $0, DO_MATH		# ALWAYS branch to D0_MATH
	add $0, $0, $0			# NOP

right_divsn:
	add $v1, $v1, $t6	 	# add remainder with divisor and store in remainder register
	sll $v0, $v0, 1	 	 	# shift quotient register to the left
	srl $t6, $t6, 1	 	 	# Shift divisor register right 1 bit
	jr $ra			 	# Return
	add $0, $0, $0		 	# Branch Delay Slot (NOP)

left_divsn:
	sll $v0, $v0, 1		 	# shift quotient register to the left
	addi $v0, $v0, 1	 	# add 1 to v0
	srl $t6, $t6, 1	 	 	# Shift divisor register right 1 bit
	jr $ra			 	# Return
	add $0, $0, $0		 	# Branch Delay Slot (NOP)

divsn:
	sub $v1, $v1, $t6	 	# Subtract divisor from remainder and place result in the remainder register
	beq $v1, $0, left_divsn		# go left if remainder is 0
	add $0, $0, $0		 	# NOP	
	slt $t1, $v1, $0	 	# t1 = 1 if remainder is less than 0 (1 if v1 < zero , 0 if v1 >= zero)
	bne $t1, $0, right_divsn 	# if t1 == 1, branch to right_divsn
	and $0, $0, $0		 	# Branch delay slot (NOP)
	beq $t1, $0, left_divsn  	# if t1 == 0, branch to left_divsn
	and $0, $0, $0		 	# Branch delay slot (NOP)

divsn_loop:
	jal divsn			# Call the divsn routine
	add $0, $0, $0		 	# Branch delay slot (NOP)
	addi $t5, $t5, 1 	 	# increment divsn_loop counter, t5 by 1
	slti $t4, $t5, 17	 	# t4 = 1 if counter < 17
	bne $t4, $0, divsn_loop	 	# go to divsn_loop if counter is < 17
	add $0, $0, $0		 	# Branch Delay Slot (NOP)

# quotient must be in v0 and remainder must be in v1

div_or_mod_done:
	lw $t2, 0($a0)			# load char ('/' or '%') onto t2
	beq $t2, 0x002F, is_div_sign	# if t2 == '/' branch to is_div_sign
	add $0, $0, $0			# NOP
	beq $t2, 0x0025, is_mod_sign	# if t2 == '%' branch to is_mod_sign
	add $0, $0, $0			# NOP
	addi $t5, $0, 0x0020		# store hex value of space char in t5
	sw $t5, 0($s7)			# replace int at s7 with space
	add $0, $0, $0			# NOP
	sw $t5, 0($s6)			# replace int at s6 with space
	add $0, $0, $0			# NOP
	beq $0, $0, divsn_done		# ALWAYS branch to divsn_done
	add $0, $0, $0			# NOP

is_div_sign: 
	sw $v0, 0($a0)			# store the quotient in place of the '/' sign
	add $0, $0, $0			# NOP
	beq $0, $0, div_or_mod_done	# ALWAYS branch to div_or_mod_done
	add $0, $0, $0			#NOP

is_mod_sign: 
	sw $v1, 0($a0)			# store the remainder in place of the '%' sign
	add $0, $0, $0			# NOP
	beq $0, $0, div_or_mod_done	# ALWAYS branch to div_or_mod_done
	add $0, $0, $0			#NOP

eval_divsn:
	add $s7, $0, $a0		# s7 initialized as a0
	add $s6, $0, $a0		# s6 initialized as a0
	addi $t5, $0, 0x0020		# store hex value of space char in t5

eval_divsn1:
	sub $s7, $s7, $s4		# subtract s7 by 4 to get value before '/' or '%'
	lw $t7, ($s7)			# t7 holds value of int at s7
	add $0, $0, $0			# NOP
	beq $t5, $t7, eval_divsn1	# if t7 is space, branch to eval_divsn1
	add $0, $0, $0			# NOP

eval_divsn2:
	add $s6, $s6, $s4		# add s6 and 4 to get value after '/' or '%'
	lw $t6, ($s6)			# t6 holds value of int at s6
	add $0, $0, $0			# NOP
	beq $t5, $t6, eval_divsn2	# if t6 is space, branch to eval_divsn2
	add $0, $0, $0			# NOP

# spaces accounted for by this point, t7 is dividend and t6 is divisor

	add $v0, $0, $0	 	 	# Initialize quotent to zero
	add $v1, $0, $t7	 	# Remainder initialized to dividend
	add $t5, $0, $0		 	# Initialize divsn_loop counter, t5 to 0
	sll $t6, $t6, 16	 	# shift divisor by 16 bits left at start
	beq $0, $0, divsn_loop		# ALWAYS branch to divsn_loop
	add $0, $0, $0			# NOP


left_mltp:
	add $v1, $v1, $t6		# add multiplicand to product and store in product register

right_mltp:
	sll $t6, $t6, 1			# shift multiplicand left_mltp 1 bit
	srl $t7, $t7, 1			# shift multiplier right_mltp 1 bit
	jr $ra				# return
	add $0, $0, $0 			# NOP

mltp:
	andi $t1, $t7, 1		# stores LSB of t7 multiplier in t1
	beq $0, $t1, right_mltp 	# branch right_mltp if t1 LSB == 0
	add $0, $0, $0			# NOP
	bne $0, $t1, left_mltp		# branch left_mltp if t1 LSB != 0
	add $0, $0, $0			# NOP

mltp_loop:
	jal mltp			# jump to multiplication subroutine
	add $0, $0, $0			# NOP
	addi $s2, $s2, 1		# increment mltp_loop counter, s2 by 1
	slti $t0, $s2, 17		# t0, boolean set to 1 if counter is less than 17
	bne $t0, $0, mltp_loop		# branch to mltp_loop if counter is less than 17
	add $0, $0, $0			# NOP

# product must be stored in v1 at this point

	bne $s5, $0, expnt_ans		# if s5!=0, branch to expnt_ans
	add $0, $0, $0			# NOP 

	sw $v1, 0($a0)			# store the product in place of the '*' sign
	add $0, $0, $0			# NOP
	addi $t5, $0, 0x0020		# store hex value of space char in t5
	sw $t5, 0($s7)			# replace int at s7 with space
	add $0, $0, $0			# NOP
	sw $t5, 0($s6)			# replace int at s6 with space
	add $0, $0, $0			# NOP
	beq $0, $0, mult_done		# ALWAYS branch to mult_done
	add $0, $0, $0			# NOP

eval_multp:	
	add $s7, $0, $a0		# s7 initialized as a0
	add $s6, $0, $a0		# s6 initialized as a0
	addi $t5, $0, 0x0020		# store hex value of space char in t5
	
eval_multp1:
	sub $s7, $s7, $s4		# subtract s7 by 4 to get value before '*' 
	lw $t7, ($s7)			# t7 holds value of int at s7
	add $0, $0, $0			# NOP
	beq $t5, $t7, eval_multp1	# if t7 is space, branch to eval_multp1
	add $0, $0, $0			# NOP

eval_multp2:
	add $s6, $s6, $s4		# add s6 and 4 to get value after '*'
	lw $t6, ($s6)			# t6 holds value of int at s6
	add $0, $0, $0			# NOP
	beq $t5, $t6, eval_multp2	# if t6 is space, branch to eval_multp2
	add $0, $0, $0			# NOP

# spaces accounted for by this point, t7 and t6 are being multiplied

	add $v1, $0, $0			# v1, product register initialized to 0
	add $s2, $0, $0			# s2, mltp_loop counter initialized to 0
	beq $0, $0, mltp_loop		# ALWAYS branch to multp_loop
	add $0, $0, $0			# NOP

eval_expnt:
	add $s1, $0, $a0		# s1 initialized as a0, the number
	add $s3, $0, $a0		# s3, initialized as a0, the exponent
	addi $t5, $0, 0x0020		# store hex value of space char in t5

eval_expnt1:
	sub $s1, $s1, $s4		# subtract a0 by 4 to get value before '^' 
	lw $t1, ($s1)			# t1 holds value of int at s1
	add $0, $0, $0			# NOP
	beq $t5, $t1, eval_expnt1	# if t1 is space, branch to eval_expnt1
	add $0, $0, $0			# NOP

eval_expnt2:
	add $s3, $s3, $s4		# add s3 and 4 to get value after '^'
	lw $t2, ($s3)			# t2 holds value of int at s3
	add $0, $0, $0			# NOP
	beq $t5, $t2, eval_expnt2	# if t2 is space, branch to eval_multp2
	add $0, $0, $0			# NOP

# spaces accounted for by this point, and t1 is number and t2 is exponent

	add $v0, $0, $t1		# v0, exponent ans register initialized to t1
	add $t5, $0, $0			# expnt_loop counter, t5 initialized to 0

expnt_loop:
	# multiply t1 by t1, t2 amount of times and store in v0
	add $t7, $0, $v0		# v0 passed in as argument in t7 for multpication
	add $t6, $0, $t1		# t1 passed in as argument in t6 for multpication
	addi $t5, $t5, 1		# increment expnt_loop counter, t5 by 1
	slt $s5, $t5, $t2		# (boolean) s5=1, if loop counter, t5 < t2, exponent
	add $s2, $0, $0			# s2, mltp_loop counter initialized to 0
	bne $s5, $0, mltp_loop		# if s5==1, branch to mltp_loop (do multp)
	add $0, $0, $0			# NOP

# final expnt answer must be saved in v0 at this point
	
	sw $v0, 0($a0)			# store the product in place of the '^' sign
	add $0, $0, $0			# NOP
	addi $t5, $0, 0x0020		# store hex value of space char in t5
	sw $t5, 0($s1)			# replace int at s1 with space
	add $0, $0, $0			# NOP
	sw $t5, 0($s3)			# replace int at s3 with space
	add $0, $0, $0			# NOP
	beq $0, $0, expnt_done		# ALWAYS branch to expnt_done
	add $0, $0, $0			# NOP

expnt_ans:
	lw $t1, ($s1)			# reload value of $t1 
	add $0, $0, $0			# NOP
	add $v0, $0, $v1		# store ans in $v0
	add $v1, $0, $0			# v1, product register initialized to 0
	beq $0, $0, expnt_loop		# ALWAYS branch to expnt_loop
	add $0, $0, $0			# NOP

eval_add:
	add $s1, $0, $a0		# s1 initialized as a0, the number
	add $s3, $0, $a0		# s3, initialized as a0, the exponent
	addi $t5, $0, 0x0020		# store hex value of space char in t5

eval_add1:
	sub $s1, $s1, $s4		# subtract a0 by 4 to get value before '+' 
	lw $t1, ($s1)			# t1 holds value of int at s1
	add $0, $0, $0			# NOP
	beq $t5, $t1, eval_add1		# if t1 is space, branch to eval_add1
	add $0, $0, $0			# NOP

eval_add2:
	add $s3, $s3, $s4		# add s3 and 4 to get value after '+'
	lw $t2, ($s3)			# t2 holds value of int at s3
	add $0, $0, $0			# NOP
	beq $t5, $t2, eval_add2		# if t2 is space, branch to eval_add2
	add $0, $0, $0			# NOP

# spaces accounted for by this point, and t1 and t2 are numbers to be added
	add $v0, $t1, $t2		# sum stored in $v0
	sw $v0, 0($a0)			# store the product in place of the '+' sign
	add $0, $0, $0			# NOP
	addi $t5, $0, 0x0020		# store hex value of space char in t5
	sw $t5, 0($s1)			# replace int at s1 with space
	add $0, $0, $0			# NOP
	sw $t5, 0($s3)			# replace int at s3 with space
	add $0, $0, $0			# NOP
	beq $0, $0, expnt_done		# ALWAYS branch to sum_done
	add $0, $0, $0			# NOP

main:	
	add $s0, $0, $sp		# value of stack pointer preserved in s0
	lui $t0, 0x1000			# address of starting location stored in t0
	addi $t0, $t0, 11		# setting t0 to point to char '=' in the expression
	add $s1, $0, $0			# int value, s1 initialized to 0

parse:
	addi $t0, $t0, 1		# add offset 1 to position, t0
	lb $t1, ($t0)			# load current value of exp onto t1
	add $0, $0, $0			# NOP
	slt $s2, $t1, 0x0001		# NUL CHECK, s2=1 if current char is NUL
	slt $t2, $t1, 0x003A		# (boolean) t2=1, if t1 < 0x3A (hex for symbol after 9)
	slt $t3, $t1, 0x0030		# (boolean) t3=0, if t1 > 0x2F (hex for symbol before 0)
	nor $t3, $t3, $0		# if t3==0, make t3=1 
	and $t4, $t2, $t3		# t4=1, if and only if BOTH upper conditions are true
	bne $t4, $0, mult_10		# if current char is a number, branch to mult_10
	add $0, $0, $0			# NOP
	bne $s1, $0, store_int		# if s1 != 0, branch to store_int
	add $0, $0, $0			# NOP
	beq $s1, $0, is_not_int		# if s1 == 0, branch to is_not_int
	add $0, $0, $0			# NOP

# AT THIS POINT, EVERYTHING (EXCLUDING NUL) SHOULD BE STORED IN THE STACK
# DO NOT CHANGE $s0 OR $sp REGISTERS

exp_stored:
	add $t0, $0, $s0		# make t0 point to start of stack
	addi $s4, $0, 4			# initialize s4 to 4
	sub $t0, $t0, $s4		# sub 4 to account for first increment
	sub $s1, $sp, $s0		# number of elements stored in stack saved in s1
	add $s2, $0, $0			# another temp stack pointer used for prths, s2 initilized as 0
	add $s3, $0, $0			# initialize prths boolean,s3 to 0
	add $t3, $0, $0			# reset t3 as 0
 	
prths_src:
	add $t0, $t0, $s4		# increment temp stack pointer, t0 by 4
	lw $t1, 0($t0)			# load current value of temp stack pointer, t0 in t1
	add $0, $0, $0			# NOP
	beq $t1, 0x0028, prths_found	# if current char is '(', branch to prths_found
	add $0, $0, $0			# NOP
	add $s2, $s2, $s4		# increment temp prths stack pointer by 4
	bne $s2, $s1, prths_src		# branch to prths_src if every element is not checked yet
	add $0, $0, $0			# NOP
	beq $s3, $0, no_prths		# if no prths, branch to no_prths
	add $0, $0, $0			# NOP

# PROGRAM MUST HAVE LOCATION OF INNER MOST OPENING PARENTHESIS AT THIS POINT
	
	sub $t3, $t3, $s4		# sub t3 by 4 to account for offset
	add $t0, $0, $s0		# make t0 point to start of stack
	add $t0, $t0, $t3		# make t0 point to inner most opening prths
	add $t4, $0, $t3		# make t4 closing bracket temp pointer 
	beq $0, $0, close_prths		# ALWAYS branch to close_prths
	add $0, $0, $0			# NOP

# AT THIS POINT, THE PROGRAM HAS A SET OF PRTHS THE FIRST ONE STORED IN $t3 AND THE SECOND STORED IN $t4

found_prths_set:		# set a0 and a1 arguments for DO_MATH according to prths set found
	add $t0, $0, $s0		# make t0 point to start of stack
	add $a0, $t0, $t3		# a0 holding exact loc of opening prths in stack
	add $a1, $t0, $t4		# a1 holding exact loc of closing prths in stack
	beq $0, $0, DO_MATH		# ALWAYS branch to DO_MATH
	add $0, $0, $0			# NOP

no_prths:			# set a0 and a1 arguments for DO_MATH as first and last index of the exp
	add $a0, $0, $s0		# a0 holding loc of starting address of exp in stack
	add $a1, $0, $sp		# a1 holding loc of ending address in stack
	beq $0, $0, DO_MATH		# ALWAYS branch to DO_MATH
	add $0, $0, $0			# NOP


DO_MATH:		# take in a0 and a1 arguments to look through given range and carry out operations following conventional order
		
handle_negativity:	# handle '-' signs first; negate number and make negative sign a positive sign

	lw $t0, ($a0)			# t0 holds value of char at a0
	add $0, $0, $0			# NOP
	add $s5, $0, $a0		# preserve a0 location in s5
	beq $t0, 0x002D, neg_to_pos	# if t0 holds '-', branch to neg_to_pos
	add $0, $0, $0			# NOP
	add $a0, $a0, $s4		# increment a0 by 4
	bne $a0, $a1, DO_MATH		# if $a0 != $a1, branch to DO_MATH
	add $0, $0, $0			# NOP
	add $t0, $0, $s0		# make t0 point to start of stack
	add $a0, $t0, $t3		# a0 holding exact loc of opening prths in stack

handle_expnt:
expnt_done:
	lw $t0, ($a0)			# t0 holds value of char at a0
	add $0, $0, $0			# NOP
	beq $t0, 0x005E, eval_expnt	# if t0 holds '^', branch to eval_expnt
	add $0, $0, $0			# NOP
	add $a0, $a0, $s4		# increment a0 by 4
	bne $a0, $a1, handle_expnt	# if $a0 != $a1, branch to handle_expnt
	add $0, $0, $0			# NOP
	add $t0, $0, $s0		# make t0 point to start of stack
	add $a0, $t0, $t3		# a0 holding exact loc of opening prths in stack

handle_multp:
mult_done:
	lw $t0, ($a0)			# t0 holds value of char at a0
	add $0, $0, $0			# NOP
	beq $t0, 0x002A, eval_multp	# if t0 holds '*', branch to eval_multp
	add $0, $0, $0			# NOP
	add $a0, $a0, $s4		# increment a0 by 4
	bne $a0, $a1, handle_multp	# if $a0 != $a1, branch to handle_multp
	add $0, $0, $0			# NOP
	add $t0, $0, $s0		# make t0 point to start of stack
	add $a0, $t0, $t3		# a0 holding exact loc of opening prths in stack

handle_divsn:
divsn_done:
	lw $t0, ($a0)			# t0 holds value of char at a0
	add $0, $0, $0			# NOP
	beq $t0, 0x002F, eval_divsn	# if t0 holds '/', branch to eval_divsn
	add $0, $0, $0			# NOP
	add $a0, $a0, $s4		# increment a0 by 4
	bne $a0, $a1, handle_divsn	# if $a0 != $a1, branch to handle_divsn
	add $0, $0, $0			# NOP
	add $t0, $0, $s0		# make t0 point to start of stack
	add $a0, $t0, $t3		# a0 holding exact loc of opening prths in stack

handle_mod:
	lw $t0, ($a0)			# t0 holds value of char at a0
	add $0, $0, $0			# NOP
	beq $t0, 0x0025, eval_divsn	# if t0 holds '%', branch to eval_divsn
	add $0, $0, $0			# NOP
	add $a0, $a0, $s4		# increment a0 by 4
	bne $a0, $a1, handle_mod	# if $a0 != $a1, branch to handle_mod
	add $0, $0, $0			# NOP
	add $t0, $0, $s0		# make t0 point to start of stack
	add $a0, $t0, $t3		# a0 holding exact loc of opening prths in stack
	
handle_add:
sum_done:
	lw $t0, ($a0)			# t0 holds value of char at a0
	add $0, $0, $0			# NOP
	beq $t0, 0x002B, eval_add	# if t0 holds '+', branch to eval_add
	add $0, $0, $0			# NOP
	add $a0, $a0, $s4		# increment a0 by 4
	bne $a0, $a1, handle_add	# if $a0 != $a1, branch to handle_add
	add $0, $0, $0			# NOP
	add $t0, $0, $s0		# make t0 point to start of stack
	add $a0, $t0, $t3		# a0 holding exact loc of opening prths in stack
	
#chk	# loop through every thing (maybe consider handling '-' sign first)
#chk	# if ^ found, eval_expnt
#chk	# if * found, eval_multp
#chk	# if / found, eval_div
#chk	# if % found, eval_mod
#chk	# if + found, eval_add
#chk	# if - found, eval_sub  -- accounted for by first step
	# RECURSE THROUGH ALL PARENTHESIS, REPLACING PRTHS WITH SPACES
	
	add $t2, $0, $0			# end_loop counter initialized to 0
	addi $t5, $0, 1			# initialize t5 check register to 1
	addi $t6, $0, 0x0020		# store hex value of space char in t5
	sw $t6, 0($a0)			# replace opening prths, a0 with space
	add $0, $0, $0			# NOP
	sw $t6, 0($a1)			# replace closing prths, a1 with space 			# NOTE: MIGHT HAVE TO DECREMENT BY 4
	add $0, $0, $0			# NOP

	add $a0, $0, $s0		# reset $a0 to start of stack
	add $a1, $0, $sp		# reset $a1 to end of stack

end_loop:

	lw $t0, ($a0)			# t0 holds value of char at a0
	add $0, $0, $0			# NOP
	beq $t0, 0x0020, dont_inc_cnt	# if t0 holds ' ' (space), branch to dont_inc_loop
	add $0, $0, $0			# NOP


inc_cnt:
	addi $t2, $t2, 1		# increment end_loop counter, t2 by 1
	add $v0, $0, $a0		# v0 now stores latest value (will store answer in the final loop)
	lw $v0, 0($v0)			# load value of v0 from stack onto v0

dont_inc_cnt:
	add $a0, $a0, $s4		# increment a0 by 4
	bne $a0, $a1, end_loop		# if $a0 != $a1, branch end_loop
	add $0, $0, $0			# NOP
	add $t0, $0, $s0		# make t0 point to start of stack
	add $a0, $t0, $t3		# a0 holding exact loc of opening prths in stack
		
	bne $t2, $t5, exp_stored	# if 1 value is not left in the stack, branch to exp_stored
	add $0, $0, $0			# NOP

# at this point, program has to have gone through all prnths and have a final answer
# answer passed into v0 register

	lui $t7, 0x1000			# load starting address in t7
	lh $t1, 10($t7)			# t1 now stores variable exp is being equated to 

store_value:

	beq $t1, 0x0076, ans_v		# if t1==v, branch to ans_v 
	add $0, $0, $0			# NOP
	beq $t1, 0x0077, ans_w		# if t1==w, branch to ans_w 
	add $0, $0, $0			# NOP
	beq $t1, 0x0078, ans_x		# if t1==x, branch to ans_x 
	add $0, $0, $0			# NOP
	beq $t1, 0x0079, ans_y		# if t1==y, branch to ans_y 
	add $0, $0, $0			# NOP
	beq $t1, 0x007A, ans_z		# if t1==z, branch to ans_z 
	add $0, $0, $0			# NOP

end:
	add $0, $0, $0			# NOP

chk_final_ans:
	add $a0, $v0, $0
	addi $v0, $0, 1
	syscall

end_point:
	add $0, $0, $0