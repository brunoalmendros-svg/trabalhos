dim num1
dim num2
dim num3
dim maior
dim menor

num1 = InputBox("Insira o Primeiro numero")
num2 = InputBox("Insira o Segundo numero")
num3 = InputBox("Insira o Terceiro numero")
maior = num1
menor = num1

if num2 > maior then
    maior = num2
end if
if num3 > maior then
    maior = num3
end if
if num2 < menor then
    menor = num2
end if
if num3 < menor then
    menor = num3
end if

msgbox "o numero menor e: " & menor
msgbox "o numero maior e: " & maior
