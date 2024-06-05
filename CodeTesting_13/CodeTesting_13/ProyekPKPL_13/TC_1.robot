*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  http://localhost:8000/login
${BROWSER}  edge
${EMAIL}  dsiahaan581@gmail.com
${PASSWORD}  Tuhanberkati@11

*** Test Cases ***
LoginTest
    [Documentation]  Test untuk login ke aplikasi dengan menggunakan email dan password yang valid
    Open Browser  ${URL}  ${BROWSER}
    Set Selenium Implicit Wait  5
    Sleep  2
    Input Text  //*[@id="email"]  ${EMAIL}
    Input Text  //*[@id="password"]  ${PASSWORD}
    Click Element  //*[@id="contactForm"]/div[3]/button
    Sleep  10
    Close Browser
