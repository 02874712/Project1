output: .asciiz "\nOutput: "	#output prompt

userInput:	 .space 11			#input var
userOutput: .space 4			#output var

.text
main:

li $t5, 10 #set var for branch if not equal
li $t1, 0  #set var=0 to begin loading byte

li $v0, 8
la $a0, userInput	    #get user input
li $a1, 10
syscall

loop:
#li $t1, userInput
add $t0, $t1, $a0 	    #adds $t1(index) to $a0(base address)
lb $a0, 0($t1) 	   	    #loads in first byte of string
addi $t5, $t5, 1	    #increments by one
syscall

print_output:
li $v0, 4
la $a0, output 		    #print output
syscall
li $v0, 4
la $a0, userInput
syscall

end:
li $v0, 10			    #end of program
syscall
