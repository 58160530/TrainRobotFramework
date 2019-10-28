*** Settings ***
Library  SeleniumLibrary
Library  String
Test Teardown  close all browsers

*** Variables ***
 ${username}    standard_user
 ${password}    secret_sauce
 ${xpath_username}    user-name
 ${xpath_password}    password
 ${btn_login}      LOGIN
 #Shopping
 ${btn_addproduct1}    //div[text()="Sauce Labs Bike Light"]/../../..//button
 ${btn_addproduct2}    //div[text()="Sauce Labs Backpack"]/../../..//button
 ${btn_addproduct3}    //div[text()="Sauce Labs Fleece Jacket"]/../../..//button
 ${shoppingcart}      //div[@id="shopping_cart_container"]
 ${btn_checkout}      //a[@class="btn_action checkout_button"]
 ${xpath_checkcart}    //span[@class="fa-layers-counter shopping_cart_badge"]
 #befor check out
 ${xpath_checkitem1}   //div[@class="item_pricebar"]/../a[@id="item_4_title_link"]
 ${xpath_checkitem2}   //a[@id="item_1_title_link"]
 ${xpath_checkitem3}   //a[@id="item_0_title_link"]

 ${item1}              Sauce Labs Backpack
 ${item2}              Sauce Labs Bolt T-Shirt
 ${item3}              Sauce Labs Bike Light


#Checkout: Your Information page
 ${xpath_firstname}    first-name
 ${xpath_lastname}     last-name
 ${xpath_zipcode}      postal-code
 ${firstname}          Panida
 ${Lastname}           Onprasert
 ${zipcode}            09110


 ${xpath_total}    //div[@class="summary_subtotal_label"]
 ${xpath_tax}      //div[@class="summary_tax_label"]


*** Test Cases ***
TC011 Login Page
   Open Browser     https://www.saucedemo.com    chrome
   input text        ${xpath_username}    ${username}
   input text         ${xpath_password}   ${password}
   Click button      ${btn_login}


   Click Element       ${btn_addproduct1}
    Click Element      ${btn_addproduct2}
    Click Element       ${btn_addproduct3}

    ${result}=  get text    ${xpath_checkcart}
    should be equal as strings  ${result}    3
    Click Element     ${shoppingcart}

#checkout

    ${result}=  get text   ${xpath_checkitem1}
    should be equal as strings  ${result}      ${item1}
#    ${result}=  get text   ${xpath_checkitem2}
#    should be equal as strings  ${result}      ${item2}
     ${result}=  get text   ${xpath_checkitem3}
    should be equal as strings  ${result}      ${item3}
    Click Element      ${btn_checkout}
#Checkout: Your Information page
    input text       ${xpath_firstname}     ${firstname}
    input text        ${xpath_lastname}      ${Lastname}
    input text         ${xpath_zipcode}        ${zipcode}
    Click Element    //input[@class="btn_primary cart_button"]
#Check Sum Price and Tax



















*** Keywords ***

