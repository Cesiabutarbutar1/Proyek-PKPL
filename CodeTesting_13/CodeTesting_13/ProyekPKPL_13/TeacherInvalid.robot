*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL_LOGIN}        http://127.0.0.1:8000/admin/teachers/create
${BROWSER}          Edge
${EMAIL}            dsiahaan581@gmail.com
${PASSWORD}         Tuhanberkati@11
${EMAILL}           cesyaaa@gmail.com


*** Test Cases ***
AdminLogin
    [Documentation]  Test untuk login ke aplikasi sebagai admin
    Open Browser    ${URL_LOGIN}    ${BROWSER}
    Set Selenium Implicit Wait    20
    Input Text    id=email    ${EMAIL}
    Input Password    id=password    ${PASSWORD}
    Click Button    //*[@id="contactForm"]/div[3]/button
    # Capture Screenshot after login
    Capture Page Screenshot
    Log    "Admin login completed. Proceed to add category."

AddCategoryWithUniqueName
    # Click the button to add a new category
    Click Element  id=email
    Sleep  5
    # Input the new email
    Input Text    id=email  ${EMAILL}
    # Submit the new category
    Click Element    //button[@type='submit']
    Sleep  5

  # Check for error message
    ${error_message}=  Get Text  /html/body/div/main/div/div/div/div[2]
    Should Contain  ${error_message} Data Tidak Ditemukan
    Close Browser

Close Browser Manually
    [Documentation]  Menutup browser secara manual
    Close Browser
