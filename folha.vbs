dim numero
dim salario
dim inss
dim liquido

numero = InputBox("Insira o numero de salarios do Funcionario")

salario = numero * 1621
inss = 0.075
if salario > 1621.01 and salario < 2902.84 then
    inss = 0.09
elseif salario > 2902.85 and salario < 4354.27 then
    inss = 0.12
elseif salario > 4354.27 then
    inss = 0.14
end if

liquido = salario - (salario * inss)

    msgbox "o salario e: " & salario
    msgbox "o INSS e: " & inss
    msgbox "o Salario liquido e: " & liquido


