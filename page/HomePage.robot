*** Settings ***
Resource            ../framework/router.robot

*** Variables ***
${homepage_button_burger-menu}                      css=#react-burger-menu-btn
${homepage_button_sidebar-logout}                   css=a#logout_sidebar_link
${homepage_button_sidebar-close}                    css=button#react-burger-cross-btn
${homepage_field_sort-item}                         css=.product_sort_container
${homepage_field_sort-item-hilo}                    css=.product_sort_container > option[value='hilo']
${homepage_field_inventory-item}                    css=.inventory_list .inventory_item:nth-of-type(1)
${homepage_field_inventoryLabel}                    xpath=(//a[@href='#']/div[@class='inventory_item_name'])[{0}]
${homepage_field_inventoryPrice}                    (//div[@class='pricebar']/div[@class='inventory_item_price'])[{0}]
${homepage_inventory_item}                          css=.inventory_item

*** Keywords ***
Verify that you are logged in to the Application
    Wait Until Element Is Visible                   ${homepage_button_burger-menu}
    Click Element                                   ${homepage_button_burger-menu}
    Page Should Contain Element                     ${homepage_button_sidebar-logout}
    Click Element                                   ${homepage_button_sidebar-close}

Sort The Products By The Highest Price
    Wait Until Element Is Visible                   ${homepage_field_sort-item}
    Click Element                                   ${homepage_field_sort-item}
    Click Element                                   ${homepage_field_sort-item-hilo}

Verify The Results To Match With Your Query
    ${count}=               Get Element Count       ${homepage_inventory_item}
    FOR     ${i}     IN RANGE       ${count}-1
        ${i}=               Evaluate    ${i} + 1
        ${price}            Get Text                ${homepage_field_inventoryPrice.format('${i}')}
        ${next_price}       Get Text                ${homepage_field_inventoryPrice.format('${i+1}')}
        ${price}=           Get Substring	        ${price}	1
        ${next_price}=      Get Substring	        ${next_price}	1
        ${price}=           Convert To Number       ${price}
        ${next_price}=      Convert To Number       ${next_price}
        Should Be True      ${price}>=${next_price}
    END
    Page Should Contain Element                     ${homepage_field_inventory-item}

Select And Open First Result
    [Arguments]             ${index}=1
    ${product_name}         Get Text                ${homepage_field_inventoryLabel.format('${index}')}
    ${product_price}        Get Text                ${homepage_field_inventoryPrice.format('${index}')}
    Set Test Variable       ${PRODUCT_NAME}         ${product_name}
    Set Test Variable       ${PRODUCT_PRICE}        ${product_price}
    Wait Until Element Is Visible                   ${homepage_field_inventoryLabel.format('${index}')}
    Click Element                                   ${homepage_field_inventoryLabel.format('${index}')}
