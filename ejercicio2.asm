.data
    prompt: .asciiz "Ingrese el primer número: "
    prompt2: .asciiz "Ingrese el segundo número: "
    prompt3: .asciiz "Ingrese el tercer número: "
    result: .asciiz "El número mayor es: "

.text
.globl main

main:
    # Pide al usuario que ingrese los tres números
    li $v0, 4
    la $a0, prompt
    syscall
    li $v0, 5
    syscall
    move $s0, $v0

    li $v0, 4
    la $a0, prompt2
    syscall
    li $v0, 5
    syscall
    move $s1, $v0

    li $v0, 4
    la $a0, prompt3
    syscall
    li $v0, 5
    syscall
    move $s2, $v0

    # Inicializa el número mayor con el primer número
    move $t0, $s0

    # Compara con el segundo número
    slt $t1, $t0, $s1
    beqz $t1, check_third

    # Si el segundo número es mayor, actualiza el número mayor
    move $t0, $s1

check_third:
    # Compara con el tercer número
    slt $t1, $t0, $s2

    # Si el tercer número es mayor, actualiza el número mayor
    beqz $t1, print_result
    move $t0, $s2

print_result:
    # Imprime el resultado
    li $v0, 4
    la $a0, result
    syscall
    li $v0, 1
    move $a0, $t0
    syscall

    # Termina el programa
    li $v0, 10
    syscall
