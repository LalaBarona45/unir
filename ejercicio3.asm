.data
    prompt: .asciiz "Ingrese el número de términos de la serie Fibonacci: "
    result_prompt: .asciiz "Serie Fibonacci: "

.text
.globl main

main:
    # Solicita al usuario el número de términos
    li $v0, 4
    la $a0, prompt
    syscall

    # Lee el número de términos ingresados por el usuario
    li $v0, 5
    syscall
    move $t1, $v0  # Almacena el número de términos en $t1

    # Inicializa los primeros dos términos de la serie Fibonacci
    li $t2, 0      # Primer término (F(0))
    li $t3, 1      # Segundo término (F(1))

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

        # Calcula el siguiente término de Fibonacci y almacénalo en $t4
        add $t4, $t2, $t3

        # Actualiza los términos anteriores
        move $t2, $t3
        move $t3, $t4

        # Decrementa el contador de términos
        subi $t1, $t1, 1

        # Comprueba si se han generado todos los términos solicitados
        bnez $t1, loop

    # Termina el programa
    li $v0, 10
    syscall
