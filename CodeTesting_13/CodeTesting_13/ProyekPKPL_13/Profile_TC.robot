*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL_LOGIN}        http://127.0.0.1:8000/profile
${BROWSER}          Edge
${EMAIL}            risnasiringoringo@gmail.com
${PASSWORD}         risnas280304
${NAME}             cesyaa
${EMAIL}            cesya@.com


*** Test Cases ***
AdminLogin
    [Documentation]  Test untuk login ke aplikasi sebagai teacher
    Open Browser    ${URL_LOGIN}    ${BROWSER}
    Set Selenium Implicit Wait    20
    Input Text    id=email    ${EMAIL}
    Input Password    id=password    ${PASSWORD}
    Click Button    //*[@id="contactForm"]/div[3]/button
    # Capture Screenshot after login
    Capture Page Screenshot
    Log    "Teacher login completed. Proceed to add category."

AddCategoryWithUniqueName
    # Click the button to add a new category
    Click Element  id=name
    Sleep  5
    # Input the new email
    Input Text    id=name  ${NAME}

    # Click the button to add a new category
    Click Element  id=email
    Sleep  5
    # Input the new email
    Input Text    id=email  ${EMAIL}
    # Submit the new category
    Click Element     xpath=//button[@type='submit']
    Sleep  5


Close Browser Manually
    [Documentation]  Menutup browser secara manual
    Close Browser
