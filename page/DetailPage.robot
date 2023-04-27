*** Settings ***
Resource            ../framework/router.robot

*** Variables ***
${detailPage_text_itemTitle}            xpath=//div[@class='inventory_details_name large_size']
${detailPage_text_itemPrice}            css=.inventory_details_price
${detailPage_button_addToCart}          css=button#add-to-cart-sauce-labs-fleece-jacket
${detailPage_button_cartLink}           css=.shopping_cart_link

*** Keywords ***
Verify The Details (Product Name & Price)
    Page Should Contain Element                 ${detailPage_text_itemTitle}
    ${product_title}        Get text            ${detailPage_text_itemTitle}
    Should Be Equal         ${product_title}	${PRODUCT_NAME}
    Page Should Contain Element                 ${detailPage_text_itemPrice}
    ${product_price}        Get text            ${detailPage_text_itemPrice}
    Should Be Equal         ${product_price}	${PRODUCT_PRICE}

Buy The Product
    [Documentation]         Add item to cart
    Wait Until Element Is Visible                ${detailPage_button_addToCart}
    Click Element                               ${detailPage_button_addToCart}
    Direct To Checkout Page

Direct To Checkout Page
    Element Should Be Visible                   ${detailPage_button_cartLink}
    Click Element                               ${detailPage_button_cartLink}
