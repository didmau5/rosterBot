from selenium import webdriver
from selenium.common.exceptions import TimeoutException
from selenium.common.exceptions import NoSuchElementException

import json
import urllib2

class DK_ChromeWebDriver:

    driver = webdriver.Chrome()
    url = "https://www.draftkings.com"
    salaries = ""

    def __init__(self):
        self.driver.get(self.url)

    def get_url(self):
        return self.url

    def set_url(self,value):
        self.url = value

    def get_salaries(self):
        return self.salaries

    def set_salaries(self,value):
        self.salaries = value

    # iterates through list of html elements and returns the first displayed one found
    @staticmethod
    def get_displayed_input(self,inputElements):
        for i in inputElements:
            # print i.is_displayed()
            if i.is_displayed():
                return i
        return None

    # finds the displayed input at xpath and sends keys to value
    def find_displayed_send_keys(self, xpath, sendValue):
        inputList = self.driver.find_elements_by_xpath(xpath)
        self.get_displayed_input(inputList).send_keys(sendValue)

    # finds the displayed input at xpath and clicks link
    def find_displayed_click(self, xpath):
        buttonInput = self.driver.find_elements_by_xpath(xpath)
        self.get_displayed_input(buttonInput).click()

    def sign_in(self):
        with open("dkCredentials.json") as data:
            credentials = json.load(data)

        try:
            # click sign in popup menu
            self.driver.find_element_by_link_text("Sign-in").click()
            # enter username
            self.find_displayed_send_keys("(//*[@name='Username'])", credentials["Username"])
            # enter password
            self.find_displayed_send_keys("(//*[@name='Password'])", credentials["Password"])
            # click sign in
            self.find_displayed_click("(//*[@data-signin-submit='1'])")
            self.driver.implicitly_wait(10)

        except NoSuchElementException:
            print "can't find displayed element on sign in"

    # retrieve salary data from DK
    def set_daily_salary(self):
        try:
            self.find_displayed_click("//*[@href='/lineup/#create-lineup']")
            self.driver.implicitly_wait(10)
            self.find_displayed_click("//*[@class='choose-sport']/p/label[text()='MLB']")
            # click first in list which *should* have All Day games
            self.driver.find_elements_by_xpath(" //*[@class='choose-start-date']/p/label/input")[0].click()
            self.driver.find_element_by_xpath("//*[@class='buttons controls']/a[@class='btn go continue']").click()
            self.driver.implicitly_wait(10)
            link = self.driver.find_element_by_xpath("//a[@class='export-to-csv']").get_attribute("href")
            response = urllib2.urlopen(link)
            self.salaries = response.read()

        except NoSuchElementException:
            print "can't find displayed element on salary data retrieval"

    def quit(self):
        self.driver.quit()