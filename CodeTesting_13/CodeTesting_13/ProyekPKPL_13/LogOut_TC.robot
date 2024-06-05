*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL_LOGIN}         http://127.0.0.1:8000/dashboard
${BROWSER}          Edge
${EMAIL}            dsiahaan581@gmail.com
${PASSWORD}         Tuhanberkati@11


*** Test Cases ***
AdminLogin
    [Documentation]  Test untuk login ke aplikasi sebagai admin
    Open Browser    ${URL_LOGIN}    ${BROWSER}
    Set Selenium Implicit Wait    20
    Input Text    id=email    ${EMAIL}
    Input Password    id=password    ${PASSWORD}
    Click Button    //*[@id="contactForm"]/div[3]/button
    Capture Page Screenshot
    Log    "Admin login completed. Proceed to update profile."
Logout
    [Documentation]  Test untuk logout dari aplikasi
    # Click the user dropdown menu to reveal the Log Out option
    Click Element    xpath=//nav//div[contains(text(), 'Daniel Siahaan')]

    # Click the Log Out option
    Click Link    xpath=//a[text()='Log Out']

    # Capture Screenshot after logout
    Capture Page Screenshot
    Log    "User logged out successfully."

Close Browser
    [Documentation]  Menutup browser secara manual
    Close Browser
