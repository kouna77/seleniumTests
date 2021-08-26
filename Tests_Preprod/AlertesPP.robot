*** Settings ***
Resource  ../Resources/common.robot
Resource  ../Resources/AlertesKeyword.robot

*** Test Cases ***

001_La consultation dune alerte avec verification colonnes
    [Tags]   TA_01
    [Documentation]   La consultation dune alerte avec la verification des colonnes
    ${TEST NAME} =  Set Variable  La consultation dune alerte avec la verification des colonnes
    AuthentificationPP
    Clic sur le menu Alertes
    Verifier les colonnes des alertes
    Clic sur une alerte
    Recherche de Alert_
    [Teardown]  End Session

002_Visualiser les donnees sur le compteur balance par liste de compteur
    [Tags]  TA_02
    [Documentation]    Verifier les donnees renseignees sur le compteur balance par liste de compteur
    ${TEST NAME} =  Set Variable  Verifier les donnees renseignees sur le compteur balance par liste de compteur
    AuthentificationPP
    Verifier les donnees renseignees sur le compteur balance par liste de compteur
    [Teardown]  End Session


03_Recuperer les alertes par scope
    [Tags]  TA_03
    [Documentation]  Filtrer les alertes par scope
    ${TEST NAME} =  Set Variable  Filtrer les alertes par scope
    AuthentificationPP
    Filtrer les alertes par scope
    [Teardown]  End Session

004_Exporter_lensemble_des colonnes_des_cdrs_dune_alerte_des_detections_de_cas_arnaque
    [Tags]  TA_004
    [Documentation]  Exporter lensemble des colonnes des cdrs dune alerte des détections de cas arnaque
    ${TEST NAME} =  Set Variable  Exporter lensemble des colonnes des cdrs dune alerte des détections de cas arnaque
    AuthentificationPP
    Exporter les colonnes des cdrs dune alerte des detections de cas arnaque
    Sleep  2
    Execute Javascript   window.scrollTo(699,41)
    Click Element  //*[@id="tab-1-content"]/div[1]/button[1]/span/span
    Sleep  2
    [Teardown]  End Session