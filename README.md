# Flex & Bison – Capítulo 1

Universidad Sergio Arboleda  
Ciencias de la Computación e Inteligencia Artificial  
Compiladores

## Ejemplos implementados

- fb1-1 → Word Count
- fb1-2 → English to American
- fb1-3 → Scanner básico calculadora
- fb1-4 → Scanner con tokens
- fb1-5 → Calculadora con Flex + Bison

## Cómo compilar

Ejemplo simple:

```bash
flex archivo.l
gcc lex.yy.c -lfl -o programa
./programa
