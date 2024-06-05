*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}            http://localhost:8000/login
${BROWSER}        edge
${INVALID_EMAIL}  risna@gmail.com
${PASSWORD}       Tuhanberkati@11

*** Test Cases ***
LoginWithInvalidEmailTest
    [Documentation]  Test untuk login ke aplikasi dengan menggunakan email yang salah
    Open Browser  ${URL}  ${BROWSER}
    Set Selenium Implicit Wait  5
    Input Text  id=email  ${INVALID_EMAIL}
    Input Text  id=password  ${PASSWORD}
    Click Element  //*[@id="contactForm"]/div[3]/button
    Sleep  5
    # Check for error message
    ${error_message}=  Get Text  //*[@id="contactForm"]/div[1]/span
    Should Contain  ${error_message}  Invalid email or password
    Close Browser
