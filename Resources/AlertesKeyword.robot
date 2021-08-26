*** Settings ***
Library  SeleniumLibrary
Variables  ../PageObjects/Locators.py
Resource     common.robot

*** Keywords ***
Clic sur le menu Alertes
    Click Element       ${clic_menu_alertes}
    Sleep    2

Verifier les colonnes des alertes
    Page Should Contain Element     ${col_cle}
    Page Should Contain Element     ${col_nomAlerte}
    Page Should Contain Element     ${col_reseau}
    Page Should Contain Element     ${col_dateCreation}
    Page Should Contain Element     ${col_typeAggregation}
    Page Should Contain Element     ${col_valeurAggregation}
    Page Should Contain Element     ${col_regle}

Clic sur une alerte
    Wait Until Element Is Enabled   ${ligne_table_alerte}   10
    Click Element       ${ligne_table_alerte}
    sleep   3

Clic sur le filtre fluxes
   Wait Until Element Is Visible  //*[@id="filtre"]/div/div[2]/angular2-multiselect/div/div[1]/div  10
   Click Element   //*[@id="filtre"]/div/div[2]/angular2-multiselect/div/div[1]/div
   Sleep  3

Clic sur le checkbox OM Transactions
    Click Element   //*[@id="filtre"]/div/div[2]/angular2-multiselect/div/div[2]/div[3]/ul/span/li[4]/span/label

Recherche de Alert_
    #Wait Until Element Is Visible     xpath=/html/body/jhi-main/div[2]/div/div/jhi-alerte-detail/div/div/div[1]/div/div/div[1]/h1      timeout=60
    Page Should Contain Element    xpath=/html/body/jhi-main/div[2]/div/div/jhi-alerte-detail/div/div/div[1]/div/div/div[1]/h1

Verifier la presence des colonnes sur le compteur balance par liste de compteur
    Page Should Contain Element  //*[@id="tab-4-content"]/div[1]/table/thead/tr/th[1]/span/span
    Page Should Contain Element  //*[@id="tab-4-content"]/div[1]/table/thead/tr/th[2]/span/span
    Page Should Contain Element  //*[@id="tab-4-content"]/div[1]/table/thead/tr/th[3]/span/span

Verifier la presence des donnees renseignees sur le compteur balance
    Page Should Contain Element   //*[@id="tab-4-content"]/div[1]/table/tbody/tr[1]/td[1]
    Page Should Contain Element    //*[@id="tab-4-content"]/div[1]/table/tbody/tr[1]/td[2]
    Page Should Contain Element   //*[@id="tab-4-content"]/div[1]/table/tbody/tr[1]/td[3]
    Page Should Contain Element   //*[@id="tab-4-content"]/div[1]/table/tbody/tr[2]/td[1]
    Page Should Contain Element   //*[@id="tab-4-content"]/div[1]/table/tbody/tr[2]/td[2]
    Page Should Contain Element   //*[@id="tab-4-content"]/div[1]/table/tbody/tr[2]/td[3]
    Page Should Contain Element   //*[@id="tab-4-content"]/div[1]/table/tbody/tr[3]/td[1]
    Page Should Contain Element   //*[@id="tab-4-content"]/div[1]/table/tbody/tr[3]/td[2]
    Page Should Contain Element   //*[@id="tab-4-content"]/div[1]/table/tbody/tr[3]/td[3]

Verifier les donnees renseignees sur le compteur balance par liste de compteur
    Clic sur le menu Alertes
    Sleep  2
    Click Element  xpath=//*[@id="filtre"]/div/div[2]/angular2-multiselect/div/div[1]/div
    Sleep  2
    Input text  //*[@id="filtre"]/div/div[2]/angular2-multiselect/div/div[2]/div[3]/div[2]/input  Transactions
    Sleep  2
    Click Element  xpath=//*[@id="filtre"]/div/div[2]/angular2-multiselect/div/div[2]/div[3]/ul/span/li
    Sleep  2
    Click Element  ${btn_filter}
    Sleep  2
    Clic sur une alerte
    Sleep  4
    Click Element   xpath = //*[@id="tab-4-content-trigger"]
    Verifier la presence des colonnes sur le compteur balance par liste de compteur
    Verifier la presence des donnees renseignees sur le compteur balance

Filtrer les alertes par scope
    Clic sur le menu Alertes
    Clic sur le filtre fluxes
    Clic sur le checkbox OM Transactions
    Sleep  2
    Click Element   //*[@id="filtre"]/div/div[2]/angular2-multiselect/div/div[1]/div
    Click Element     ${btn_filter}
    Sleep  2
    ${present} =  Run Keyword And Return Status   Element Should Be Visible  xpath = //*[@id="table-alarm"]/tbody/tr[1]
    log  ${present}
    Sleep  2
    Run Keyword If   ${present}    Click Element   xpath = //*[@id="table-alarm"]/tbody/tr[1]
    Scroller vers le bas

Exporter les colonnes des cdrs dune alerte des detections de cas arnaque
    Clic sur le menu Alertes
    Click Element  //*[@id="filtre"]/div/div[5]/angular2-multiselect/div/div[1]/div
    Input text  //*[@id="filtre"]/div/div[5]/angular2-multiselect/div/div[2]/div[3]/div[2]/input   test arnaque
    Click Element  //*[@id="filtre"]/div/div[5]/angular2-multiselect/div/div[2]/div[3]/ul/span/li
    Sleep  2
    Click Element  ${btn_filter}
    Sleep  2
    Clic sur une alerte


