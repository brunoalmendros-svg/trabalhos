@echo off
title Aula 01 - SI
color 0a
::criar uma função
:inicio
:: limpa tela
cls
echo.
echo.
set /p nome=Digite o Nome do Jogador : 
cls
set /a cont=5
set /a numero=(%random% %%50) + 1
:sortear
cls
echo %numero%
echo ==========================================================
echo Adivinhar Numero entre 01 e 50
echo ==========================================================
echo Seja bem vindo %nome%
echo ==========================================================
echo Tentativa %cont%
echo ==========================================================
echo [P] Pontuacao dos Jogadores
echo [E] Encerrar Jogador
echo ==========================================================
set /p palpite=Digite seu palpite :
if "%palpite%" gtr 50 (goto:validacao)
if %numero% lss "%palpite%"  (echo O NUMERO E MENOR)
if %numero% gtr "%palpite%" (echo O NUMERO E MAIOR) 
if %cont% lss 2 (goto:perda)
if "%palpite%" == %numero% (goto:vencer) else (
    set /a cont=%cont% - 1)
    goto:sortear

:perda
cls
echo =======================================
echo        VOCE PERDEU
echo =======================================
set /p resp=Voce quer continuar a ver a pontuação? [S/N]
 if /i "%resp%" == "S" ( goto:ponto) else (exit)

:ponto
cls
echo.
echo =========================================================================================
echo                     Listagem Geral de Clientes
echo =========================================================================================
echo     DATA     HORA      NOME Nun chance       
echo =========================================================================================
type resultado.txt
echo =========================================================================================
pause

:vencer
echo Parabens
echo Voce ganhou
echo %date% %nome% %numero% %cont% >> resultado.txt
set /p resp=Voce quer continuar a ver a pontuacao? [S/N]
 if /i "%resp%" == "S" (goto:inicio) else (exit)

:validacao
echo Digite um numero entre 01 e 50
pause
(goto:sortear)