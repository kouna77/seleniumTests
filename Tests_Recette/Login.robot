*** Settings ***

Resource   ../Resources/common.robot

*** Test Cases ***
000_Authentification
    [Tags]   TA_000
    [Documentation]   Acceder  a l application Radar
    Authentification
    Sleep    1
    [Teardown]  End Session