*** Settings ***
Library  SeleniumLibrary
Variables  ../PageObjects/Locators.py
Variables    ../PageObjects/Variables.py
Resource  LoginKeyword.robot

*** Variables ***

@{_tmp}
    ...  browserName: ${browserName},
    ...  platform: ${platform},
    ...  version: ${version},
    ...  username: kouna,
    ...  accessKey: 6f718376-d013-4617-802c-f78d020ca2cb,
    ...  tunnelIdentifier: kouna_lch_tunnel_id,
    ...  build: Python-Robot-Selenium-VDC,
    ...  name: ${SUITE_NAME}

${browser}          ${browserName}
${capabilities}     ${EMPTY.join(${_tmp})}
${remote_url}       https://kouna:6f718376-d013-4617-802c-f78d020ca2cb@ondemand.eu-central-1.saucelabs.com:443/wd/hub

${ENVIRONMENT}  %{ENVIRONMENT}
&{UrlRadar}  dev=http://dev-radar.orange-sonatel.com:8080  rec=http://rec-radar.orange-sonatel.com:8080
&{Url_Preprod}  preprod=https://10.137.18.144/#/

*** Keywords ***

Fermeture navigateur
   close all browsers

Ouvrir le navigateur
   [Arguments]    ${UrlRadar}
   Run Keyword If  '${ENVIRONMENT}' == 'rec'    open browser   ${UrlRadar.${ENVIRONMENT}}  browser=${browserName}
    ...  remote_url=${remote_url}
    ...  desired_capabilities=${capabilities}
    ...  ELSE  open browser   ${Url_Preprod.${ENVIRONMENT}}   browser=${browserName}
    ...  remote_url=${remote_url}
    ...  desired_capabilities=${capabilities}
   Maximize Browser Window

End Session
    Run Keyword If  '${TEST_STATUS}'== 'PASS'  Execute Javascript  sauce:job-result=passed
    ...  ELSE  execute javascript  sauce:job-result=failed
    Execute Javascript  sauce:job-name=${TEST NAME}
    close browser

Scroller vers le bas
    Execute Javascript   window.scrollTo(1239,4777)
    sleep  2
    Execute Javascript   window.scrollTo(1239,4777)
    sleep  2