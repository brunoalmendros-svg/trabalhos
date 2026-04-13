dim audio, palavras(19), totalPalavras, pontos, puladas, erros, resposta, palavra, i
dim pularDisponivel

call inicializar

sub inicializar()
    set audio = createobject("SAPI.SPVOICE")
    audio.volume = 100
    audio.rate = 2
    
    palavras(0) = "Pirata"
    palavras(1) = "Marinha"
    palavras(2) = "Almirante"
    palavras(3) = "civil"
    palavras(4) = "comodoro"
    palavras(5) = "Capitão"
    palavras(6) = "Navegador"
    palavras(7) = "Espadachim"
    palavras(8) = "Atirador"
    palavras(9) = "Médico"
    palavras(10) = "Cozinheiro"
    palavras(11) = "Arqueólogo"
    palavras(12) = "Carpinteiro"
    palavras(13) = "Músico"
    palavras(14) = "Revolucionário"
    palavras(15) = "Governo"
    palavras(16) = "Batalha"
    palavras(17) = "Recompensa"
    palavras(18) = "Tesouro"
    palavras(19) = "Aventura"
    
    totalPalavras = 20
    pontos = 0
    puladas = 0
    erros = 0
    pularDisponivel = 1
    
    call mostrarBoasVindas
    call jogarSoletrando
end sub

sub mostrarBoasVindas()
    audio.speak "Bem vindo ao jogo de Soletrando"
    audio.speak "Você ouvirá uma palavra e deverá digitar exatamente o que ouviu"
    audio.speak "Você pode pular uma vez sem perder pontos"
    audio.speak "Se errar, o jogo termina"
    audio.speak "Boa sorte"
    WScript.Sleep 2000
end sub

sub jogarSoletrando()
    for i = 0 to totalPalavras - 1
        palavra = palavras(i)
        
       
        audio.speak "Palavra número " & (i + 1)
        audio.speak palavra
        
        
        resposta = InputBox("Palavra " & (i + 1) & " de " & totalPalavras & vbCrLf & vbCrLf & "Digite a palavra que ouviu:" & vbCrLf & "(Digite PULAR para pular uma palavra)", "Soletrando")
        
       
        if isNull(resposta) then
            audio.speak "Você saiu do jogo"
            exit sub
        end if
        
       
        if UCase(resposta) = "PULAR" then
            if pularDisponivel = 1 then
                audio.speak "Você pulou a palavra " & palavra
                audio.speak "Agora você não pode mais pular"
                pularDisponivel = 0
                WScript.Sleep 1000
            else
                audio.speak "Você já usou seu pulo"
                audio.speak "A resposta correta é " & palavra
                audio.speak "Você perdeu"
                call mostrarResultado
                exit sub
            end if
        else
         
            if LCase(trim(resposta)) = LCase(trim(palavra)) then
                audio.speak "Correto"
                pontos = pontos + 1
                WScript.Sleep 1000
            else
                audio.speak "Errado"
                audio.speak "A resposta correta é " & palavra
                audio.speak "Você perdeu"
                call mostrarResultado
                exit sub
            end if
        end if
    next
    
    audio.speak "Parabéns, você acertou todas as palavras"
    call mostrarResultado
end sub

sub mostrarResultado()
    audio.speak "Fim do jogo"
    audio.speak "Pontos: " & pontos & " de " & totalPalavras
    
    if pontos = totalPalavras then
        audio.speak "Você é um campeão de soletrando"
    end if
    
    MsgBox "RESULTADO FINAL" & vbCrLf & vbCrLf & "Pontos: " & pontos & "/" & totalPalavras, vbInformation, "Soletrando - Fim de Jogo"
end sub