*** Settings ***
Resource  ../Resources/common.robot
Resource  ../Resources/RulesKeyword.robot

*** Test Cases ***

001_Liste des regles
    [Tags]   TA_001
    [Documentation]    La liste des Regles
    ${TEST NAME} =  Set Variable   Liste des regles
    Authentification
    Clic sur le menu Regles
    Verfication du bouton Creer une nouvelle regle
    Verification des filtres regles
    Verification des colonnes
    Verification des boutons Activer et Desactiver
    [Teardown]  End Session

002_Consultation d'une regle
    [Tags]  TA_002
    [Documentation]   consultation d'une régle
    ${TEST NAME} =  Set Variable  Consultatio d'une regle
    Authentification
    Clic sur le menu Regles
    Cliquer sur une Regle
    Scroller vers le bas
    [Teardown]  End Session

003_Activation_d'une_regle
    [Tags]   TA_003
    [Documentation]  Activation d'une régle
    ${TEST NAME} =  Set Variable  Activation d'une régle
    Authentification
    Clic sur le menu Regles
    Clic sur le filtre nom
    [Teardown]  End Session

004_Desactivation_d'une_regle
    [Tags]   TA_004
    [Documentation]  Desactivation d'une régle
    ${TEST NAME} =  Set Variable  Desactivation d'une régle
    Authentification
    Clic sur le menu Regles
    Clic sur le filtre nom
    [Teardown]  End Session

005_Verification_des_champs_obligatoires
    [tags]   TA_005
    [Documentation]  Verification  des champs de saisie d'une régle
    ${TEST NAME} =  Set Variable  Controle sur les champs de saisies
    Authentification
    Clic sur le menu Regles
    Clic sur le bouton Creer une nouvelle regle
    Verifier les champs de saisie
    [Teardown]  End Session

006_Rechercher_des_regles_depuis_la_barre_de_recherche
    [Tags]   TA_006
    [Documentation]  Recherche de régles depuis la barre de recherche
    ${TEST NAME} =  Set Variable  Recherche de regles
    Authentification
    Clic sur le menu Regles
    Clic sur la barre de recherche
    [Teardown]  End Session

007_Choix_multiple_destination
    [Tags]   TA_007
    [Documentation]  Multiple choix de destination
    ${TEST NAME} =  Set Variable  Choix de destinations
    Authentification
    Clic sur le menu Regles
    Multiple choix de destination
    [Teardown]  End Session

008_Purger_la_zone_de_sélection_des_destinations_lorsqu'on_change_de_flux
  [Tags]  TA_008
  [Documentation]  Purger la zone de selection des destinations
  ${TEST NAME} =  Set Variable  Purger la zone de selection des destinations
  Authentification
  Clic sur le menu Regles
  Purger la zone de selection des destinations
  [Teardown]  End Session

009_Réfactorer la recuperation des flux en fonction du réseau (Mobile, Fixe) et du scope
    [Tags]  TA_009
    [Documentation]  La recuperation des flux en fonction du réseau, (Mobile, Fixe)
    ${TEST NAME} =  Set Variable  La recuperation des flux en fonction du réseau, (Mobile, Fixe)
    Authentification
    Clic sur le menu Regles
    Recuperer les flux en fonction du réseau et du scope choisi
    [Teardown]  End Session

010_Reaffectation_d_une_regle_Modification_de_la_regle
    [Tags]   TA_10
    [Documentation]   Reaffectation d une regle
    ${TEST NAME} =  Set Variable  Reaffectation d une regle
    Authentification
    Clic sur le menu Regles
    Cliquer sur une Regle
    Scroller vers le bas
    Cliquer sur Editer la Regle
    #Cliquer sur suivant pour aller a la seconde etape
    Scroller vers le bas
    Click Element  xpath=//*[@id="form-add-rule"]/div/div[2]/button[2]/span/span
    Scroller vers le bas
    Choisir le nom de l'analyste
    Click Element  //*[@id="form-add-rule"]/div/div[2]/button[3]/span/span
    Cliquer a nouveau sur la Regle
    Verifier si la regle est assigne a l'analyste choisi
    [Teardown]  End Session

#kouna
011_Verification ajout nouvel operateur
    [Tags]   TA_011
    [Documentation]   Visualisation de la colonne promobile
    ${TEST NAME} =  Set Variable  Visualisation de la colonne promobile
    Authentification
    Verification_ajout_nouvel_operateur
    [Teardown]  End Session


#kouna
012_Generecite_Choix_Destination
    [Tags]  TA_012
    [Documentation]    Generecite du choix de destinations en fonction du scope et du flux choisi
    ${TEST NAME} =  Set Variable  Generecite du choix de destinations en fonction du scope et du flux choisi
    Authentification
    Verifier les destinations en fonction du scope et du flux choisi
    [Teardown]  End Session