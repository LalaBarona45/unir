.data
    prompt: .asciiz "Ingrese el n�mero de t�rminos de la serie Fibonacci: "
    result_prompt: .asciiz "Serie Fibonacci: "

.text
.globl main

main:
    # Solicita al usuario el n�mero de t�rminos
    li $v0, 4
    la $a0, prompt
    syscall

    # Lee el n�mero de t�rminos ingresados por el usuario
    li $v0, 5
    syscall
    move $t1, $v0  # Almacena el n�mero de t�rminos en $t1

    # Inicializa los primeros dos t�rminos de la serie Fibonacci
    li $t2, 0      # Primer t�rmino (F(0))
    li $t3, 1      # Segundo t�rmino (F(1))

    # Imprime el mensaje de la serie Fibonacci
    li $v0, 4
    la $a0, result_prompt
    syscall

    # Inicio del bucle para calcular e imprimir la serie
    loop:
        # Imprime el valor actual de la serie
        li $v0, 1
        move $a0, $t2
        syscall

        # Calcula el siguiente t�rmino de Fibonacci y almac�nalo en $t4
        add $t4, $t2, $t3

        # Actualiza los t�rminos anteriores
        move $t2, $t3
        move $t3, $t4

        # Decrementa el contador de t�rminos
        subi $t1, $t1, 1

        # Comprueba si se han generado todos los t�rminos solicitados
        bnez $t1, loop

    # Termina el programa
    li $v0, 10
    syscall
