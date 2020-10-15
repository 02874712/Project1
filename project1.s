.data
output: .asciiz "\nOutput: "	#output prompt

userInput:	 .space 11			#input var
userOutput: .space 4			#output var

.text
main:

li $v0, 8
la $a0, userInput	   #get user input
li $a1, 11
syscall

add $t5, $zero, $zero   #initializing counter for looping through string

loop:
la $t1, userInput
lb $v0, $t5($t1) 	   #loads in first byte of string
addi $t5, $t5, 1	   #increments by one
syscall

li $v0, 4
la $a0, output 		   #print output
syscall
li $v0, 4
la $a0, userInput
syscall

end:
li $v0, 10				#end of program
syscall
