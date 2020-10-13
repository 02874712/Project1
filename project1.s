.data
input:  .asciiz "\nInput: " 	#input and output variables
output: .asciiz "\nOutput: "

userInput:	 .space 11

.text
main:

li $v0, 8
la $a0, userInput	   #get user input
li $a1, 11
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
