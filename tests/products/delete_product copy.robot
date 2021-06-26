*** Settings ***
Documentation       Pixel API DELETE / products

Resource        ../../resources/services.robot

*** Test Cases ***
Get Unique Produc
    ${token}=       Get Auth Token      papito@ninjapixel.com       pwd123
    ${payload}=     Get Json            get_unique.json 
    ${product}=     Post Product        ${payload}      ${token}

    ${id}=          Convert To String   ${product.json()['id']}
    ${resp}=        Get Product         ${id}   ${token}

    Status Should Be    200     ${resp}

    Should Be Equal     ${resp.json()['title']}     ${payload['title']}

Product Not found

    ${token}=       Get Auth Token      papito@ninjapixel.com       pwd123
    ${resp}=        Get Product         9999   ${token}

    Status Should Be    404     ${resp}
