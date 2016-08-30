from DK_ChromeWebDriver import DK_ChromeWebDriver


def main():

    try:
        DK_driver = DK_ChromeWebDriver()
        DK_driver.sign_in()
        DK_driver.set_daily_salary()
    finally:
        print DK_driver.salaries
        DK_driver.quit()

if __name__ == "__main__":
    main()
