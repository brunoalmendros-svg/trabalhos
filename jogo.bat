@echo off
color 0a

set v=0
set d=0
set e=0

:inicio
cls
echo ===============================
echo    Pedra, Papel, Tesoura, Lagarto, Spock
echo ===============================
echo 1 - Jogar
echo 2 - Regras
echo 3 - Placar
echo 4 - Sair
set /p op=Escolha uma opcao: 

if "%op%"=="1" goto jogar
if "%op%"=="2" goto regras
if "%op%"=="3" goto placar
if "%op%"=="4" exit
goto inicio

:regras
cls
echo ==== REGRAS ====
echo Pedra ganha de Tesoura e Lagarto
echo Papel ganha de Pedra e Spock
echo Tesoura ganha de Papel e Lagarto
echo Lagarto ganha de Spock e Papel
echo Spock ganha de Tesoura e Pedra
echo =================
echo.
pause
goto inicio

:placar
cls
echo ===== PLACAR =====
echo Vitorias: %v%
echo Derrotas: %d%
echo Empates: %e%
echo ==================
pause
goto inicio

:jogar
cls
echo ========= JOGO =========
echo Escolha:
echo 1 - Pedra
echo 2 - Papel
echo 3 - Tesoura
echo 4 - Lagarto
echo 5 - Spock
set /p eu=Sua escolha: 

setlocal enabledelayedexpansion
set /a cpu=%random% %% 5 + 1

if "%eu%" == "1" (set minha=Pedra)
if "%eu%" == "2" (set minha=Papel)
if "%eu%" == "3" (set minha=Tesoura)
if "%eu%" == "4" (set minha=Lagarto)
if "%eu%" == "5" (set minha=Spock)
if "%eu%" == "" goto jogar

REM escolhas do computador
if "%cpu%" == "1" (set pc=Pedra)
if "%cpu%" == "2" (set pc=Papel)
if "%cpu%" == "3" (set pc=Tesoura)
if "%cpu%" == "4" (set pc=Lagarto)
if "%cpu%" == "5" (set pc=Spock)

echo Voce escolheu: !minha!
echo Computador escolheu: !pc!

REM checa empate
if "%eu%"=="%cpu%" (
    echo Empate!
    set /a e=%e%+1
    pause
    goto inicio
)
REM verifica vitoria
if "%eu%"=="1" (
    if "%cpu%"=="3" set win=1
    if "%cpu%"=="4" set win=1
    if "%cpu%"=="2" set win=0
    if "%cpu%"=="5" set win=0
)
if "%eu%"=="2" (
    if "%cpu%"=="1" set win=1
    if "%cpu%"=="5" set win=1
    if "%cpu%"=="3" set win=0
    if "%cpu%"=="4" set win=0
)
if "%eu%"=="3" (
    if "%cpu%"=="2" set win=1
    if "%cpu%"=="4" set win=1
    if "%cpu%"=="1" set win=0
    if "%cpu%"=="5" set win=0
)
if "%eu%"=="4" (
    if "%cpu%"=="5" set win=1
    if "%cpu%"=="2" set win=1
    if "%cpu%"=="1" set win=0
    if "%cpu%"=="3" set win=0
)
if "%eu%"=="5" (
    if "%cpu%"=="3" set win=1
    if "%cpu%"=="1" set win=1
    if "%cpu%"=="2" set win=0
    if "%cpu%"=="4" set win=0
)

if "%win%"=="1" (
    echo Voce ganhou!
    set /a v=%v%+1
)
if "%win%"=="0" (
    echo Voce perdeu!
    set /a d=%d%+1
)
set win=
pause
goto inicio