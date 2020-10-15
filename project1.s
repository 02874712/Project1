.data
output: .asciiz "\nOutput: "	#output prompt

userInput:	 .space 11			#input var
userOutput: .space 3			#output var
loops: .asciiz "\nLoop\n"

.text
main:

li $t5, 10 #set var for branch if not equal
li $t1, 0  #set var=0 to begin loading byte

li $v0, 8
la $a0, userInput	    #get user input
li $a1, 11
syscall

loop:
add $t0, $t1, $a0 	    #adds $t1(index) to $a0(base address)
lb $t0,($t0) 	   	    #loads in first byte of string
addi $t1, $t1, 1	    #increments by one
syscall
.data
output: .asciiz "\nOutput: "	#output prompt

userInput:	 .space 11			#input var
userOutput: .space 3			#output var
loops: .asciiz "\nLoop\n"

.text
main:

li $t5, 10 #set var for branch if not equal
li $t1, 0  #set var=0 to begin loading byte

li $v0, 8
la $a0, userInput	    #get user input
li $a1, 11
syscall

loop:
add $t0, $t1, $a0 	    #adds $t1(index) to $a0(base address)
lb $t0,($t0) 	   	    #loads in first byte of string
addi $t1, $t1, 1	    #increments by one
syscall

li $v0, 4
la $a2, output 			# tries to load byte and print -debug
syscall
li $v0, 4
la $a0, userOutput
li $a1, 3

li $v0, 4
la $a0, loops			#prints "loops" for every iteration
syscall
li $v0, 1
la $a0, $t1
bne $t1, $t5, loop
j print_output
syscall


print_output:
li $v0, 4
la $a0, output 		    #print output
syscall
li $v0, 4
la $a0, userOutput
syscall

end:
li $v0, 10			    #end of program
syscall


li $v0, 4
la $a0, loops			#prints "loops" for every iteration
syscall
li $v0, 1
la $a0, $t1
bne $t1, $t5, loop
j print_output
syscall

print_output:
li $v0, 4
la $a0, output 		    #print output
syscall
li $v0, 4
la $a0, userOutput
syscall

end:
li $v0, 10			    #end of program
syscall
