@echo off
rem Sobe o Dental Flow completo com Docker (dois cliques aqui).
rem Opcoes: subir.cmd --resetar (volta o banco aos dados da apresentacao) e --sem-navegador.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\subir.ps1" %*
set codigo=%errorlevel%
pause
exit /b %codigo%
