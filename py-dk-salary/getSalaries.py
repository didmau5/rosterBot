from selenium import webdriver
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.support.ui import WebDriverWait  # available since 2.4.0
from selenium.webdriver.support import expected_conditions as EC  # available since 2.26.0
from selenium.common.exceptions import NoSuchElementException

import json
import urllib2

# iterates through list of html elements and returns the first displayed one found
def get_displayed_input(inputElements):
    for i in inputElements:
        #print i.is_displayed()
        if i.is_displayed():
            return i
    return None

# finds the displayed input at xpath and sends keys to value
def find_displayed_send_keys(driver, xpath, sendValue):
    inputList = driver.find_elements_by_xpath(xpath)
    get_displayed_input(inputList).send_keys(sendValue)

# finds the displayed input at xpath and clicks link
def find_displayed_click(driver, xpath):
    buttonInput = driver.find_elements_by_xpath(xpath)
    get_displayed_input(buttonInput).click()

# sign into DK
def sign_in(driver):
    with open("dkCredentials.json") as data:
        credentials = json.load(data)

    try:
        #click sign in popup menu
        driver.find_element_by_link_text("Sign-in").click()
        #enter username
        find_displayed_send_keys(driver, "(//*[@name='Username'])", credentials["Username"])
        #enter password
        find_displayed_send_keys(driver, "(//*[@name='Password'])",credentials["Password"])
        #click sign in
        find_displayed_click(driver, "(//*[@data-signin-submit='1'])")

    except NoSuchElementException:
        print "can't find displayed element on sign in"

# retrieve salary data from DK
def getDailySalaryData(driver):

    try:
        find_displayed_click(driver, "//*[@href='/lineup/#create-lineup']")
        driver.implicitly_wait(10)
        find_displayed_click(driver, "//*[@class='choose-sport']/p/label[text()='MLB']")
        #click first in list which *should* have All Day games
        driver.find_elements_by_xpath(" //*[@class='choose-start-date']/p/label/input")[0].click()
        driver.find_element_by_xpath("//*[@class='buttons controls']/a[@class='btn go continue']").click()
        driver.implicitly_wait(10)
        link = driver.find_element_by_xpath("//a[@class='export-to-csv']").get_attribute("href")
        response = urllib2.urlopen(link)
        return response.read()

    except NoSuchElementException:
        print "can't find displayed element on salary data retrieval"


def main():

    driver = webdriver.Chrome()
    driver.get("https://www.draftkings.com")

    try:
        print driver.title
        sign_in(driver)
        # loading current location (WebDriverWait instead?)
        driver.implicitly_wait(10)
        csv_salaries = getDailySalaryData(driver)

        print csv_salaries

    finally:
        driver.quit()


if __name__ == "__main__":
    main()
