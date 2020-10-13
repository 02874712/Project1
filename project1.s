.data
output: .asciiz "\nOutput: "

.text
main:
addi $t0, $t0, 5
li $v0, 4
la $a0, output
syscall

li $v0,1
move $a0,$t0
syscall  
