*** Settings ***
Documentation           Aqui estarão presentes todos os arquivos de inicialização e finalização dos testes.

Resource                package.robot

*** Keywords ***
Abrir navegador
    Open Browser                about:black        chrome
    Go To                       https://automacaocombatista.herokuapp.com/users
    Maximize Browser Window     
    Set Selenium Timeout        20

Fechar navegador
    Capture Page Screenshot
    Close Browser