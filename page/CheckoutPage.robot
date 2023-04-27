*** Settings ***
Resource            ../framework/router.robot

*** Variables ***
${checkoutPage_text_itemTitle}              css=.inventory_item_name
${checkoutPage_text_itemPrice}              css=.inventory_item_price
${checkoutPage_input_firstName}             css=#first-name
${checkoutPage_input_lastName}              css=#last-name
${checkoutPage_input_postalCode}            css=#postal-code
${checkoutPage_button_continue}             css=input#continue
${checkoutPage_button_finish}               css=button#finish
${checkoutPage_button_checkout}             css=button#checkout
${checkoutPage_text_completeHeader}         css=.complete-header
${checkoutPage_text_completeText}           css=.complete-text

*** Keywords ***
Verify and enter the required details on Checkout page
    Wait Until Element Is Visible           ${checkoutPage_button_checkout}
    Click Element                           ${checkoutPage_button_checkout}
    Enter The Required Details
    Verify Detail Product Checkout
    Click Button Finish

Enter The Required Details
    Element Should Be Visible                   ${checkoutPage_input_firstName}
    Input Text          ${checkoutPage_input_firstName}         Test
    Element Should Be Visible                   ${checkoutPage_input_lastName}
    Input Text          ${checkoutPage_input_lastName}          User
    Element Should Be Visible                   ${checkoutPage_input_postalCode}
    Input Text          ${checkoutPage_input_postalCode}        111111
    Wait Until Element Is Visible           ${checkoutPage_button_continue}
    Click Element                           ${checkoutPage_button_continue}

Verify Detail Product Checkout
    Page Should Contain Element                 ${checkoutPage_text_itemTitle}
    ${product_title}        Get text            ${checkoutPage_text_itemTitle}
    Should Be Equal         ${product_title}	${PRODUCT_NAME}
    Page Should Contain Element                 ${checkoutPage_text_itemPrice}
    ${product_price}        Get text            ${checkoutPage_text_itemPrice}
    Should Be Equal         ${product_price}	${PRODUCT_PRICE}

Click Button Finish
    Element Should Be Visible                   ${checkoutPage_button_finish}
    Click Element                               ${checkoutPage_button_finish}

Verify the order status and capture the screen
    Page Should Contain Element                 ${checkoutPage_text_completeHeader}
    Page Should Contain Element                 ${checkoutPage_text_completeText}
    Capture Page Screenshot