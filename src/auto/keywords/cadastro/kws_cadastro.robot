*** Settings ***
Documentation        Aqui estarão presentes todos as Keywords do formulario de cadastro do site http://automationpractice.com/index.php?controller=authentication&back=my-account

Resource             ../../../config/package.robot

*** Keywords ***
Dado que o cliente esteja na tela de cadastro do site
    Title Should Be                  ${CADASTRO.MESSAGES.TITLE_PAGE}
    Wait Until Page Contains         ${CADASTRO.MESSAGES.CREATE_ACCOUNT_MSG}

E preencher com todos os dados
    ${EMAIL_FAKER}                   FakerLibrary.Email
    ${NOME_FAKER}                    FakerLibrary.Name
    ${SOBRENOME_FAKER}               FakerLibrary.Last Name
    ${PASS_FAKER}                    FakerLibrary.Password
    ${ADDRESS_FAKER}                 FakerLibrary.Address
    ${CITY_FAKER}                    FakerLibrary.City
    ${PHONE_FAKER}                   FakerLibrary.Phone Number
    ${POSTCODE_FAKER}                FakerLibrary.Postalcode
    ${ALIAS.FAKER}                   FakerLibrary.User Name
    Input Text                       ${LOGIN_PAGE.INPUT_EMAIL_CREATE}       ${EMAIL_FAKER}
    Click Element                    ${LOGIN_PAGE.BTN_CREATE}
    

    #Preenchendo todo o formulario de cadastro
    Wait Until Element Is Visible    ${ACCOUNT_PAGE.CHECK_MR}
    Click Element                    ${ACCOUNT_PAGE.CHECK_MR}

    Input Text                       ${ACCOUNT_PAGE.INPUT_FIRSTNAME}       ${NOME_FAKER}
    Input Text                       ${ACCOUNT_PAGE.INPUT_LASTNAME}        ${SOBRENOME_FAKER} 

    Wait Until Element Is Visible    ${ACCOUNT_PAGE.INPUT_PASSWORD}    
    Input Text                       ${ACCOUNT_PAGE.INPUT_PASSWORD}        ${PASS_FAKER}

    Select From List By Value        ${ACCOUNT_PAGE.LIST_DAYS}             17
    Select From List By Value        ${ACCOUNT_PAGE.LIST_MONTH}            11
    Select From List By Value        ${ACCOUNT_PAGE.LIST_YEARS}            1995

    Input Text                       ${ACCOUNT_PAGE.INPUT_COMPANY}         PrimeControl
    Input Text                       ${ACCOUNT_PAGE.INPUT_ADDRESS1}        ${ADDRESS_FAKER}
    Input Text                       ${ACCOUNT_PAGE.INPUT_CITYNAME}        ${CITY_FAKER}

    Select From List By Label        ${ACCOUNT_PAGE.LIST_STATE}            California

    Wait Until Element Is Visible    ${ACCOUNT_PAGE.INPUT_MOBILEPHONE}
    Input Text                       ${ACCOUNT_PAGE.INPUT_MOBILEPHONE}     +5511963258795

    Wait Until Element Is Visible    ${ACCOUNT_PAGE.INPUT_POSTCODE}
    Input Text                       ${ACCOUNT_PAGE.INPUT_POSTCODE}        ${POSTCODE_FAKER}     #90001
    Input Text                       ${ACCOUNT_PAGE.INPUT_ALIAS}           ${ALIAS.FAKER}
    
Quando clicar em salvar
    Click Element                    ${ACCOUNT_PAGE.BTN_SUBMIT}
    ${RESULTADO}                     Run Keyword And Return Status        Wait Until Page Contains            There os 1 error
    IF    ${${RESULTADO}} == true
        Input Text        ${ACCOUNT_PAGE.INPUT_PASSWORD}    123456789        
    ELSE
        Wait Until Page Contains     Welcome to your account. Here you can manage all of your personal information and orders.
    END
    
Então cadastro deve ser concluído com sucesso
    [Arguments]                      ${MENSAGEM}
    Wait Until Page Contains         ${MENSAGEM}