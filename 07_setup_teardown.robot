*** Settings ***
Library  SeleniumLibrary
Test Setup    Open Browser    about:blank    chrome
Test Teardown    close all browsers
Test Timeout



*** Test Cases ***
TC0701
    log    start
    log    end

TC0702
    log    start
    Sleep    5
    log    end

TC0703
    [Setup]    log    run override test setup
    [Teardown]  log    run override test teardown
     log    start
    log    end

TC0704
    log    start
    Sleep    8
    log    end



