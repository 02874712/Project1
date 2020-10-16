.data
output: .asciiz "\nOutput: "	#output prompt

userInput:	 .space 11			#input var
userOutput: .word 0			#output var
loops: .asciiz "\nLoop\n"

.text
main:

li $t5, 10 #set var for branch if not equal
li $t1, 0  #set var=0 to begin loading byte
lw $t4, userOutput($zero)  #t4 = userOutput total: starts at 0


li $v0, 8
la $a0, userInput	    #get user input
li $a1, 11
sw $v0, userInput		    #moves input into temp register
syscall

loop:
li $v0, 5
add $t0, $t1, $a0 	    #adds $t1(index) to $a0(base address)
lb $t0,($t0) 	   	    #loads in first byte of string
addi $t1, $t1, 1	    #increments by one to get next byte
syscall

add $a2, $zero, $zero
add $t4, $t4, $t0 
syscall
		#adds the current total with new num

bne $t1, $t5, loop
j print_output

print_output:
li $v0, 4
la $a0, output 		    #print output
syscall 
li $v0, 1
add $a0, $zero, $t4
syscall

end:
li $v0, 10			    #end of program
syscall
