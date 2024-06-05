*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL_LOGIN}        http://127.0.0.1:8000/login
${BROWSER}          Edge

* Test Cases *
AdminLogin
    Open Browser    ${URL_LOGIN}    ${BROWSER}
    Set Selenium Implicit Wait    60
    Input Text    id=email    dsiahaan581@gmail.com
    Input Password    id=password    Tuhanberkati@11
    Click Button    xpath=//button[@type='submit']
    # Capture Screenshot after login
    Capture Page Screenshot
    Log    "Admin login completed. Proceed to add category."

# Test Case untuk menambahkan kategori dengan nama yang unik
AddCategoryWithUniqueName
    Set Selenium Implicit Wait    60
    Input Text    id=category_name    JavaScript
    Click Button    xpath=//button[@type='submit']
    Capture Page Screenshot
    Log    "Category added with a unique name."

Close Browser Manually
    Manual Close Browser

* Keywords *
Manual Close Browser
    Close Browser