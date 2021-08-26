*** Settings ***
Library  SeleniumLibrary
Resource  common.robot
Variables  ../PageObjects/Locators.py

*** Keywords ***
Clic sur le menu Alarms
    Wait Until Element Is Enabled  ${menu_alarmes}  10
    Click Element       ${menu_alarmes}

Clic sur le sous menu Alarms
    Wait Until Element Is Enabled     ${sous_menu_alarmes}  10
    Click Element       ${sous_menu_alarmes}
    Sleep  2

Clic sur la case a cocher d une alarme
    Wait until Element is Visible       ${checked_first_alarme_in_the_list}    60
    Click Element      ${checked_first_alarme_in_the_list}

Clic sur le filtre des scopes
    Wait until Element is Visible   //*[@id="field_scope"]  30
    Click Element    //*[@id="field_scope"]

Clic sur le filtre des statuts
     Wait until Element is Visible    ${flt_statutAlarme}    30
     Click Element    ${flt_statutAlarme}

Clic sur le menu dashboard
     Wait Until Element Is Enabled  //*[@id="orange-navbar-collapse"]/ul/li[1]/a/span/span  10
     Click Element     //*[@id="orange-navbar-collapse"]/ul/li[1]/a/span/span

Clic sur le scope OM
    Click Element    //*[@id="field_scope"]/option[2]

Clic sur le checkbox du INV
     Click Element  ${cheked_statutINV}

Clic sur le bouton filtrer
    Wait until Element is Enabled  ${btn_filter}  30
    Click Element    ${btn_filter}

Clic on radio button AVL
   Click Button   xpath= /html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[1]/jhi-alarms-header/div[2]/div/form/div/div[1]/div/span/div[2]/div[2]/span/div[4]/button/input

Clic sur le bouton options
    Wait until Element is Visible     ${btn_options}     30
    Click Element     ${btn_options}

clic sur export
    Wait until Element is Visible      xpath= /html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[1]/jhi-alarms-header/div[2]/div/form/div/div[4]/div/div/div/div/a/span/span    30
    Click Element     xpath= /html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[1]/jhi-alarms-header/div[2]/div/form/div/div[4]/div/div/div/div/a/span/span

Clic sur le checkbox du NEW
    Wait until Element is Visible     ${cheked_statutNEW}   30
    Click Element      ${cheked_statutNEW}

Clic sur une alarme
     Wait Until Element Is Visible      ${clic_sur_une_alarme}    60
     Click Element      ${clic_sur_une_alarme}

Clic sur le sous menu Alarms Simbox
    Wait Until Element Is Enabled  ${sous_menu_alarmesSimbox}  10
    Click Element       ${sous_menu_alarmesSimbox}


Clic sur le sous menu Alarms O.Money
    Wait Until Element Is Enabled  xpath= //*[@id="orange-navbar-collapse"]/ul/li[4]/ul/li[6]/a/span/span   10
    Click Element     xpath= //*[@id="orange-navbar-collapse"]/ul/li[4]/ul/li[6]/a/span/span

Clic sur le filtre date modification alarmes
     Click Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[2]/jhi-alarms-dropdown-filter/div/div[1]/div[2]/form/div[1]/div[3]/button/span

Clic sur le bouton reset
    Wait until Element is Enabled  ${btn_reset}  60
    Click Element    ${btn_reset}

Verifier la presence des boutons daction et de dassignation
    Wait Until Element Is Visible       ${btn_assignation}    60
    Wait Until Element Is Visible       ${btn_action}    60

verifier la presence des details de lalarme
    Wait Until Element Is Visible     ${lbl_nomAlarme}    30
    #Page Should Contain Element     ${lbl_nomAlarme}
    Page Should Contain Element     ${lbl_valeurAggregation}
    Page Should Contain Element     ${lbl_dateCreation}
    Page Should Contain Element     ${lbl_dateModification}
    Page Should Contain Element     ${lbl_statut}
    Page Should Contain Element     ${lbl_impactFinancier}
    Page Should Contain Element     ${lbl_nbrEnregistrements}
    Page Should Contain Element     ${lbl_tempsAnalyse}
    Page Should Contain Element     ${lbl_typeAggregation}
    Page Should Contain Element     ${lbl_assignation}
    Page Should Contain Element     ${lbl_reseau}

Verfier la presence des details du client
    Wait Until Element Is Visible     ${lbl_detailsClient}   30

Verifier les sous menu
   # Page Should Contain Element     ${sous_menu_allAlarmes}
   # Page Should Contain Element     ${sous_menu_myAlarmes}
   # Page Should Contain Element     ${sous_menu_closedAlarms}
   wait until element is visible    ${sous_menu_allAlarmes}    30
   #Element Should Be Visible  ${sous_menu_allAlarmes}
   Element Should Be Visible  ${sous_menu_myAlarmes}
   Element Should Be Visible  ${sous_menu_closedAlarms}

Verifier les filtres alarmes
    wait until element is visible    ${flt_regle}    30
    #Page Should Contain Element     ${flt_regle}
    Page Should Contain Element     ${flt_dateCreation}
    Page Should Contain Element     ${flt_valorisation}
    Page Should Contain Element     ${flt_nbrAlertes}
    Page Should Contain Element     ${flt_assignation}
    Page Should Contain Element     ${flt_statutAlarme}
    #Page Should Contain Element     ${flt_typeAlarme}
    Page Should Contain Element     ${btn_reset}
    Page Should Contain Element     ${btn_filter}

Verifier les boutons reset et filter
    wait until element is visible    ${flt_regle}    30
    Element Should Be Visible     ${btn_reset}
    Element Should Be Visible     ${btn_filter}


Verifier la presence des colonnes
    wait until element is visible      ${col_nomAlarme}    30
    #Page Should Contain Element     ${col_nomAlarme}
    Page Should Contain Element     ${col_regleAlarme}
    Page Should Contain Element     ${col_dateCreationAlarme}
    Page Should Contain Element     ${col_dateModificationAlarme}
    Page Should Contain Element     ${col_valeurAggregationAlarme}
    Page Should Contain Element     ${col_valorisationAlarme}
    Page Should Contain Element     ${col_nbrAlertesAlarme}
    Page Should Contain Element     ${col_assignAlarme}
    Page Should Contain Element     ${col_statutAlarme}

Verifier laffichage des boutons daction de reassignation et dexport en fonction des statuts et de lassignation des alarmes
    @{Stat}    Create List   NEW    INV    PEN   AVL
     FOR    ${Item}    IN    @{Stat}
     #Click sur statut
     Click Element   ${flt_statutAlarme}
     # inserer un element de la liste dans lespace de recherche
     Run Keyword If        '${Item}'=='${Item}'        Input Text      xpath=(//input[@type='text'])[3]       ${Item}         ELSE    Continue For Loop
     Sleep  2
     #Cliquez sur la case a cocher de lelement qui apparait
     Click Element     ${check_statutAlarme}
     Sleep  2
     #Cliquez sur filter
      Click Element     ${btn_filter}
      Sleep  2
    #action a faire apres avoir filtrer
     # si le filtrage a donne quelques lignes de reponse je coche le premier sinon je sors de la boucle
     ${present}=  Run Keyword And Return Status        Element Should Be Visible       ${first_alarme_in_the_list}
     log  ${present}
     Run Keyword If    ${present}    Click Element      xpath=//*[@id=\"table-alarm\"]/tbody/tr[1]/td[2]       ELSE  Click Element   ${btn_reset}
     Sleep  2

     Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[1]/jhi-alarms-header/div[2]/div/form/div/div[2]
     Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[1]/jhi-alarms-header/div[2]/div/form/div/div[3]
     # deselectionner le statut choisi en cours
     Click Element     ${btn_reset}
     Sleep  2
     END

#kouna
Verifier la presence de la rubrique Orange Money
    Clic sur le menu Alarms
    Page Should Contain Element  //*[@id="orange-navbar-collapse"]/ul/li[4]/ul/li[6]/a/span/span

#kouna
VERIF_WORKFLOW_FROM_NEW_TO_INV_NFR_FRD
    # Cliquer sur Alarms ensuite sur le sous menu Alarms
    Click Element   xpath= //*[@id="alarmsNavBarDropdown"]/span/span
    Click Element   xpath= //*[@id="orange-navbar-collapse"]/ul/li[4]/ul/li[1]/a/span/span
    Sleep   2
    Click Element    xpath= //*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[1]/div/span[1]
    Sleep  2
    #Filter sur un statut
    Input Text    xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/div[2]/input    new
    #Cocher le statut filtrer
    Click Element  xpath = //*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/ul/span/li
    Sleep  3
    #Cliquer sur le bouton filtrer
    Click Element  ${btn_filter}
    Sleep  2
    #Si le filtre donne quelques lignes cocher la premiere ligne Sinon cliquer sur le bouton reset
    ${present} =  Run Keyword And Return Status    Element Should Be Visible   xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]
    log  ${present}
    Sleep     2
    ################################ From New To INV ############################################
    Run Keyword If    ${present}       VERIF_WORKFLOW_FROM_NEW_TO_INV
    ################################ From New To NFR - FRD ############################################
    VERIF_WORKFLOW_FROM_NEW_TO_NFR_FRD

#Kouna
VERIF_WORKFLOW_FROM_NEW_TO_INV
       ###      Pass NEW TO INV    ###
	   #Cliquer sur le bouton Cloturer
       Click Element   ${first_alarme_in_the_list}
	   Sleep    2
	   # Page Should Contain Element     ${sous_menu_closedAlarms}
	   Wait until element is visible   //*[@id="assigned-to"]
       Wait until element is visible   //*[@id="dropdownManual"]  timeout=30
       Scroller vers le bas
       Click Element  ${precedent}
       Sleep  5

VERIF_WORKFLOW_FROM_NEW_TO_NFR_FRD
       ###      Pass NEW TO NFR    ###
       Clic sur la case a cocher d une alarme
	   #Cliquer sur le bouton Cloturer
	   wait until element is visible    ${btn_cloturer}    30
       Click Element     ${btn_cloturer}
	   Sleep    2
	   #Stocker le commentaire saisi dans une variable ${comment}
	   ${comment}     Set Variable    DE_NEW_A_NFR
	   Log    ${comment}
	   Input Text    name:comment    ${comment}
	   Sleep    2
	   #Cliquer sur le bouton NoFraud
	   Click Element       ${btn_noFraud}
	   Sleep    4
	   #Verifions si le loader est affiche
	   #Element Should Be Visible    css=svg
	   #Attendre juska ce que le loader dispatrait
	   #Wait Until Element Is Not Visible    css=svg     timeout=60
	   #Click sur le lien Alarms Cloturees
	   Click Element        ${sous_menu_closedAlarms}
	   Sleep    6
       #Verifions si le commentaire saisi a ete pris en compte en suvolant le statut de l alarme
	   Mouse Over     ${survoler_statutAlarme}
	   Sleep    5
       ${VerifComment}      Get Text     //*[@id="table-alarm"]/tbody/tr[1]/td[11]/div[2]/ul/li/a/span[1]
	   Log    ${VerifComment}
	   Should Be Equal    '${comment}'    '${VerifComment}'
	   Sleep    2
	   #Revenir sur la liste des alarmes
	   Click Element    xpath = //*[@id="allAlarmes"]/a/span
	   Sleep    6

       ####     Pass NEW TO FRD    ####
       ${present} =  Run Keyword And Return Status    Element Should Be Visible   xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]
       log  ${present}
       Sleep     2
       Run Keyword If    ${present}    Click Element    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]      ELSE      Continue For Loop
       Sleep    2
       #Cliquer sur le bouton Cloturer
       Click Element    xpath = /html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[1]/jhi-alarms-header/div[2]/div/form/div/div[3]/div/button/span
	   Sleep    2
	   #Stocker le commentaire saisi dans une variable ${comment}
	   ${comment}     Set Variable    DE_NEW_A_FRD
	   Input Text    name:comment    ${comment}
	   Sleep    2
	   #Cliquer sur le bouton Fraud
	   Click Element   xpath = /html/body/ngb-modal-window/div/div/jhi-alarm-popup/form/div[3]/button[1]/span[2]/span
	   Sleep    4
	   #Attendre juska ce que le loader dispatrait
	   #Wait Until Element Is Not Visible    css=svg     timeout=300
	   #Click sur le lien Alarms Cloturees
	   Click Element  xpath = //*[@id="closedAlarms"]/a/span
       Sleep    6
	   #Verifions si le commentaire saisi a ete pris en compte en suvolant le statut de l alarme
	   Mouse Over    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[11]/div[1]
	   Sleep    5
	   ${VerifComment}    Get Text    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[11]/div[2]/ul/li/a/span[1]
	   Log    ${VerifComment}
	   Should Be Equal    '${comment}'    '${VerifComment}'
	   Sleep    2
	   #Revenir sur la liste des alarmes
	   Click Element    xpath = //*[@id="allAlarmes"]/a/span
	   Sleep    3
	   #Reset filtre
	   Click Element      ${btn_reset}
	   Sleep     2

#kouna
VERIF_WORKFLOW_FROM_INV_TO_PEN
        ###  Pass INV TO PEN    ###
       Click Element   ${first_alarme_in_the_list}
	   Sleep    2
	   # Page Should Contain Element     ${sous_menu_closedAlarms}
	   Wait until element is visible   //*[@id="assigned-to"]
       Wait until element is visible   //*[@id="dropdownManual"]  timeout=30
       Click Button  //*[@id="dropdownManual"]
       Click Element  xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm-detail/div[1]/div[1]/div/div[1]/div[2]/ul/li/div/form/div/div[2]/span/div[2]/div[2]/span/div[3]/button/input
       Sleep  2
       ${comment}     Set Variable    DE_INV_A_PEN
	   Log    ${comment}
	   Input Text    name:comment    ${comment}
	   Sleep    2
	   #Cliquer sur le bouton sauvegarder
	   Click Element  xpath=/html/body/ngb-modal-window/div/div/jhi-alarm-popup/form/div[3]/button[2]
	   Sleep    3
       Scroller vers le bas
       Click Element  ${precedent}
       Sleep  5

WORKFLOW_FROM_INV_TO_PEN
        # Cliquer sur Alarms ensuite sur le sous menu Alarms
        Click Element   xpath= //*[@id="alarmsNavBarDropdown"]/span/span
        Click Element   xpath= //*[@id="orange-navbar-collapse"]/ul/li[4]/ul/li[1]/a/span/span
        Sleep   2
        Click Element    xpath= //*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[1]/div/span[1]
        Sleep  2
        #Filter sur un statut
        Input Text    xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/div[2]/input    inv
        #Cocher le statut filtrer
        Click Element  xpath = //*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/ul/span/li
        Sleep  3
        #Cliquer sur le bouton filtrer
        Click Element  ${btn_filter}
        Sleep  2
        #Si le filtre donne quelques lignes cocher la premiere ligne Sinon cliquer sur le bouton reset
        ${present} =  Run Keyword And Return Status    Element Should Be Visible   xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]
        log  ${present}
        Sleep     2
        ################################ From New To INV ############################################
        Run Keyword If    ${present}       VERIF_WORKFLOW_FROM_INV_TO_PEN


VERIF_WORKFLOW_FROM_INV_TO_FRD_NFR_PEN_AVL
      Clic sur le menu Alarms
      Clic sur le sous menu Alarms
      Clic sur le filtre des statuts
      Clic sur le checkbox du INV
      Sleep  2
      Clic sur le bouton filtrer
      Sleep  2
      Clic sur la case a cocher d une alarme
      ####    Pass INV TO FRD    ###
      wait until element is visible   xpath = //*[@id="dropdownManual"]     30
      Click Button  xpath = //*[@id="dropdownManual"]
      Sleep   2
      #Click on radio button FRD
      Click Button    xpath = /html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[1]/jhi-alarms-header/div[2]/div/form/div/div[1]/div/span/div[2]/div[2]/span/div[1]/button/input
      #Enter a comment
      ${comment}     Set Variable    DE_INV_A_FRD
      Input Text    name:comment    ${comment}
      Log    ${comment}
      #Click on save
      Click Element    xpath = /html/body/ngb-modal-window/div/div/jhi-alarm-popup/form/div[3]/button[2]/span[2]/span
	  Sleep    2
	  #Attendre juska ce que le loader dispatrait
	  #Wait Until Element Is Not Visible    css=svg     timeout=300
	  #Click sur le lien Alarms Cloturees
	  Click Element  xpath = //*[@id="closedAlarms"]/a/span
	  #On affecte le statut nfr a la variable lastStatut
      Sleep    4
	  #On survole le statut pour verifier le commentaire saisi
	  Mouse Over    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[11]/div[1]
	  Sleep    4
	  # Verifions si le commentaire saisi est pris en compte
	  ${VerifComment}    Get Text    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[11]/div[2]/ul/li/a/span[1]
	  Log    ${VerifComment}
	  Should Be Equal    '${comment}'    '${VerifComment}'
	  Sleep    2
	  #Revenir sur la liste des alarmes
	  Click Element    xpath = //*[@id="allAlarmes"]/a/span
	  Sleep    3
	  #Reset filtre
	  #Click Element      ${btn_reset}
	  #Sleep    2

      ###    Pass INV TO NFR   ###
      ${present} =  Run Keyword And Return Status    Element Should Be Visible   xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]
      log  ${present}
      Sleep     2
      Run Keyword If    ${present}    Click Element    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]      ELSE    Continue For Loop
	  wait until element is visible   xpath = //*[@id="dropdownManual"]     30
	  Click Button  xpath = //*[@id="dropdownManual"]
      Sleep   2
      #Click on radio button NFR
      Click Button    xpath = /html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[1]/jhi-alarms-header/div[2]/div/form/div/div[1]/div/span/div[2]/div[2]/span/div[2]/button/input
      #Enter a comment
      ${comment}     Set Variable    DE_INV_A_NFR
      Input Text    name:comment    ${comment}
      Log    ${comment}
      #Click on save
      Click Element    xpath = /html/body/ngb-modal-window/div/div/jhi-alarm-popup/form/div[3]/button[2]/span[2]/span
	  Sleep    2
	  #Attendre juska ce que le loader dispatrait
	  #Wait Until Element Is Not Visible    css=svg     timeout=300
	  #Click sur le lien Alarms Cloturees
	  Click Element  xpath = //*[@id="closedAlarms"]/a/span
	  #On affecte le statut nfr a la variable lastStatut
      Sleep    4
	  #On survole le statut pour verifier le commentaire saisi
	  Mouse Over    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[11]/div[1]
	  Sleep    4
	  # Verifions si le commentaire saisi est pris en compte
	  ${VerifComment}    Get Text    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[11]/div[2]/ul/li/a/span[1]
	  Log    ${VerifComment}
	  Sleep    2
	  Should Be Equal    '${comment}'    '${VerifComment}'
	  Sleep    2
	  #Revenir sur la liste des alarmes
	  Click Element    xpath = //*[@id="allAlarmes"]/a/span
	  Sleep    3
	  #Reset filtre
	  #Click Element      ${btn_reset}
	  #Sleep    2
      ###    Pass INV TO PEN     ###
      ${present} =  Run Keyword And Return Status    Element Should Be Visible   xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]
      log  ${present}
      Sleep     2
      Run Keyword If    ${present}    Click Element    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]      ELSE    Continue For Loop
	  Sleep    2
	  Click Button  xpath = //*[@id="dropdownManual"]
      Sleep   2
      #Click on radio button PEN
      Click Button    xpath = /html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[1]/jhi-alarms-header/div[2]/div/form/div/div[1]/div/span/div[2]/div[2]/span/div[3]/button/input
      #Enter a comment
      ${comment}     Set Variable    DE_INV_A_PEN
      Input Text    name:comment    ${comment}
      Log    ${comment}
      #Click on save
      Click Element    xpath = /html/body/ngb-modal-window/div/div/jhi-alarm-popup/form/div[3]/button[2]/span[2]/span
	  Sleep   5
      #Attendre juska ce que le loader dispatrait
	  #Wait Until Element Is Not Visible    css=svg     timeout=300
      #Decocher le statut INV
      Click Element    //*[@id="serchToolButton"]/a[1]/span
      Sleep    4
      #Cliquer sur le filtre statut
      Click Element    xpath= //*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[1]/div/span[1]
      Sleep  2
      #Saisir PEN
      Input Text      xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/div[2]/input     PEN
      Sleep    2
      #Cocher  PEN
      Click Element    xpath= //*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/ul/span/li
      Sleep     2
      #Cliquer a nouveau sur le bouton filtre
      Click Element     ${btn_filter}
      Sleep    2
      #Verifions si le commentaire saisi a ete pris en compte en suvolant le statut de l alarme
	  Mouse Over    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[11]/div[1]
	  Sleep    4
      # Verifions si le commentaire saisi est pris en compte
	  ${VerifComment}    Get Text    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[11]/div[2]/ul/li/a/span[1]
	  Log    ${VerifComment}
	  Should Be Equal    '${comment}'    '${VerifComment}'
	  Sleep    2
	  Click Element   //*[@id="serchToolButton"]/a[1]/span
      Sleep    4
      ###    Pass INV TO AVL    ###
      #Cliquer sur le filtre statut
      Click Element    xpath= //*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[1]/div/span[1]
      Sleep  2
      #Saisir INV
      Input Text      xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/div[2]/input     INV
      Sleep    2
      #Cocher  INV
      Click Element  xpath = //*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/ul/span/li
      Sleep  3
      #Click Element    xpath= //*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/ul/span/li[2]/input
      #Sleep     2
      #Cliquer a nouveau sur le bouton filtre
      Click Element     ${btn_filter}
      Sleep    2
      #Click Element     ${btn_reset}
      #Sleep     2
      ${present} =  Run Keyword And Return Status    Element Should Be Visible   xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]
      log  ${present}
      Sleep     2
      Run Keyword If    ${present}    Click Element    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]      ELSE    Continue For Loop
	  Sleep    3
	  Click Button  xpath = //*[@id="dropdownManual"]
      Sleep   2
      #Click on radio button AVL
      Click Button    xpath = /html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[1]/jhi-alarms-header/div[2]/div/form/div/div[1]/div/span/div[2]/div[2]/span/div[4]/button/input
      Sleep  4
      Click Element    //*[@id="serchToolButton"]/a[1]/span
      Sleep  2

VERIF_WORKFLOW_FROM_PEN_TO_NFR_FRD
      ####    Pass PEN TO NFR   ###
      Clic sur le menu Alarms
      Clic sur le sous menu Alarms
      #Revenir sur la liste des alarmes
      wait until element is visible   xpath = //*[@id="allAlarmes"]/a/span    30
	  Click Element  xpath = //*[@id="allAlarmes"]/a/span
	  Sleep    2
	  Click Element    ${btn_reset}
	  Sleep    2
	  #Cliquer sur le filtre statut
      Click Element    xpath= //*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[1]/div/span[1]
      Sleep  2
      #Saisir PEN
      Input Text      xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/div[2]/input     PEN
      Sleep    2
      #Cocher PEN
      Click Element    xpath = //*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/ul/span/li
      Sleep    2
      #Cliquer sur Filtrer
      Click Element   ${btn_filter}
	  Sleep    3
	  ${present} =  Run Keyword And Return Status    Element Should Be Visible   xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]
      log  ${present}
      Sleep     3
      Run Keyword If    ${present}    Click Element    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]      ELSE    Continue For Loop
	  Sleep    2
      Click Button  xpath = //*[@id="dropdownManual"]
      Sleep   2
      #Click on radio button NFR
      Click Button    xpath = /html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[1]/jhi-alarms-header/div[2]/div/form/div/div[1]/div/span/div[2]/div[2]/span/div[2]/button/input
      #Enter a comment
      ${comment}     Set Variable    DE_PEN_A_NFR
      Input Text    name:comment    ${comment}
      Log    ${comment}
      #Click on save
      Click Element    xpath = /html/body/ngb-modal-window/div/div/jhi-alarm-popup/form/div[3]/button[2]/span[2]/span
	  Sleep    3
      #Attendre juska ce que le loader dispatrait
	  #Wait Until Element Is Not Visible    css=svg     timeout=300
	  #Click sur le lien Alarms Cloturees
	  Click Element  xpath = //*[@id="closedAlarms"]/a/span
	  #On affecte le statut nfr a la variable lastStatut
      Sleep    4
	  Mouse Over    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[11]/div[1]
	  Sleep    4
	  # Verifions si le commentaire saisi est pris en compte
	  ${VerifComment}    Get Text    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[11]/div[2]/ul/li/a/span[1]
	  Log    ${VerifComment}
	  Should Be Equal    '${comment}'    '${VerifComment}'
	  Sleep    2
	  #Revenir sur la liste des alarmes
	  Click Element    xpath = //*[@id="allAlarmes"]/a/span
	  Sleep    3
	  #Reset filtre
	  #Click Element      ${btn_reset}
	  #Sleep    2

      ###    Pass PEN TO FRD    ###
      #${present} =  Run Keyword And Return Status    Element Should Be Visible   xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]
      #log  ${present}
      #Sleep     2
      #Run Keyword If    ${present}    Click Element    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]      ELSE    Continue For Loop
      #Sleep    2
      Click Element    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]
      Sleep  2
      Click Button  xpath = //*[@id="dropdownManual"]
      Sleep   2
      #Click on radio button FRD
      Click Button    xpath = /html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[1]/jhi-alarms-header/div[2]/div/form/div/div[1]/div/span/div[2]/div[2]/span/div[1]/button/input
      #Enter a comment
      ${comment}     Set Variable     DE_PEN_A_FRD
      Input Text    name:comment    ${comment}
      Log    ${comment}
      #Click on save
      Click Element    xpath = /html/body/ngb-modal-window/div/div/jhi-alarm-popup/form/div[3]/button[2]/span[2]/span
	  Sleep    2
	  #Attendre juska ce que le loader dispatrait
	  #Wait Until Element Is Not Visible    css=svg     timeout=300
	  #Click sur le lien Alarms Cloturees
	  Click Element  xpath = //*[@id="closedAlarms"]/a/span
	  #On affecte le statut nfr a la variable lastStatut
      Sleep    4
	  #On survole le statut pour verifier le commentaire saisi
	  Mouse Over    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[11]/div[1]
	  Sleep  4
	  # Verifions si le commentaire saisi est pris en compte
	  ${VerifComment}    Get Text    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[11]/div[2]/ul/li/a/span[1]
	  Log    ${VerifComment}
	  Should Be Equal    '${comment}'    '${VerifComment}'
	  Sleep    2
	  #Revenir sur la liste des alarmes
	  Click Element    xpath = //*[@id="allAlarmes"]/a/span
	  Sleep    3


VERIF_WORKFLOW_FROM_PEN_TO_NFR_FRD_AVL
      ####    Pass PEN TO NFR   ###
      Clic sur le menu Alarms
      Clic sur le sous menu Alarms
      #Revenir sur la liste des alarmes
      wait until element is visible   xpath = //*[@id="allAlarmes"]/a/span    30
	  Click Element    xpath = //*[@id="allAlarmes"]/a/span
	  Sleep    2
	  Click Element    ${btn_reset}
	  Sleep    2
	  #Cliquer sur le filtre statut
      Click Element    xpath= //*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[1]/div/span[1]
      Sleep  2
      #Saisir PEN
      Input Text      xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/div[2]/input     PEN
      Sleep    2
      #Cocher PEN
      Click Element    xpath = //*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/ul/span/li
      Sleep    2
      #Cliquer sur Filtrer
      Click Element       ${btn_filter}
	  Sleep    2
	  ${present} =  Run Keyword And Return Status    Element Should Be Visible   xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]
      log  ${present}
      Sleep     2
      Run Keyword If    ${present}    Click Element    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]      ELSE    Continue For Loop
	  Sleep    2
      Click Button  xpath = //*[@id="dropdownManual"]
      Sleep   2
      #Click on radio button NFR
      Click Button    xpath = /html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[1]/jhi-alarms-header/div[2]/div/form/div/div[1]/div/span/div[2]/div[2]/span/div[2]/button/input
      #Enter a comment
      ${comment}     Set Variable    DE_PEN_A_NFR
      Input Text    name:comment    ${comment}
      Log    ${comment}
      #Click on save
      Click Element    xpath = /html/body/ngb-modal-window/div/div/jhi-alarm-popup/form/div[3]/button[2]/span[2]/span
	  Sleep    2
      #Attendre juska ce que le loader dispatrait
	  #Wait Until Element Is Not Visible    css=svg     timeout=300
	  #Click sur le lien Alarms Cloturees
	  Click Element  xpath = //*[@id="closedAlarms"]/a/span
	  #On affecte le statut nfr a la variable lastStatut
      Sleep   6
	  Mouse Over    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[11]/div[1]
	  Sleep    4
	  # Verifions si le commentaire saisi est pris en compte
	  ${VerifComment}    Get Text    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[11]/div[2]/ul/li/a/span[1]
	  Log    ${VerifComment}
	  Should Be Equal    '${comment}'    '${VerifComment}'
	  Sleep    2
	  #Revenir sur la liste des alarmes
	  Click Element    xpath = //*[@id="allAlarmes"]/a/span
	  Sleep    3
	  #Reset filtre
	  #Click Element      ${btn_reset}
	  #Sleep    2

      ###    Pass PEN TO FRD    ###
      ${present} =  Run Keyword And Return Status    Element Should Be Visible   xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]
      log  ${present}
      Sleep     2
      Run Keyword If    ${present}    Click Element    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]      ELSE    Continue For Loop
      Sleep    2
      Click Button  xpath = //*[@id="dropdownManual"]
      Sleep   2
      #Click on radio button FRD
      Click Button    xpath = /html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[1]/jhi-alarms-header/div[2]/div/form/div/div[1]/div/span/div[2]/div[2]/span/div[1]/button/input
      #Enter a comment
      ${comment}     Set Variable     DE_PEN_A_FRD
      Input Text    name:comment    ${comment}
      Log    ${comment}
      #Click on save
      Click Element    xpath = /html/body/ngb-modal-window/div/div/jhi-alarm-popup/form/div[3]/button[2]/span[2]/span
	  Sleep    2
	  #Attendre juska ce que le loader dispatrait
	  #Wait Until Element Is Not Visible    css=svg     timeout=300
	  #Click sur le lien Alarms Cloturees
	  Click Element  xpath = //*[@id="closedAlarms"]/a/span
	  #On affecte le statut nfr a la variable lastStatut
      Sleep    6
	  #On survole le statut pour verifier le commentaire saisi
	  Mouse Over    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[11]/div[1]
	  Sleep    4
	  # Verifions si le commentaire saisi est pris en compte
	  ${VerifComment}    Get Text    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[11]/div[2]/ul/li/a/span[1]
	  Log    ${VerifComment}
	  Should Be Equal    '${comment}'    '${VerifComment}'
	  Sleep    2
	  #Revenir sur la liste des alarmes
	  Click Element    xpath = //*[@id="allAlarmes"]/a/span
	  Sleep    3

      ###    Pass PEN TO AVL    ###
      ${present} =  Run Keyword And Return Status    Element Should Be Visible   xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]
      log  ${present}
      Sleep     2
      Run Keyword If    ${present}    Click Element    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]      ELSE    Continue For Loop
      Sleep    2
      Click Button  xpath = //*[@id="dropdownManual"]
      Sleep   3
      Clic on radio button AVL
      Sleep  4

Reassignation depuis la page de liste des alarmes en prenant en compte les statuts des alarmes
     #@{Stat}    Create List     NEW   INV   PEN    AVL
      @{Stat}    Create List     NEW  PEN
        FOR    ${Item}    IN    @{Stat}
         #Click sur statut
         Click Element     ${flt_statutAlarme}
         # inserer un element de la liste dans lespace de recherche
         Run Keyword If   '${Item}'=='${Item}'   Input Text     xpath=(//input[@type='text'])[3]      ${Item}    ELSE    Continue For Loop
         Sleep  2
         #Cliquez sur la case a cocher de lelement qui apparait
         Click Element      ${check_statutAlarme}
         Sleep  2
         #Cliquer sur filtrer
         Click Element      ${btn_filter}
         Sleep  3
        #action a faire apres avoir filtrer
         # si le filtrage a donne quelques lignes de reponse je coche le premier sinon je sors de la boucle
         ${present}=  Run Keyword And Return Status       Element Should Be Visible        ${first_alarme_in_the_list}
         log  ${present}
         Run Keyword If    ${present}    Click Element     ${checked_first_alarme_in_the_list}
         Sleep  3
         Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[1]/jhi-alarms-header/div[2]/div/form/div/div[2]
         Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[1]/jhi-alarms-header/div[2]/div/form/div/div[3]
         #Choisir le user
      #\   Run Keyword If    '${Item}'!='AVL'     Click Element       ${checked_first_alarme_in_the_list}       ELSE   Continue For Loop
         # ancienne valeur de la variable      //*[@id="assigned-to"]/option[2]
         #Affecterle user assigner a la variable ${reassignUser}
         wait until element is visible      xpath=//*[@id="assigned-to"]      30
         Click Element   xpath=//*[@id="assigned-to"]
         wait until element is visible        xpath=//*[@id="assigned-to"]/option[2]
         ${reassignUser}    Get Text     xpath=//*[@id="assigned-to"]/option[2]
         log  ${reassignUser}
         CLick Element     xpath=//*[@id="assigned-to"]/option[2]
         Wait Until Element Contains     xpath=//*[@id="table-alarm"]/tbody/tr[1]/td[10]/span     ${reassignUser}      timeout=120
         Reload Page
         Set Selenium Implicit Wait    12
         Sleep    4
         Click Element      ${btn_reset}
         END

#Kouna
Reassignation d'une alarme de status avl
   #Click sur statut
   Click Element     ${flt_statutAlarme}
   Input Text     xpath=(//input[@type='text'])[3]     avl
   #Cliquez sur la case a cocher de lelement qui apparait
   Click Element      ${check_statutAlarme}
   Sleep  2
   #Cliquer sur filtrer
   Click Element      ${btn_filter}
   Sleep    3
    #action a faire apres avoir filtrer
    # si le filtrage a donne quelques lignes de reponse je coche le premier sinon je sors de la boucle
   ${present}=  Run Keyword And Return Status       Element Should Be Visible        ${first_alarme_in_the_list}
   log  ${present}
   Run Keyword If    ${present}    Click Element     ${checked_first_alarme_in_the_list}
   wait until element is visible  xpath=//*[@id="dropdownManual"]
   ${acquit}=  Run Keyword And Return Status      Element Should Be Visible   //*[@id="dropdownManual"]
   Run Keyword If  ${acquit}    Reassignation avant acquittement  ELSE   Reassignation apres acquittement


Reassignation avant acquittement
   #Cliquer sur le bouton acquitter pour acquitter l'alarme
   Click button  xpath=//*[@id="dropdownManual"]
   Sleep  5
   #Clic sur le premier element de la liste
   Click Element     ${checked_first_alarme_in_the_list}
   wait until element is visible      xpath=//*[@id="assigned-to"]      60
   #Clic sur le bouton d'action de reassignation
   Click Element   xpath=//*[@id="assigned-to"]
   wait until element is visible        xpath=//*[@id="assigned-to"]/option[2]
   ${reassignUser}    Get Text     xpath=//*[@id="assigned-to"]/option[2]
   log  ${reassignUser}
   # Reassigner l'alarme
   CLick Element     xpath=//*[@id="assigned-to"]/option[2]
   Wait Until Element Contains     xpath=//*[@id="table-alarm"]/tbody/tr[1]/td[10]/span     ${reassignUser}      timeout=60
   Sleep  3
   #Clic sur le premier alarme de la liste
   Click Element  ${checked_first_alarme_in_the_list}
   wait until element is visible  xpath=//*[@id="dropdownManual"]
   #Clic sur le bouton accepter pour accepter l'alarme
   Click Button  xpath=//*[@id="dropdownManual"]
   Sleep  3

Reassignation apres acquitement
   Wait Until Element Is Visible  xpath=//*[@id="assigned-to"]
   #Clic sur le bouton d'action de reassignation
   Click Element   xpath=//*[@id="assigned-to"]
   wait until element is visible        xpath=//*[@id="assigned-to"]/option[2]
   ${reassignUser}    Get Text   xpath=//*[@id="assigned-to"]/option[2]
   log  ${reassignUser}
   # Reassigner l'alarme
   CLick Element     xpath=//*[@id="assigned-to"]/option[2]
   Wait Until Element Contains     xpath=//*[@id="table-alarm"]/tbody/tr[1]/td[10]/span     ${reassignUser}      timeout=60
   Sleep  3
   #Clic sur le premier alarme de la liste
   Click Element  ${checked_first_alarme_in_the_list}
   wait until element is visible  //*[@id="dropdownManual"]
   #Clic sur le bouton accepter pour accepter l'alarme
   Click Button  //*[@id="dropdownManual"]
   Sleep  3

Recup
    @{Stat}    Create List   NEW
     FOR    ${Item}    IN    @{Stat}
       #Cliquer sur le filtre statut
       clic sur le filtre des statuts
       Sleep  2
       #Filter sur un statut
       Run Keyword If   '${Item}'=='${Item}'   Input Text    xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/div[2]/input    ${Item}    ELSE    Continue For Loop
       #Cocher le statut filtrer
       Click Element  xpath = //*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/ul/span/li
       Wait until element is visible      ${btn_filter}
       #Cliquer sur le bouton filtrer
       Click Element  ${btn_filter}
       Sleep  2
       #Si le filtre donne quelques lignes cocher la premiere ligne Sinon cliquer sur le bouton reset
       ${present} =  Run Keyword And Return Status    Element Should Be Visible   xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]
       log  ${present}
       Sleep     2
       Run Keyword If    ${present}    Verifier le nombre d_alertes       ELSE      Click Element  ${btn_reset}
       END

Verifier le nombre d_alertes
    Wait until element is visible   ${nbreAlertes_dans_alarme}
    # je stocke le nombre dalertes de lalarme dans nb
    ${nb}    Get Text      ${nbreAlertes_dans_alarme}
    # je laffiche juste pour verifier si jai la bonne valeur
    log    ${nb}
    Set Global Vari able  ${nba}     ${nb}
    log  ${nba}
    Wait until Element is Visible   ${ouvrir_une_alarme}       timeout=70
    #Ouvrir une alarme
    Click Element   ${ouvrir_une_alarme}
    Sleep  4
    scroller vers le bas
    #Wait until Element is Visible      ${clic_lien_voirPlus}  70
    #Recuperer le nombres de lignes dans les infos de l'alertes et le stocker dans la variable ${nb_lignes}
    ${nb_lignes}  get element count    ${nbrLignes_dans_InfosAlertes}
    log  ${nb_lignes}
    sleep   2
    #Clic sur le lien voir plus
    #Verifier si les deux valeurs sont les memes
    Run Keyword If  '${nba}' !='1'   Verif_nbrLignes_dans_InfosAlertes  ELSE  Should Be Equal  '${nba}'  '${nb_lignes}'

Verif_nbrLignes_dans_InfosAlertes
    # je stocke le nombre dalertes de lalarme dans nb
    #${nb}  Get Text  ${nbreAlertes_dans_alarme}
    log  ${nba}
    Click Element  ${clic_lien_voirPlus}
    ${nb_lignes}  get element count    ${nbrLignes_dans_InfosAlertes}
    #Recuperer le nombres de lignes dans les infos de l'alertes et le stocker dans la variable ${nb_lignes}
    log  ${nb_lignes}
    sleep   2
    #Verifier si les deux valeurs sont les memes
    Should Be Equal      '${nba}'    '${nb_lignes}'
    #clic sur le bouton precedent
    Click Element  ${precedent}

Consultation d une alarme
    #Authentification
    Clic sur le menu Alarms
    CLic sur le sous menu Alarms
    Clic sur une alarme
    Verifier la presence des boutons daction et de dassignation
    verifier la presence des details de lalarme
    Verfier la presence des details du client
    #Verifier la presence du bouton export

Reassignation alarme
    wait until element is visible       ${assigner_a_un_user}   60
    #Clic sur la liste deroulante de la reassignation et choisir un user
    Click Element  ${assigner_a_un_user}
    #Reload Page
    #Stocker le user choisi dans la variable ${assignUser}
    ${assignUser}    Get Text       ${assigner_a_un_user}
    Log    ${assignUser}
    #Page Should Contain    ${assignUser}
    Wait Until Element Contains       ${verif_user_assigner}      ${assignUser}

###################### Verification du taux de prise en charge Alarmes ##########################
Filtrer sur les 30 derniers jours dans dashboard
    wait until element is visible        ${flt_dateCreation_dahsboard}      15
    Click Element      ${flt_dateCreation_dahsboard}
    #sleep   2
    wait until element is visible        ${flt_30_derniers_jrs_dashboard}      15
    Click Element      ${flt_30_derniers_jrs_dashboard}
    Sleep   3

Calcul du taux de prise en charge et verification
    #wait until element is visible      ${txt_nbr_GEN}
    #Recuperer le nombre total d alarmes generees
    wait until element is visible        ${txt_nbr_GEN}      15
    ${GEN}    Get Text     ${txt_nbr_GEN}
    log    ${GEN}
    #Recuperer le nombre total d alarmes generees a statut INV
    ${INV}    Get Text     ${txt_nbr_INV}
    log    ${INV}
    #Recuperer le nombre total d alarmes generees a statut PEN
    ${PEN}    Get Text      ${txt_nbr_PEN}
    log    ${PEN}
    #Recuperer le nombre total d alarmes generees a statut AVL
    ${AVL}=  Get Text       ${txt_nbr_AVL}
    log    ${AVL}
    #Recuperer le nombre total d alarmes generees a statut NFR
    ${NFR}    Get Text      ${txt_nbr_NFR}
    log    ${NFR}
    #Recuperer le nombre total d alarmes generees a statut FRD
    ${FRD}    Get Text      ${txt_nbr_FRD}
    log    ${FRD}
    #Recuperer du taux de prise en charge
    ${TPC_AFFICHE}    Get Text      ${txt_TPC}
    log    ${TPC_AFFICHE}
    #Calcul du taux de prise en charge
    ${SUM} =     Evaluate   ${INV} + ${PEN} + ${AVL} + ${NFR} + ${FRD}
    log   ${SUM}
    ${TPC} =      Evaluate     (${SUM} / ${GEN}) * 100
    log    ${TPC}
    #${TPC_CALCULE} =     Evaluate      round(${TPC}, 2)
    ${TPC_CALCULE} =     Evaluate       "%.2f" %${TPC}
    log    ${TPC_CALCULE}
    Should Be Equal        ${TPC_CALCULE}%     ${TPC_AFFICHE}


################### Lister les Alarmes SIMBOX #####################
Filtrer sur le statut NEW
    Wait Until Element Is Visible      ${flt_statut_simbox}  30
    Click Element       ${flt_statut_simbox}
    Input Text     xpath=(//input[@type='text'])[4]     ${new}
    sleep   2
    Click Element       xpath=//*[@id="filtre"]/div[1]/div[8]/angular2-multiselect/div/div[2]/div[3]/ul/span/li[1]/span/label
    clic sur le bouton filtrer

################################# AFFICHAGE DU CALL DATE SUR LES INFOS CDR ###############################
Clic sur une ligne du tableau des Alarmes Simbox
     Wait Until Element Is visible     ${ligne_tableau_alarmeSimbox}   30
     Click Element     ${ligne_tableau_alarmeSimbox}

Survoler Alerte
     Scroller vers le bas
     Mouse Over    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm-detail/div[3]/div[2]/div/table/tbody/tr/td[2]/span

Verifier affichage valeur du call date
     Wait Until Element Is Visible      ${text_call_date}  10
     ${valeur}=  Get Element Attribute    ${text_call_date}   textContent
     Should Not Be Empty    ${valeur}

###################### Filtre sur les alarmes: Visualisation du nombre total de resultats ##########################
Filtrer sur les 30 derniers jours
    Clic sur le filtre date modification alarmes
    Click Element    //*[@id="filtre"]/div[1]/div[3]/div/div[1]/ul/li[4]/a/span
Combinaison filtre alarmes
    #Wait Until Element Is Not Visible    css=svg      300
    #Click sur le bouton reset
    #Wait Until Element Is Not Visible    css=svg      300
    clic sur le sous menu alarms
    wait until element is visible    ${flt_statutAlarme}      timeout=120
    #Wait Until Element Is Not Visible    css=svg      300
    Sleep  4
    Clic sur le bouton reset
   # Wait Until Element Is Not Visible    css=svg      300
    wait until element is Enabled        ${flt_statutAlarme}      timeout=120
    clic sur le filtre des statuts
    Clic sur le checkbox du INV
    Sleep  3
    Filtrer sur les 30 derniers jours
    Clic sur le bouton filtrer
    sleep    2
    #Wait Until Element Is Not Visible    css=svg     timeout=300


Verification du nombre total de resultats
    #Recuperation du nombre total de resultats
    wait until element is visible    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[2]/jhi-alarms-dropdown-filter/div/div[2]/span[2]     timeout=60
    scroller vers le bas
    scroller vers le bas
    Clic sur le bouton filtrer
    sleep   2
    ${nbr_results}      Get text       xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[2]/jhi-alarms-dropdown-filter/div/div[2]/span[2]
    log     ${nbr_results}
    #${nbr__resultats}=    Get Substring     ${nbr_results}    3   -2
    ${nb_lignes}    get element count      ${nbrLignes_dans_alarmes}
    #log  ${nbr__resultats}
    log  ${nb_lignes}
    #Verifier si les deux valeurs sont les memes
    Should Be Equal      '${nbr_results}'     ' ${nb_lignes}'

################### Lister les Alarmes SIMBOX #####################
Verification filtres Alarmes
    wait until element is visible   ${flt_regle}   30
    Element Should Be Visible  ${flt_regle}
    Element Should Be Visible  ${flt_dateCreation}
    Element Should Be Visible  ${flt_dateModification}
    Element Should Be Visible  ${flt_valorisation}
    Element Should Be Visible  ${flt_assignation}
    Element Should Be Visible  ${flt_spread}
    Element Should Be Visible  ${flt_source}
    Element Should Be Visible  ${flt_statutAlarme}

Verification colonnes Alarmes
   wait until element is visible   ${col_nomAlarme}   30
   Element Should Be Visible  ${col_nomAlarme}
   Element Should Be Visible  ${col_regleAlarme}
   Element Should Be Visible  ${col_dateCreationAlarme}
   Element Should Be Visible  ${col_dateModificationAlarme}
   Element Should Be Visible  ${col_valorisation_Alarmes}
   Element Should Be Visible  ${col_spread_Alarme}
   Element Should Be Visible  ${col_appelSortant_Alarme}
   Element Should Be Visible  ${col_dureeAppel_Alarme}
   Element Should Be Visible  ${col_source_Alarme}
   Element Should Be Visible  ${col_assigneA_Alarme}
   Element Should Be Visible  ${col_statut_Alarmes}

Scroller et verifier le chargement des lots de 50 de la liste Alarme
   #recuperer le nombre de ligne avant de scroller et verifier si c est egal a 50
   ${valeur}=  Get Element Attribute    ${table_liste_alarme}   childElementCount
   Should Not Be Empty    ${valeur}
   Should Be Equal  ${valeur}  50
   #scroller et voir si le chargement des alarmes sera egal a 100
   Scroll Element Into View  ${ligne_50_alarme}
   Sleep  3
   ${valeur2}=  Get Element Attribute    ${table_liste_alarme}   childElementCount
   Should Not Be Empty    ${valeur2}
   Should Be Equal  ${valeur2}  100

Clic sur une alarme et verifier si le nom contient le caractere "_"
  Click Element  //*[@id="table-alarm"]/tbody/tr[47]
    Sleep  3
    #recuperer le nom de l alarme et voir si ca contient le caractere "_"
    ${valNom}=  Get Text   ${txt_nom_alarme}
    log     ${valNom}
    ${alrm_}=  Get Substring  ${valNom}  0  6
    log     ${alrm_}
    Should Be Equal  ${alrm_}    Alarm_

################### Visualisation des colonnes correspondant aux regles de type TBSP #####################
Clic sur Regle
    Wait Until Element Is Enabled   ${flt_regle}   10
    Click Element  ${flt_regle}

Rechercher mot cle TBSP
    Wait Until Element Is Visible  //*[@id="filtre"]/div[1]/div[1]/angular2-multiselect/div/div[2]/div[3]/div[2]/input  10
    Input Text  //*[@id="filtre"]/div[1]/div[1]/angular2-multiselect/div/div[2]/div[3]/div[2]/input  Test TBSP
    Wait Until Element Is Enabled   ${ligne_1_search_regle_TBSP}  10
    Click Element  ${ligne_1_search_regle_TBSP}

Clic Voir Alerte
    Scroller vers le bas
    Wait Until Element Is Enabled  ${btn_voir_alerte}  10
    Click Element  ${btn_voir_alerte}

Clic Onglet CDR
    Wait Until Element Is Enabled  ${onglet_CDR}  10
    Click Element  ${onglet_CDR}

Verification colonnes CDR
     ${valeur}=  Get Element Attribute    ${titre_colonnes_CDR}   textContent
     Should Not Be Empty    ${valeur}
     log     ${valeur}
     #pour recuperer le titre des colonnes exceptes les espaces dAvant et dApres
     #${new_valeur}=  Get Substring  ${valeur}  3  -2
     #Should Be Equal  ${new_valeur}    ${colonnes_CDR}
     #log     ${new_valeur}


VERIF_Colonnes sender et receiver
    Page Should Contain Element   //*[@id="tab-1-content"]/div[2]/table/thead/tr/th[2]
    Page Should Contain Element   //*[@id="tab-1-content"]/div[2]/table/thead/tr/th[3]

Verifier la presence des colonnes SENDER et RECEIVER sur l'affichage des cdrs
    Clic sur le menu Alarms
    Clic sur le sous menu Alarms O.Money
    Clic sur une alarme
    Sleep  3
    Scroller vers le bas
    Click Button   xpath= /html/body/jhi-main/div[2]/div/div/jhi-alarm-detail/div[3]/div[2]/div/table/tbody/tr/td[7]/div/button
    Sleep  3
    VERIF_Colonnes sender et receiver

Visualisation du status des alarmes generees sur le dashboard
    Clic sur le menu dashboard
    Clic sur le filtre des scopes
    Clic sur le scope OM
    Wait Until Element Is Visible   xpath= /html/body/jhi-main/div[2]/div/div/jhi-home/div/div/div/div/div[2]/div[1]/div/div/div/div/div[2]/div[4]/div/select   10
    Sleep  2
    ${present} =  Run Keyword And Return Status   Element Should Be Visible   xpath= /html/body/jhi-main/div[2]/div/div/jhi-home/div/div/div/div/div[2]/div[2]/div/div[1]/div[1]/div/div[2]/table/tbody/tr[1]
    log  ${present}
    Sleep     2
    Run Keyword If    ${present}    Scroller vers le bas

Non affichage des alarmes SMS A2P dans la page Alarmes Simbox
    Click Element  //*[@id="filtre"]/div[1]/div[1]/angular2-multiselect/div/div[1]/div/span[1]
    Input text  //*[@id="filtre"]/div[1]/div[1]/angular2-multiselect/div/div[2]/div[3]/div[2]/input  Test SMS_A2P 3
    Click Element  //*[@id="filtre"]/div[1]/div[1]/angular2-multiselect/div/div[2]/div[3]/ul/span/li
    Sleep  2
    Click Element  ${btn_filter}
    Sleep  2
    Page Should Contain Element  xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm/div/div/div/div[3]/jhi-alarms-list/div/div/h2/span
    Sleep  2

Affichage des alarmes SM2 A2P dans la page Alarmes SMS A2P
    Click Element  //*[@id="filtre"]/div[1]/div[1]/angular2-multiselect/div/div[1]/div/span[1]
    Input text  //*[@id="filtre"]/div[1]/div[1]/angular2-multiselect/div/div[2]/div[3]/div[2]/input  Test SMS_A2P 3
    Click Element  //*[@id="filtre"]/div[1]/div[1]/angular2-multiselect/div/div[2]/div[3]/ul/span/li
    Sleep  2
    Click Element  ${btn_filter}
    Sleep  2
    Scroller vers le bas

Clic sur le sous menu Alarms SMS A2P
  Wait Until Element Is Enabled  ${sous_menu_alarmesSMSA2P}  10
  Click Element     ${sous_menu_alarmesSMSA2P}

VERIF_WORKFLOW_FROM_INV_TO_FRD
    Click Element   xpath= //*[@id="alarmsNavBarDropdown"]/span/span
    Click Element   xpath= //*[@id="orange-navbar-collapse"]/ul/li[4]/ul/li[1]/a/span/span
    Sleep   2
    Click Element    xpath= //*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[1]/div/span[1]
    Sleep  2
    #Filter sur un statut
    Input Text    xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/div[2]/input    new
    #Cocher le statut filtrer
    Click Element  xpath = //*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/ul/span/li
    Sleep  3
    #Cliquer sur le bouton filtrer
    Click Element  ${btn_filter}
    Sleep  2
    #Si le filtre donne quelques lignes cocher la premiere ligne Sinon cliquer sur le bouton reset
    ${present} =  Run Keyword And Return Status    Element Should Be Visible   xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]
    log  ${present}
    Sleep     2
    ################################ From New To INV ############################################
    Run Keyword If    ${present}      Click Element   ${first_alarme_in_the_list}
	Sleep    2
	Wait until element is visible   //*[@id="assigned-to"]
    Wait until element is visible   //*[@id="dropdownManual"]  timeout=30
    Sleep  2
    Click Element   //*[@id="dropdownManual"]
    Sleep  2
    Click Element   xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm-detail/div[1]/div[1]/div/div[1]/div[2]/ul/li/div/form/div/div[2]/span/div[2]/div[2]/span/div[1]/button/input
    Sleep  2
    #Stocker le commentaire saisi dans une variable ${comment}
	${comment}     Set Variable    DE_INV_A_FRD
	Log    ${comment}
	Input Text    name:comment    ${comment}
	Sleep    2
	#Cliquer sur le bouton Fraud
	Click Element       xpath=/html/body/ngb-modal-window/div/div/jhi-alarm-popup/form/div[3]/button[2]/span[2]/span
	Sleep    2
    Scroller vers le bas
    Click Element  ${precedent}
    Sleep  5
    #Click sur le lien Alarms Cloturees
	Click Element  xpath = //*[@id="closedAlarms"]/a/span
    Sleep    5
	#Verifions si le commentaire saisi a ete pris en compte en suvolant le statut de l alarme
	Mouse Over    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[11]/div[1]
	Sleep    3
	${VerifComment}    Get Text    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[11]/div[2]/ul/li/a/span[1]
	Log    ${VerifComment}
	Should Be Equal    '${comment}'    '${VerifComment}'
	Sleep    2
	#Revenir sur la liste des alarmes
	Click Element    xpath = //*[@id="allAlarmes"]/a/span
	Sleep    3

VERIF_WORKFLOW_FROM_INV_TO_NRD
    Click Element   xpath= //*[@id="alarmsNavBarDropdown"]/span/span
    Click Element   xpath= //*[@id="orange-navbar-collapse"]/ul/li[4]/ul/li[1]/a/span/span
    Sleep   2
    Click Element    xpath= //*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[1]/div/span[1]
    Sleep  2
    #Filter sur un statut
    Input Text    xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/div[2]/input    new
    #Cocher le statut filtrer
    Click Element  xpath = //*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/ul/span/li
    Sleep  3
    #Cliquer sur le bouton filtrer
    Click Element  ${btn_filter}
    Sleep  2
    #Si le filtre donne quelques lignes cocher la premiere ligne Sinon cliquer sur le bouton reset
    ${present} =  Run Keyword And Return Status    Element Should Be Visible   xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]
    log  ${present}
    Sleep     2
    ################################ From New To INV ############################################
    Run Keyword If    ${present}      Click Element   ${first_alarme_in_the_list}
	Sleep    2
	Wait until element is visible   //*[@id="assigned-to"]
    Wait until element is visible   //*[@id="dropdownManual"]  timeout=30
    Sleep  2
    Click Element   //*[@id="dropdownManual"]
    Sleep  2
    Click Element   xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm-detail/div[1]/div[1]/div/div[1]/div[2]/ul/li/div/form/div/div[2]/span/div[2]/div[2]/span/div[2]/button/input
    Sleep  2
    #Stocker le commentaire saisi dans une variable ${comment}
	${comment}     Set Variable    DE_INV_A_NRD
	Log    ${comment}
	Input Text    name:comment    ${comment}
	Sleep    2
	#Cliquer sur le bouton Sauvegarder
	Click Element       xpath=/html/body/ngb-modal-window/div/div/jhi-alarm-popup/form/div[3]/button[2]/span[2]/span
	Sleep    2
    Scroller vers le bas
    Click Element  ${precedent}
    Sleep  5
    #Click sur le lien Alarms Cloturees
	Click Element  xpath = //*[@id="closedAlarms"]/a/span
    Sleep    5
	#Verifions si le commentaire saisi a ete pris en compte en suvolant le statut de l alarme
	Mouse Over    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[11]/div[1]
	Sleep    3
	${VerifComment}    Get Text    xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[11]/div[2]/ul/li/a/span[1]
	Log    ${VerifComment}
	Should Be Equal    '${comment}'    '${VerifComment}'
	Sleep    2
	#Revenir sur la liste des alarmes
	Click Element    xpath = //*[@id="allAlarmes"]/a/span
	Sleep    3

WORKFLOW_DE_INV_TO_PEN
    Click Element   xpath= //*[@id="alarmsNavBarDropdown"]/span/span
    Click Element   xpath= //*[@id="orange-navbar-collapse"]/ul/li[4]/ul/li[1]/a/span/span
    Sleep   2
    Click Element    xpath= //*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[1]/div/span[1]
    Sleep  2
    #Filter sur un statut
    Input Text    xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/div[2]/input    new
    #Cocher le statut filtrer
    Click Element  xpath = //*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/ul/span/li
    Sleep  3
    #Cliquer sur le bouton filtrer
    Click Element  ${btn_filter}
    Sleep  2
    #Si le filtre donne quelques lignes cocher la premiere ligne Sinon cliquer sur le bouton reset
    ${present} =  Run Keyword And Return Status    Element Should Be Visible   xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]
    log  ${present}
    Sleep     2
    ################################ From New To INV ############################################
    Run Keyword If    ${present}      Click Element   ${first_alarme_in_the_list}
	Sleep    2
	Wait until element is visible   //*[@id="assigned-to"]
    Wait until element is visible   //*[@id="dropdownManual"]  timeout=30
    Sleep  2
    Click Element   //*[@id="dropdownManual"]
    Sleep  2
    Click Element   xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm-detail/div[1]/div[1]/div/div[1]/div[2]/ul/li/div/form/div/div[2]/span/div[2]/div[2]/span/div[3]/button/input
    Sleep  2
    #Stocker le commentaire saisi dans une variable ${comment}
	${comment}     Set Variable    DE_INV_A_PEN
	Log    ${comment}
	Input Text    name:comment    ${comment}
	Sleep    2
	#Cliquer sur le bouton Sauvegarder
	Click Element       xpath=/html/body/ngb-modal-window/div/div/jhi-alarm-popup/form/div[3]/button[2]/span[2]/span
	Sleep    2
    Scroller vers le bas
    Click Element  ${precedent}
    Sleep  3

WORKFLOW_DE_INV_TO_AVL
    Click Element   xpath= //*[@id="alarmsNavBarDropdown"]/span/span
    Click Element   xpath= //*[@id="orange-navbar-collapse"]/ul/li[4]/ul/li[1]/a/span/span
    Sleep   2
    Click Element    xpath= //*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[1]/div/span[1]
    Sleep  2
    #Filter sur un statut
    Input Text    xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/div[2]/input    new
    #Cocher le statut filtrer
    Click Element  xpath = //*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/ul/span/li
    Sleep  3
    #Cliquer sur le bouton filtrer
    Click Element  ${btn_filter}
    Sleep  2
    #Si le filtre donne quelques lignes cocher la premiere ligne Sinon cliquer sur le bouton reset
    ${present} =  Run Keyword And Return Status    Element Should Be Visible   xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]
    log  ${present}
    Sleep     2
    ################################ From New To INV ############################################
    Run Keyword If    ${present}      Click Element   ${first_alarme_in_the_list}
	Sleep    2
	Wait until element is visible   //*[@id="assigned-to"]
    Wait until element is visible   //*[@id="dropdownManual"]  timeout=30
    Sleep  2
    Click Element   //*[@id="dropdownManual"]
    Sleep  2
    Click Element   xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm-detail/div[1]/div[1]/div/div[1]/div[2]/ul/li/div/form/div/div[2]/span/div[2]/div[2]/span/div[4]/button/input
    Sleep  3
    #Stocker le commentaire saisi dans une variable
    Click Element  xpath=//*[@id="dropdownManual"]
    Sleep  3

VERIF_WORKFLOW_FROM_PEN_TO_NFR
    Click Element   xpath= //*[@id="alarmsNavBarDropdown"]/span/span
    Click Element   xpath= //*[@id="orange-navbar-collapse"]/ul/li[4]/ul/li[1]/a/span/span
    Sleep   2
    Click Element    xpath= //*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[1]/div/span[1]
    Sleep  2
    #Filter sur un statut
    Input Text    xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/div[2]/input    new
    #Cocher le statut filtrer
    Click Element  xpath = //*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/ul/span/li
    Sleep  3
    #Cliquer sur le bouton filtrer
    Click Element  ${btn_filter}
    Sleep  2
    #Si le filtre donne quelques lignes cocher la premiere ligne Sinon cliquer sur le bouton reset
    ${present} =  Run Keyword And Return Status    Element Should Be Visible   xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]
    log  ${present}
    Sleep     2
    ################################ From New To INV ############################################
    Run Keyword If    ${present}      Click Element   ${first_alarme_in_the_list}
	Sleep    2
	Wait until element is visible   //*[@id="assigned-to"]
    Wait until element is visible   //*[@id="dropdownManual"]  timeout=30
    Sleep  2
    Click Element   //*[@id="dropdownManual"]
    Sleep  2
    Click Element   xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm-detail/div[1]/div[1]/div/div[1]/div[2]/ul/li/div/form/div/div[2]/span/div[2]/div[2]/span/div[3]/button/input
    Sleep  2
    #Stocker le commentaire saisi dans une variable ${comment}
	${comment}     Set Variable    DE_INV_A_PEN
	Log    ${comment}
	Input Text    name:comment    ${comment}
	Sleep    2
	#Cliquer sur le bouton Sauvegarder
	Click Element       xpath=/html/body/ngb-modal-window/div/div/jhi-alarm-popup/form/div[3]/button[2]/span[2]/span
	Sleep    2
	Click Element   //*[@id="dropdownManual"]
    Sleep  2
    Click Element   xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm-detail/div[1]/div[1]/div/div[1]/div[2]/ul/li/div/form/div/div[2]/span/div[2]/div[2]/span/div[2]/button/input
    Sleep  2
    #Stocker le commentaire saisi dans une variable ${comment}
	${comment}     Set Variable    DE_PEN_A_NRD
	Log    ${comment}
	Input Text    name:comment    ${comment}
	Sleep    2
	#Cliquer sur le bouton Sauvegarder
	Click Element       xpath=/html/body/ngb-modal-window/div/div/jhi-alarm-popup/form/div[3]/button[2]/span[2]/span
	Sleep    2
    Scroller vers le bas
    Click Element  ${precedent}
    Sleep  3

VERIF_WORKFLOW_FROM_PEN_TO_FRD
    Click Element   xpath= //*[@id="alarmsNavBarDropdown"]/span/span
    Click Element   xpath= //*[@id="orange-navbar-collapse"]/ul/li[4]/ul/li[1]/a/span/span
    Sleep   2
    Click Element    xpath= //*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[1]/div/span[1]
    Sleep  2
    #Filter sur un statut
    Input Text    xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/div[2]/input    new
    #Cocher le statut filtrer
    Click Element  xpath = //*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/ul/span/li
    Sleep  3
    #Cliquer sur le bouton filtrer
    Click Element  ${btn_filter}
    Sleep  2
    #Si le filtre donne quelques lignes cocher la premiere ligne Sinon cliquer sur le bouton reset
    ${present} =  Run Keyword And Return Status    Element Should Be Visible   xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]
    log  ${present}
    Sleep     2
    ################################ From New To INV ############################################
    Run Keyword If    ${present}      Click Element   ${first_alarme_in_the_list}
	Sleep    2
	Wait until element is visible   //*[@id="assigned-to"]
    Wait until element is visible   //*[@id="dropdownManual"]  timeout=30
    Sleep  2
    Click Element   //*[@id="dropdownManual"]
    Sleep  2
    Click Element   xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm-detail/div[1]/div[1]/div/div[1]/div[2]/ul/li/div/form/div/div[2]/span/div[2]/div[2]/span/div[3]/button/input
    Sleep  2
    #Stocker le commentaire saisi dans une variable ${comment}
	${comment}     Set Variable    DE_INV_A_PEN
	Log    ${comment}
	Input Text    name:comment    ${comment}
	Sleep    2
	#Cliquer sur le bouton Sauvegarder
	Click Element       xpath=/html/body/ngb-modal-window/div/div/jhi-alarm-popup/form/div[3]/button[2]/span[2]/span
	Sleep    2
	Click Element   //*[@id="dropdownManual"]
    Sleep  2
    Click Element   xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm-detail/div[1]/div[1]/div/div[1]/div[2]/ul/li/div/form/div/div[2]/span/div[2]/div[2]/span/div[1]/button/input
    Sleep  2
    #Stocker le commentaire saisi dans une variable ${comment}
	${comment}     Set Variable    DE_PEN_A_FRD
	Log    ${comment}
	Input Text    name:comment    ${comment}
	Sleep    2
	#Cliquer sur le bouton Sauvegarder
	Click Element       xpath=/html/body/ngb-modal-window/div/div/jhi-alarm-popup/form/div[3]/button[2]/span[2]/span
	Sleep    2
    Scroller vers le bas
    Click Element  ${precedent}
    Sleep  3

VERIF_WORKFLOW_FROM_PEN_TO_AVL
    Click Element   xpath= //*[@id="alarmsNavBarDropdown"]/span/span
    Click Element   xpath= //*[@id="orange-navbar-collapse"]/ul/li[4]/ul/li[1]/a/span/span
    Sleep   2
    Click Element    xpath= //*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[1]/div/span[1]
    Sleep  2
    #Filter sur un statut
    Input Text    xpath=//*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/div[2]/input    new
    #Cocher le statut filtrer
    Click Element  xpath = //*[@id="filtre"]/div[1]/div[7]/angular2-multiselect/div/div[2]/div[3]/ul/span/li
    Sleep  3
    #Cliquer sur le bouton filtrer
    Click Element  ${btn_filter}
    Sleep  2
    #Si le filtre donne quelques lignes cocher la premiere ligne Sinon cliquer sur le bouton reset
    ${present} =  Run Keyword And Return Status    Element Should Be Visible   xpath = //*[@id="table-alarm"]/tbody/tr[1]/td[2]
    log  ${present}
    Sleep     2
    ################################ From New To INV ############################################
    Run Keyword If    ${present}      Click Element   ${first_alarme_in_the_list}
	Sleep    2
	Wait until element is visible   //*[@id="assigned-to"]
    Wait until element is visible   //*[@id="dropdownManual"]  timeout=30
    Sleep  2
    Click Element   //*[@id="dropdownManual"]
    Sleep  2
    Click Element   xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm-detail/div[1]/div[1]/div/div[1]/div[2]/ul/li/div/form/div/div[2]/span/div[2]/div[2]/span/div[3]/button/input
    Sleep  2
    #Stocker le commentaire saisi dans une variable ${comment}
	${comment}     Set Variable    DE_INV_A_PEN
	Log    ${comment}
	Input Text    name:comment    ${comment}
	Sleep    2
	#Cliquer sur le bouton Sauvegarder
	Click Element    xpath=/html/body/ngb-modal-window/div/div/jhi-alarm-popup/form/div[3]/button[2]/span[2]/span
	Sleep    2
	Click Element   //*[@id="dropdownManual"]
    Sleep  2
    Click Element   xpath=/html/body/jhi-main/div[2]/div/div/jhi-alarm-detail/div[1]/div[1]/div/div[1]/div[2]/ul/li/div/form/div/div[2]/span/div[2]/div[2]/span/div[4]/button/input
    Sleep  2
