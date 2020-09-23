import os
from time import sleep

from appium import webdriver


def before_all(context):
    # context.config.setup_logging()
    pass

def before_feature(context, feature):
    if 'android' in feature.tags:
        app = os.path.join(os.path.dirname(__file__),
                           '../apps/Imdb/android',
                           'com.imdb.mobile.apk')
        app = os.path.abspath(app)
        context.driver = webdriver.Remote(
            command_executor='http://127.0.0.1:4723/wd/hub',
            desired_capabilities={
                'app' : app,
                'platformName' : 'Android',
                # 'platformVersion' : '4.4',
                'deviceName' : "emulator-5554",
                # 'udid' : '01a135891395669f',
                'appActivity' : '.HomeActivity',
                'appPackage' : 'com.imdb.mobile'
            }
        )
def after_feature(context, feature):
    sleep(1)
    context.driver.save_screenshot("features/reports/screen_final.png")
    context.driver.quit()