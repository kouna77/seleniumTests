*** Settings ***
Library  SeleniumLibrary
Variables  ../PageObjects/Locators.py
Variables    ../PageObjects/Variables.py
Resource  common.robot

*** Keywords ***
Entrer le username
    [Arguments]     ${username}
    wait until element is visible      ${txt_username}     30
    Input Text      ${txt_username}     ${username}

Entrer le password
    [Arguments]     ${password}
    wait until element is visible       ${txt_password}     5
    Input Text      ${txt_password}     ${password}

Clic sur le bouton Connexion
    Click button    ${btn_connexion}

Verifier le titre de la page
    Title Should Be    Fraud Management System

Verifier le message d erreur
    Page Should Contain    Invalid username or password.

Authentification
    Ouvrir le navigateur     ${UrlRadar}
    Entrer le username    ${user}
    Entrer le password    ${pwd}
    Clic sur le bouton Connexion
    Sleep  2
    Verifier le titre de la page

AuthentificationPP
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

Authentification_WrongPass
    Ouvrir le navigateur     ${UrlRadar}
    Entrer le username   ${user}
    Entrer le password    ${badPwd}
    Clic sur le bouton Connexion
    Sleep  2
    Verifier le message d erreur