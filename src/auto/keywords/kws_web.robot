*** Settings ***
Documentation        Aqui estatão presentes todas as Keywords responsáveis pelo testes WEB.

Resource             ../../config/package.robot

*** Keywords ***
Dado que o cliente esteja na tela de cadastro
    Title Should Be                      Automação com Batista
    Wait Until Element Is Visible        xpath=//*[contains(text(), 'Novo Usuário!!')]

E preencher todos os campos
    Input Text                  id=user_name            ${NOVO_USUARIO.nome}
    Input Text                  id=user_lastname        ${NOVO_USUARIO.ult_nome}
    Input Text                  id=user_email           ${NOVO_USUARIO.email}
    Input Text                  id=user_address         ${NOVO_USUARIO.endereco}
    Input Text                  id=user_university      ${NOVO_USUARIO.universidade}
    Input Text                  id=user_profile         ${NOVO_USUARIO.profissao}
    Input Text                  id=user_gender          ${NOVO_USUARIO.genero}
    Input Text                  id=user_age             ${NOVO_USUARIO.idade}

Quando clicar em Criar
    Click Element               xpath=//input[@value='Criar']

Então deve ser apresentado a mensagem "${MENSAGEM}"
    Wait Until Element Is Visible       xpath=//*[contains(text(), '${MENSAGEM}')]

E preencher todos os campos exceto o campo nome
    Input Text            id=user_lastname    ${NOVO_USUARIO.ult_nome}
    Input Text            id=user_email       ${NOVO_USUARIO.email}
    Input Text            id=user_address     ${NOVO_USUARIO.endereco}
    Input Text            id=user_university  ${NOVO_USUARIO.universidade}
    Input Text            id=user_profile     ${NOVO_USUARIO.profissao}
    Input Text            id=user_gender      ${NOVO_USUARIO.genero}
    Input Text            id=user_age         ${NOVO_USUARIO.idade}
    Capture Page Screenshot
    
E preencher todos os campos exceto o campo email
    Input Text        id=user_name        ${NOVO_USUARIO.nome}
    Input Text        id=user_lastname    ${NOVO_USUARIO.ult_nome}
    Input Text        id=user_address     ${NOVO_USUARIO.endereco}
    Input Text        id=user_university  ${NOVO_USUARIO.universidade}
    Input Text        id=user_profile     ${NOVO_USUARIO.profissao}
    Input Text        id=user_gender      ${NOVO_USUARIO.genero}
    Input Text        id=user_age         ${NOVO_USUARIO.idade}
    Capture Page Screenshot

Então deve ser apresentada a mensagem
    [Arguments]                     ${ERRO}
    Wait Until Page Contains        ${ERRO}
    IF     '${ERRO}'=='Name translation missing: pt-BR.activerecord.errors.models.user.attributes.name.blank'
            Clear Element Text    id=user_email
    END   

Dado que eu esteja na tela de lista de usuários
    Title Should Be                      Automação com Batista
    Wait Until Element Is Visible        xpath=//*[contains(text(), 'Lista de Usuários!!')]

E clique na opção NOVO USUÁRIO
    Click Element               xpath=//a[@class='btn waves-light green'][contains(text(), 'Novo Usuário')]

Quando finalizar o cadastro preenchendo todos os campos
    Wait Until Element Is Visible        xpath=//*[contains(text(), 'Novo Usuário!!')]
    E preencher todos os campos
    Quando clicar em Criar

