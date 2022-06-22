.data
	inicio: .asciiz "\n1 - Fahrenheit ? > Celsius\n2 - Fibonnacci\n3 - Enésimo par\n4 - Sair\n\nEscolha uma opção: "
	
	fahrenheit: .asciiz "\nTemperatura em Fahrenheit: "
	resultado: .asciiz "Temperatura em Celsius = "
	newLine: .asciiz "\n"
	n1: .float 32
	n2: .float 5
  	n3: .float 9
  	
  	fibonacci: .asciiz "\nFibonacci de: "	
  	rfib: .asciiz "É igual a "
  	
  	npar: .asciiz "\nEnésimo par : "
  	rpar: .asciiz "O Par equivalente é igual a "
  	
  	invalido: .asciiz "\nOpção Inválida! Tente novamente!!!\n"
  	finalizar: .asciiz "\nFinalizando o programa...\n"
  	
.text
menu:
	la $a0, inicio
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	beq $v0, 1, fahrenheitt
	beq $v0, 2, fibonaccii
	beq $v0, 3, nPar
	beq $v0, 4, sair
	
	la $a0, invalido
	li $v0, 4
	syscall
	j menu

fahrenheitt:
	#printar o pedido de entrada
		la    $a0, fahrenheit 
		li    $v0, 4           
		syscall          
		li    $v0, 6    
		syscall
	
	#(32 °F ? 32) × 5/9 = 0 °C
		lwc1 $f1,n1
		lwc1 $f2,n2
		lwc1 $f3,n3
		sub.s $f4,$f0,$f1
		mul.s $f5,$f4,$f2
		div.s $f6,$f5,$f3
	
	#printar resultado	
		la $a0, resultado
		li $v0, 4
		syscall           
		mov.s $f12, $f6
		li $v0, 2
		syscall
	
	#pular uma linha e voltar para o menu
		la $a0, newLine
		li $v0, 4
		syscall
		
		j menu
		
fibonaccii:
	#Entrada do número
	#Maior número inteiro = 4 294 967 295, portanto só da pra fazer a sequência de fibonacci até o 47º número(2 971 215 073). 
		
		li $t0, 0
		li $t1, 1
		li $t2, 1
		la $a0, fibonacci
		li $v0, 4
		syscall
		li $v0, 5
		syscall
		
		beq $v0, $t0, if0
		beq $v0, $t1, if1
		
		fib:	
			addi $t2,$t2,1			
			
			add $t3,$t1,$t0
			move $t0, $t1
			move $t1, $t3
	
			bne $v0, $t2, fib			
			
			la $a0, rfib
			li $v0, 4
			syscall
			move $a0, $t3
			li $v0, 1
			syscall
	
			la $a0, newLine
			li $v0, 4
			syscall
			j menu	
			
		if0:	
			la $a0, rfib
			li $v0, 4
			syscall
			move $a0, $t0
			li $v0, 1
			syscall
		
			la $a0, newLine
			li $v0, 4
			syscall
			j menu	
			
		if1:	
			la $a0, rfib
			li $v0, 4
			syscall
			move $a0, $t1
			li $v0, 1
			syscall
		
			la $a0, newLine
			li $v0, 4
			syscall
			j menu
		
		
	
		
		
nPar:	
	li $s0, 1
	li $s1, 2
	la $a0, npar
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	
	loop:
		addi $s0,$s0,1
		addi $s1,$s1,2
		bne $v0, $s0, loop
		
		la $a0, rpar
		li $v0, 4
		syscall
		move $a0, $s1
		li $v0, 1
		syscall
		
		la $a0, newLine
		li $v0, 4
		syscall
		j menu

sair:
	la $a0, finalizar
	li $v0, 4
	syscall   
	li $v0, 10
	syscall
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
