from selenium import webdriver
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.support.ui import WebDriverWait # available since 2.4.0
from selenium.webdriver.support import expected_conditions as EC # available since 2.26.0
from selenium.common.exceptions import NoSuchElementException

import json


def signIn(driver):
	with open("dkCredentials.json") as data:
		credentials = json.load(data)

	try:
		signInButtonElement = driver.find_element_by_link_text("Sign-in").click()
		
		driver.implicitly_wait(10)

		userNameInput = driver.find_element_by_xpath("//input[@name='Username']")
		print "now executing JS"
		print userNameInput
		driver.execute_script('arguments[0].setAttribute("style", "visibility: visible; height: 2px; width: 1px; opacity: 1;")', userNameInput)
		#driver.execute_script("document.getElementById('parent_id').style.display='none'")
		#passwordInput = driver.find_element_by_xpath("//form[input/@name = 'Password']").send_keys(credentials["Password"])
	
		#submitCredentials = driver.find_element_by_link_text("Sign In").click()
	except NoSuchElementException:
		assert 0, "can't find input with name = Username"



driver = webdriver.Chrome()
driver.get("https://www.draftkings.com")

signIn(driver)

try:
    print driver.title

finally:
    driver.quit()