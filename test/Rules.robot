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
   
  
