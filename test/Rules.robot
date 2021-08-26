*** Settings ***
Resource  ../Resources/common.robot
Resource  ../Resources/RulesKeyword.robot


*** Test Cases ***

001_Liste des regles
    [Tags]   TA_001
    [Documentation]    La liste des Regles
    Authentification
    Clic sur le menu Regles
    Verfication du bouton Creer une nouvelle regle
    Verification des filtres regles
    Verification des colonnes
    Verification des boutons Activer et Desactiver
    [Teardown]  End Session


002_Reaffectation_d_une_regle_Modification_de_la_regle
    [Tags]   TA_02
    [Documentation]   Reaffectation d une regle
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
003_Verification ajout nouvel operateur
    [Tags]   TA_028
    [Documentation]   Visualisation de la colonne promobile
    Authentification
    Verification_ajout_nouvel_operateur
    [Teardown]  End Session


#kouna
004_Generecite_Choix_Destination
    [Tags]  TA_030
    [Documentation]    Generecite du choix de destinations en fonction du scope et du flux choisi
    Authentification
    Verifier les destinations en fonction du scope et du flux choisi
    [Teardown]  End Session

