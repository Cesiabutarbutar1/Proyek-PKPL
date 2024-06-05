*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL_LOGIN}       http://127.0.0.1:8000/admin/faqs/create
${BROWSER}          Edge
${EMAIL}            dsiahaan581@gmail.com
${PASSWORD}         Tuhanberkati@11
${QUESTION}         What is Robot Framework?
${ANSWER}           Robot Framework is a generic test automation framework for acceptance testing and acceptance test-driven development (ATDD).

*** Test Cases ***
AdminLogin
 Open Browser  ${URL}  ${BROWSER}
    Set Selenium Implicit Wait  5
    Sleep  2
    Input Text  //*[@id="email"]  ${EMAIL}
    Input Text  //*[@id="password"]  ${PASSWORD}
    Click Element  //*[@id="contactForm"]/div[3]/button

    # Capture Screenshot after login
    Capture Page Screenshot
    Log    "Admin login completed. Proceed to add FAQ."

AddNewFAQ
    Add New FAQ
    # Ensure the user is logged in (AdminLogin should be called before this step if not already logged in)
    AdminLogin

    # Set Selenium Implicit Wait
    Set Selenium Implicit Wait    5

    # Navigate to the FAQ page
    Click Element    xpath=//*[@id="menu"]/li/a[@href='/faqs']
    Sleep    2

    # Click the button to add a new FAQ
    Click Element    id=addFaqButton
    Sleep    2

    # Input the question
    Input Text    id=question    ${QUESTION}

    # Input the answer
    Input Text    xpath=//div[@class='editor-class']    ${ANSWER}

    # Submit the new FAQ
    Click Element    xpath=//button[@type='submit']
    Sleep    5

    # Capture Screenshot after adding FAQ
    Capture Page Screenshot

    # Verify the new FAQ has been added
    ${faq_text}=    Get Text    xpath=//table[@id='faqTable']//td[contains(text(), '${QUESTION}')]
    Should Contain    ${faq_text}    ${QUESTION}

    # Log success message
    Log    "FAQ added with question and answer."