*** Settings ***
Resource  ../Resources/common.robot
Resource  ../Resources/AlarmesKeyword.robot

*** Test Cases ***

01_Lister des alarmes
    [Tags]   TA_01
    [Documentation]    La liste des alarmes
    ${TEST NAME} =  Set Variable   Liste des alarmes
    Authentification
    Clic sur le menu Alarms
    CLic sur le sous menu Alarms
    Verifier les sous menu
    Verifier les filtres alarmes
    Verifier les boutons reset et filter
    Verifier la presence des colonnes
    Scroller vers le bas
    [Teardown]  End Session

02_Affichage des boutons daction de reassignation et dexport
    [Tags]   TA_02
    [Documentation]    Affichage des boutons daction a lassignation des alarmes
    ${TEST NAME} =  Set Variable   Affichage des boutons daction
    Authentification
    Clic sur le menu Alarms
    CLic sur le sous menu Alarms
    Verifier laffichage des boutons daction de reassignation et dexport en fonction des statuts et de lassignation des alarmes
    [Teardown]  End Session

03_La verification du Workflow_FROM_NEW_TO_INV_NFR_FRD
   [Tags]   TA_03
   [Documentation]    Verification du Workflow depuis la page de liste des alarmes
   ${TEST NAME} =  Set Variable  Verification du Workflow depuis la page de liste des alarmes
   Authentification
   VERIF_WORKFLOW_FROM_NEW_TO_INV_NFR_FRD
   [Teardown]  End Session

04_La verification du Workflow_FROM_INV_TO_PEN
   [Tags]   TA_04
   [Documentation]    Verification du Workflow depuis la page de liste des alarmes
   ${TEST NAME} =  Set Variable  Verification du Workflow depuis la page de liste des alarmes
   Authentification
   WORKFLOW_FROM_INV_TO_PEN
   [Teardown]  End Session

05.1_La verification du Workflow_FROM_INV_TO_FRD
   [Tags]   TA_05.1
   [Documentation]    Verification du Workflow_FROM_INV_TO_FRD
   ${TEST NAME} =  Set Variable  verification du Workflow_FROM_INV_TO_FRD
   Authentification
   VERIF_WORKFLOW_FROM_INV_TO_FRD
   [Teardown]  End Session

05.2_La verification du Workflow_FROM_INV_TO_NRD
   [Tags]   TA_05.2
   [Documentation]    Verification du Workflow_FROM_INV_TO_NRD
   ${TEST NAME} =  Set Variable  verification du Workflow_FROM_INV_TO_NRD
   Authentification
   VERIF_WORKFLOW_FROM_INV_TO_NRD
   [Teardown]  End Session

05.3_La verification du Workflow_FROM_INV_TO_PEN
   [Tags]   TA_05.3
   [Documentation]    Verification du Workflow_FROM_INV_TO_PEN
   ${TEST NAME} =  Set Variable  verification du Workflow_FROM_INV_TO_PEN
   Authentification
   WORKFLOW_DE_INV_TO_PEN
   [Teardown]  End Session

05.4_La verification du Workflow_FROM_INV_TO_AVL
   [Tags]   TA_05.3
   [Documentation]    Verification du Workflow_FROM_INV_TO_AVL
   ${TEST NAME} =  Set Variable  verification du Workflow_FROM_INV_TO_AVL
   Authentification
   WORKFLOW_DE_INV_TO_AVL
   [Teardown]  End Session

06.1_La verification du Workflow_FROM_PEN_TO_NFR
   [Tags]   TA_06.1
   [Documentation]    Verification du Workflow_FROM_PEN_TO_NFR
   ${TEST NAME} =  Set Variable  Verification du Workflow_FROM_PEN_TO_NFR
   Authentification
   VERIF_WORKFLOW_FROM_PEN_TO_NFR
   [Teardown]  End Session

06.2_La verification du Workflow_FROM_PEN_TO_NFR
   [Tags]   TA_06.2
   [Documentation]    Verification du Workflow_FROM_PEN_TO_FRD
   ${TEST NAME} =  Set Variable  Verification du Workflow_FROM_PEN_TO_FRD
   Authentification
   VERIF_WORKFLOW_FROM_PEN_TO_FRD
   [Teardown]  End Session

06.3_La verification du Workflow_FROM_PEN_TO_AVL
   [Tags]   TA_06.3
   [Documentation]    Verification du Workflow_FROM_PEN_TO_AVL
   ${TEST NAME} =  Set Variable  Verification du Workflow_FROM_PEN_TO_AVL
   Authentification
   VERIF_WORKFLOW_FROM_PEN_TO_AVL
   [Teardown]  End Session

07_La reassignation_alarmes_avec_les_statuts_des_alarmes
    [Tags]   TA_07
    [Documentation]    La reassignation depuis la page de la liste des alarmes
    ${TEST NAME} =  Set Variable  Reassignation depuis la page de la liste des alarmes
    Authentification
    Clic sur le menu Alarms
    CLic sur le sous menu Alarms
    Reassignation depuis la page de liste des alarmes en prenant en compte les statuts des alarmes
    [Teardown]  End Session

08_La reassignation dune alarme avec statuts avl
    [Tags]   TA_08
    [Documentation]    La reassignation depuis la page de liste des alarmes en prenant en compte le statuts avl
    ${TEST NAME} =  Set Variable  Reassignation depuis la page de liste des alarmes en prenant en compte le statuts avl
    Authentification
    Clic sur le menu Alarms
    CLic sur le sous menu Alarms
    Reassignation d'une alarme de status avl
    [Teardown]  End Session


09_La verification de lexport en cochant une ou des alarmes
    [Tags]   TA_09
    [Documentation]    La verification de lexport en appliquant les filtres
    ${TEST NAME} =  Set Variable  La verification de lexport en appliquant les filtres
    Authentification
    Clic sur le menu Alarms
    CLic sur le sous menu Alarms
    Clic sur la case a cocher d une alarme
    clic sur le bouton options
    clic sur export
    #Verifier si le fichier est bien exportÃ©
    [Teardown]  End Session


010.1_La verification de lexport en appliquant un filtre
    [Tags]   TA_10
    [Documentation]    La verification de lexport en appliquant un filtre/ en cochant une ou des alarmes/ en combinant les deux_2
    ${TEST NAME} =  Set Variable  Verification de lexport en appliquant un filtre/ en cochant une ou des alarmes/ en combinant les deux_2
    Authentification
    Clic sur le menu Alarms
    CLic sur le sous menu Alarms
    Clic sur le filtre des statuts
    Clic sur le checkbox du NEW
    Clic sur le bouton filtrer
    clic sur le bouton options
    clic sur export
    #Verifier si le fichier est bien exportÃ©
    [Teardown]  End Session

011_La verification_lexport_en_appliquant_un_filtre_et_en cochant_une_alarme
    [Tags]   TA_011
    [Documentation]    La verification de lexport en appliquant un filtre/ en cochant une ou des alarmes/ en combinant les deux_3
    ${TEST NAME} =  Set Variable  verification de lexport en appliquant un filtre/ en cochant une ou des alarmes/ en combinant les deux_3
    Authentification
    Clic sur le menu Alarms
    CLic sur le sous menu Alarms
    Clic sur le filtre des statuts
    clic sur le checkbox du NEW
    Sleep  3
    Clic sur le bouton filtrer
    Clic sur la case a cocher d une alarme
    clic sur le bouton options
    clic sur export
    [Teardown]  End Session

# Commenter car il ya un bug a cooriger sur la mise a jour du nombre apres update de l alarme
012_La verification du compteur des alertes dans la liste des alarmes
    [Tags]   TA_12
    [Documentation]    La verification du compteur des alertes dans la liste des alarmes et le nombre reel dalerte a la consul_alarme
    ${TEST NAME} =  Set Variable  La verification du compteur des alertes dans la liste des alarmes
    Authentification
    Clic sur le menu Alarms
    CLic sur le sous menu Alarms
    #Comparer le nombre d_alertes
    Recup
    [Teardown]  End Session

013_ La consultation dune alarme
    [Tags]   TA_013
    [Documentation]    La consultation dune alarme
    ${TEST NAME} =  Set Variable  La consultation dune alarme
    Authentification
    Consultation d une alarme
    [Teardown]  End Session

014_La reassignation_alarme_depuis_la_consultation
    [Tags]   TA_014
    [Documentation]    la reassignation dune alarme depuis la consultation
    ${TEST NAME} =  Set Variable  la reassignation dune alarme depuis la consultation
    Authentification
    consultation d une alarme
    reassignation alarme
    [Teardown]  End Session

015_Affichage du Call Date
    [Tags]    TA_015
    [Documentation]    Affichage du Call Date sur les infos CDR de lAlerte de lAlarme Simbox
    ${TEST NAME} =  Set Variable  Affichage du Call Date sur les infos CDR de lAlerte de lAlarme Simbox
    Authentification
    Clic sur le menu Alarms
    Clic sur le sous menu Alarms Simbox
    Filtrer sur le statut NEW
    Clic sur une ligne du tableau des Alarmes Simbox
    Sleep  2
    Survoler Alerte
    Verifier affichage valeur du call date
    [Teardown]  End Session

016_Visualisation du nombre total de resultats
    [Tags]    TA_016
    [Documentation]    Filtre sur les alarmes: Visualisation du nombre total de resultats
    ${TEST NAME} =  Set Variable  Filtre sur les alarmes: Visualisation du nombre total de resultats
    Authentification
    Clic sur le menu Alarms
    Combinaison filtre alarmes
    Verification du nombre total de resultats
    [Teardown]  End Session

017_Lister les alarmes SIMBOX
    [Tags]    TA_017
    [Documentation]    Lister les alarmes SIMBOX
    ${TEST NAME} =  Set Variable  Lister les alarmes SIMBOX
    Authentification
    Clic sur le menu Alarms
    Clic sur le sous menu Alarms Simbox
    Verifier les sous menu
    Verification filtres Alarmes
    Verifier les boutons reset et filter
    Verification colonnes Alarmes
    Scroller et verifier le chargement des lots de 50 de la liste Alarme
    [Teardown]  End Session

018_Visualisation_des_colonnes_correspondant_aux_regles_TBSP
    [Tags]    TA_018
    [Documentation]    Visualisation des colonnes correspondant aux regles de type TBSP dans la page des alertes
     ${TEST NAME} =  Set Variable  Visualisation des colonnes correspondant aux regles de type TBSP
    Authentification
    Clic sur le menu Alarms
    Clic sur le sous menu Alarms Simbox
    Clic sur Regle
    Rechercher mot cle TBSP
    Clic sur le bouton filtrer
    Sleep  2
    Clic sur une ligne du tableau des Alarmes Simbox
    Clic Voir Alerte
    Execute Javascript   window.scrollTo(108,632)
    sleep  2
    Execute Javascript   window.scrollTo(108,632)
    sleep  2
    Clic Onglet CDR
    Verification colonnes CDR
    [Teardown]  End Session

019_Verifier_la_presence_des_colonnes_SENDER_RECEIVER
    [Tags]  TA_019
    [Documentation]    Visualiser la presence des colonnes SENDER et RECEIVER les cdrs
    ${TEST NAME} =  Set Variable  Verifier la presence des colonnes SENDER et RECEIVER sur les cdrs
    Authentification
    Verifier la presence des colonnes SENDER et RECEIVER sur l'affichage des cdrs
    [Teardown]  End Session

020_Visualiser_les_alarmes_generees_sur_dashboard
    [Tags]  TA_020
    [Documentation]  Consulter le status des alarmes generees sur le dashboard
    ${TEST NAME} =  Set Variable  Visualiser les alarmes generees sur le dashboard
    Authentification
    Visualisation du status des alarmes generees sur le dashboard
    [Teardown]  End Session

021_Verification_du_taux_de_prise_en_charge_Alarmes
    [Tags]    TA_021
    [Documentation]    Verification du taux de prise en charge Alarmes dans le Dashboard
    ${TEST NAME} =  Set Variable  Verification du taux de prise en charge Alarmes
    Authentification
    Filtrer sur les 30 derniers jours dans dashboard
    Calcul du taux de prise en charge et verification
    [Teardown]  End Session

022_Verification_Rubrique_Orange_Money
    [Tags]  TA_022
    [Documentation]    Verification de la presence du sous menu Orange Money
    ${TEST NAME} =  Set Variable  Verification_Rubrique_Orange_Money
    Authentification
    Verifier la presence de la rubrique Orange Money
    [Teardown]  End Session

023_Affichage_des_alarmes_SMS_A2P_dans_Alarmes_SMS_A2P
    [Tags]  TA_023
    [Documentation]  Affichage des alarmes SM2 A2P dans la page Alarmes SMS A2P
    ${TEST NAME} =  Set Variable  Affichage des alarmes SMS A2P dans la page Alarmes SMS A2P
    Authentification
    Clic sur le menu Alarms
    Clic sur le sous menu Alarms SMS A2P
    Affichage des alarmes SM2 A2P dans la page Alarmes SMS A2P
    [Teardown]  End Session

024_Non affichage_des_alarmes_SMS_A2P_dans_Alarmes_Simbox
    [Tags]  TA_024
    [Documentation]   Non affichage des alarmes SMS A2P dans la page Alarmes Simbox
    ${TEST NAME} =  Set Variable  Non affichage des alarmes SMS A2P dans la page Alarmes Simbox
    Authentification
    Clic sur le menu Alarms
    Clic sur le sous menu Alarms Simbox
    Non affichage des alarmes SMS A2P dans la page Alarmes Simbox
    [Teardown]  End Session
