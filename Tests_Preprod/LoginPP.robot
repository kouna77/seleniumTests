*** Settings ***

Resource   ../Resources/common.robot

*** Test Cases ***
001_AuthentificationPP
    [Tags]   TA_001
    [Documentation]   Acceder  a l application Radar
    #Ouvrir le navigateur     ${UrlRadar}    ${Browser}
    Ouvrir le navigateur     ${Url_Preprod}
    wait until element is visible     xpath=//*[@id="details-button"]
    Click element    xpath = //*[@id="details-button"]
    Click element       xpath=//*[@id="proceed-link"]
    Entrer le username    ${userPP}
    Entrer le password    ${pwdPP}
    #Clic sur le bouton Connexion
    Click element       xpath=//*[@id="kc-form-login"]/div[3]/button
    Sleep  2
    Verifier le titre de la page
    [Teardown]  End Session