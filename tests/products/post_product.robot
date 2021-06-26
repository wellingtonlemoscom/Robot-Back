*** Settings ***
Documentation       Pixel API POST / products

Resource        ../../resources/services.robot

*** Test Cases ***
Create nem product
    [Tags]      success

    ${token}=       Get Auth Token      papito@ninjapixel.com       pwd123
    ${payload}=     Get Json            dk.json 
    ${resp}=        Post Product        ${payload}     ${token}

    Status Should Be    200     ${resp}

# Duplicated Product
#     [Tags]      conflict

#     #Desafio

#     ${token}=       Get Auth Token      papito@ninjapixel.com       pwd123
#     ${resp}=        Post Product        dk.json     ${token}

#     Status Should Be    409     ${resp}

Required title
    [Tags]      bad_request

    ${token}=       Get Auth Token      papito@ninjapixel.com       pwd123
    ${payload}=     Get Json            no_title.json 
    ${resp}=        Post Product        ${payload}     ${token}
    
    Status Should Be    400     ${resp}
    Should Be Equal     ${resp.json()['msg']}       Oops! title cannot be empty

    Dictionary Should Contain Value     ${resp.json()}        Oops! title cannot be empty

Required category
    [Tags]      bad_request

    ${token}=       Get Auth Token      papito@ninjapixel.com       pwd123
    ${payload}=     Get Json            no_cat.json 
    ${resp}=        Post Product        ${payload}     ${token}
    
    Status Should Be    400     ${resp}
    Should Be Equal     ${resp.json()['msg']}       Oops! category cannot be empty

Required price
    [Tags]      bad_request

    ${token}=       Get Auth Token      papito@ninjapixel.com       pwd123
    ${payload}=     Get Json            no_price.json 
    ${resp}=        Post Product        ${payload}     ${token}
    
    Status Should Be    400     ${resp}
    Should Be Equal     ${resp.json()['msg']}       Oops! price cannot be empty
