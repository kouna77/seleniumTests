*** Settings ***
Library  SeleniumLibrary
Resource  common.robot
Variables  ../PageObjects/Locators.py


*** Keywords ***
Clic sur le menu Regles
   Click Element       ${menu_regles}
   Sleep    2
   click Element   //*[@id="orange-navbar-collapse"]/ul/li[2]/ul/li[1]/a/span/span
   sleep  2

Cliquer sur une Regle
    Click Element  //*[@id="regles_tab_info"]/tbody/tr[1]
    Sleep  2

Cliquer sur Editer la Regle
    Click Button  xpath=/html/body/jhi-main/div[2]/div/div/jhi-regle-detail/div/div/div[2]/div/div/div[1]/div[2]/div[2]/button[1]
    Sleep  2

Choisir le nom de l'analyste
    Click Element  // *[@id="step2"]/div/div[2]/div/div[4]/angular2-multiselect/div/div[1]/div
    #Deselectionner
    Double Click Element  //*[@id="step2"]/div/div[2]/div/div[4]/angular2-multiselect/div/div[2]/div[3]/div[1]/label
    #Unselect From List By Label
    #Click Element   //*[@id="step2"]/div/div[2]/div/div[4]/angular2-multiselect/div/div[2]/div[3]/ul/span/li[1]/label
    Click Element   //*[@id="step2"]/div/div[2]/div/div[4]/angular2-multiselect/div/div[2]/div[3]/ul/span/li[2]/label
    Scroller vers le bas
    Click Element  //*[@id="step2"]/div/div[1]
    Sleep  2

Cliquer a nouveau sur la Regle
    Wait Until Element Is Visible  //*[@id="regles_tab_info"]/tbody/tr[1]    timeout=30
    Click Element    //*[@id="regles_tab_info"]/tbody/tr[1]
    Sleep  3

Verifier si la regle est assigne a l'analyste choisi
     ${attributionUser}    Get Text   xpath=/html/body/jhi-main/div[2]/div/div/jhi-regle-detail/div/div/div[2]/div/div/div[1]/div[2]/div[1]/table/tbody/tr[4]/td/span
     Log    ${attributionUser}
     Run Keyword If  '${ENVIRONMENT}' == 'rec'  Should Be Equal    MBOUP Elhadji Modou    ${attributionUser}   ELSE  Should Be Equal    SOW Amadou Moustapha    ${attributionUser}
Verfication du bouton Creer une nouvelle regle
    Page Should Contain Element       ${btn_create_new_regle}

Verification des filtres regles
    Wait until element is visible       ${flt_nom_regle}       timeout=60
    #Page Should Contain Element        ${flt_nom_regle}
    Page Should Contain Element     ${flt_descprition_regle}
    Page Should Contain Element     ${flt_severite_regle}
    Page Should Contain Element     ${flt_date_modif_regle}
    Page Should Contain Element     ${flt_scope_regle}
    Page Should Contain Element     ${flt_statut_regle}

#kouna
Clic_sur_une_regle
    Wait Until Element Is Visible  //*[@id="regles_tab_info"]/tbody/tr[1]    timeout=30
    Click Element    //*[@id="regles_tab_info"]/tbody/tr[1]
#kouna
Clic_sur_editer_une_regle
   Click Element  xpath=/html/body/jhi-main/div[2]/div/div/jhi-regle-detail/div/div/div[2]/div/div/div[1]/div[2]/div[2]/button[1]
   Sleep  2
#kouna
Verification_ajout_nouvel_operateur
    Clic sur le menu Regles
    Clic_sur_une_regle
    Scroller vers le bas
    Clic_sur_editer_une_regle
    Scroller vers le bas
    #Cliquer sur le bouton suivant
    Click Element   //*[@id="form-add-rule"]/div/div[2]/button[2]/span/span
    #Cliquer sur ajouter une action system
    Click Element   //*[@id="step2"]/div/div[2]/div/div[1]/div[2]/a/mat-icon
    Sleep  2
    Click Element   xpath=/html/body/ngb-modal-window/div/div/jhi-system-action-dialog/form/div[2]/div/div/div[1]/div/select
    ${verifAction}   Get Text    xpath=/html/body/ngb-modal-window/div/div/jhi-system-action-dialog/form/div[2]/div/div/div[1]/div/select/option[5]
    Log   ${verifAction}
    @{ListAction}    Get List Items  xpath=/html/body/ngb-modal-window/div/div/jhi-system-action-dialog/form/div[2]/div/div/div[1]/div/select
    FOR   ${Item}    IN   @{ListAction}
     Run Keyword If  '${Item}' == 'PROMOBILE'   Should Be Equal  ${verifAction}   ${Item}
    END



Verification des colonnes
    Page Should Contain Element     ${col_nom_regle}
    Page Should Contain Element     ${col_description_regle}
    Page Should Contain Element     ${col_severite_regle}
    Page Should Contain Element     ${col_frequence_regle}
    Page Should Contain Element     ${col_date_creation_regle}
    Page Should Contain Element     ${col_date_modif}
    Page Should Contain Element     ${col_scope_regle}
    Page Should Contain Element     ${col_statut_regle}

Verification des boutons Activer et Desactiver
    Page Should Contain Element     ${btn_activer_desactiver}
    Sleep   2

Clic sur le bouton Creer une nouvelle regle
    Wait Until Element Is Enabled   ${btn_create_new_regle}       timeout=60
    Click Element       ${btn_create_new_regle}
    sleep  2

Remplissage du formulaire de creation de regle
    Input Text    ${txt_name}   RegleDATA
    ${name}  Get Text    ${txt_name}    #xpath=//*[@id="name"]
    Log    ${name}
    Input Text    ${txt_name_description}    DescriptionXXX
    # choix des elements pour creer la regle
    Select From List By Label    ${txt_network}   Mobile
    Select From List By Label    ${txt_severite}    Major
    #Input Text    ${txt_window}    2
    Execute Javascript   window.scrollTo(1239,4777)
    Sleep    2
    # choix de la frequence horaire
    Click Link    link=Horaire
    sleep  2
    #Select From List By Label    id=field_window    1
    Input Text     ${txt_window}    1
    Select From List By Label    ${txt_windowSelectedType}   Jour(s)
    Select From List By Label    ${txt_scope}    Data
    Select From List By Label    ${txt_flux}   Local
    Execute Javascript   window.scrollTo(1239,4777)
    Sleep  2
    Select From List By Label    //*[@id="field_ruleType"]   HIGH_USAGE
    Select From List By Label    ${txt_monitor}   Msisdn
    Execute Javascript   window.scrollTo(1239,4777)
    Sleep    2
    Select From List By Label    ${txt_field_offreFormule}    PREPAID
    Sleep    2
    Scroller vers le bas
    #Cliquer sur le bouton suivant
    Click Element  //*[@id="form-add-rule"]/div/div[2]/button[2]/span/span
    Sleep    2
    #Cocher un analyste action
    Click Element     ${txt_analyste_action}
    Sleep    2
    Wait Until Element Contains      ${verif_regle}      ${name}            timeout=60


Renseigner informations etape 1
    Input Text    ${txt_name}   Test Regle simbox
    Input Text    ${txt_name_description}    DescriptionXXX
    Select From List By Label    ${txt_network}   Mobile
    Select From List By Label    ${txt_severite}    Major
    Scroll Element Into View  ${btn_suivant}
    Click Link    ${txt_freq_quotidien}
    Select From List By Label    ${txt_quotidien_heure}  3
    Input Text    ${txt_window}    2
    Select From List By Label    ${txt_windowSelectedType}   Jour(s)
    Scroll Element Into View     ${txt_scope}
    Select From List By Label    ${txt_scope}    Simbox (Voix et SMS)
    Select From List By Label    ${txt_flux}   Tectronix
    Select From List By Label    ${txt_operator}    ALL
    Select From List By Label    ${txt_typeRegle}   SIMBOX
    Scroll Element Into View  ${txt_field_offreFormule}

    #ajouter un nouveau filtre R1
    Select From List By Value  ${txt_filtre}   filtre ndiaye
    #Select From List By Label  ${txt_search_Filtre}  filtre ndiaye
   # Click Element  ${btn_add_filtre}
   # Sleep    2
    #Select From List By Label  ${filtre_champ_datastream}  spread
    #Select From List By Label  ${filtre_operator}  >=
    #Input Text  ${filtre_valeur}  0.95
    #Click Element  ${filtre_icone_add}
   # Select From List By Label  ${filtre_OPERATION}  AND

    #Select From List By Label  ${filtre_champ_datastream_2}  taux_sortant_duree
   # Select From List By Label  ${filtre_operator_2}  >=
   # Input Text  ${filtre_valeur_2}  0.9
   # Click Element  ${filtre_icone_add_2}
   # Select From List By Label  ${filtre_OPERATION_2}  AND

   # Select From List By Label  ${filtre_champ_datastream_3}  nombre_sortant
   # Select From List By Label  ${filtre_operator_3}  >=
   # Input Text  ${filtre_valeur_3}  15
   # Click Element  ${filtre_icone_add_3}
   # Select From List By Label  ${filtre_OPERATION_3}  AND

   # Select From List By Label  ${filtre_champ_datastream_4}  duree_sortant
   # Select From List By Label  ${filtre_operator_4}  >=
   # Input Text  ${filtre_valeur_4}  15
   # Click Element  ${filtre_icone_add_4}
   # Select From List By Label  ${filtre_OPERATION_4}  AND

   # Select From List By Label  ${filtre_champ_datastream_5}  simbox_range7
   # Select From List By Label  ${filtre_operator_5}  =
   # Input Text  ${filtre_valeur_5}  1

   # Click Element  ${btn_ajouter_filtre}
    #Input Text  ${txt_libelle_filtre}  test_malick
   # Click Element  ${btn_sauvegarder_filtre}
   #############
   # Select From List By Label  ${txt_filtre}  filtre ndiaye
   # Input Text  ${txt_search_Filtre}  test_malick

#kouna
Verifier les destinations en fonction du scope et du flux choisi
    Clic sur le menu Regles
    Clic sur le bouton Creer une nouvelle regle
    #Remplir le formulaire
    Input Text   name=name         testkouna
    Input Text   id=field_description   testkouna
    Select From List By Label    name=network      Mobile
    Select From List By Label    name=severity     Major
    Select From List By Label    name=scope        Sms
    @{flux}  Create List  Local  Roaming in   Roaming out
    FOR   ${Item}  IN   @{flux}
        Run Keyword If  '${Item}'=='${Item}'    Select From List By Label    name=datastream   ${Item}   ELSE   Continue For Loop
        Wait Until Element Is Visible   //*[@id="senstrafic"]/label/span    timeout=20
        Select From List By Label    name=typeRegle    HIGH_USAGE
        Scroll Element Into View    //*[@id="field_fonctions"]/div/div[1]/div
        Sleep  2
        Click Element  //*[@id="senstrafic"]/angular2-multiselect/div/div[1]/div
        Sleep  2
    END