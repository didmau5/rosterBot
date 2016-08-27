from selenium import webdriver
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.support.ui import WebDriverWait  # available since 2.4.0
from selenium.webdriver.support import expected_conditions as EC  # available since 2.26.0
from selenium.common.exceptions import NoSuchElementException

import json


def get_displayed_input(inputElements):
    for i in inputElements:
        print i.is_displayed()
        if i.is_displayed():
            return i
        else:
            continue


def sign_in(driver):
    with open("dkCredentials.json") as data:
        credentials = json.load(data)

    try:
        driver.find_element_by_link_text("Sign-in").click()

        #enter username
        usernameinput = driver.find_elements_by_xpath("(//*[@name='Username'])")
        displayedusernameinput = get_displayed_input(usernameinput)
        displayedusernameinput.send_keys(credentials["Username"])

        #enter password
        passwordinput = driver.find_elements_by_xpath("(//*[@name='Password'])")
        displayedpasswordinput = get_displayed_input(passwordinput)

        displayedpasswordinput.send_keys(credentials["Password"])
        #click sign in
        signinbuttoninput = driver.find_elements_by_xpath("(//*[@data-signin-submit='1'])")
        get_displayed_input(signinbuttoninput).click()

    except NoSuchElementException:
        assert 0, "can't find displayed element on signin"


def main():
    driver = webdriver.Chrome()
    driver.get("https://www.draftkings.com")
    sign_in(driver)

    try:
        print driver.title

    finally:
        driver.quit()


if __name__ == "__main__":
    main()
