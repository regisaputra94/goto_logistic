*** Settings ***
Resource                        ../framework/router.robot

Test Timeout                    ${DEFAULT_TEST_TIMEOUT}
Test Setup                      base.Start Testing        ${URL}
Test Teardown                   base.End Testing

*** Variables ***
${URL}                          ${HOST}
${search_text}                  The

*** Test Cases ***
Automation Test For GoTo Logistic
    [Documentation]     Test case for take home test goto Logistic
    [Tags]              Regression     Smoke
    Login With Credentials
    Verify That You Are Logged in To The Application
    Sort The Products By The Highest Price
    Verify The Results To Match With Your Query
    Select And Open First Result
    Verify The Details (Product Name & Price)
    Buy The Product
    Verify and enter the required details on Checkout Page
    Verify the order status and capture the screen