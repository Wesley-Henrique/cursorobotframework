*** Settings ***
Documentation          Este será o nosso gerenciador de dependências.

Library                SeleniumLibrary
Library                RequestsLibrary
Library                Collections

############################
#        Keywords          #
############################

Resource          ../auto/keywords/kws_web.robot
Resource          ../auto/keywords/kws_api.robot

############################
#        Config            #
############################

Resource          hooks.robot
#Resource          hooks.yaml