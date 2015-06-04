RUN_CUCUMBER_TESTS=./node_modules/.bin/parallel-cucumber-js features -f json -w 10

# Run all tests in parallel
run_tests:
	make -j test_win7_chrome_43 test_winXP_chrome_41 test_win7_ie_10 test_win8_1_ie_11 test_win7_firefox_37

test_win7_chrome_43:
	browserName='chrome' version=43 platform='Windows 7' name=Win7ChromeTests \
		$(RUN_CUCUMBER_TESTS) > Win7ChromeTests.txt
	cat Win7ChromeTests.txt | ./node_modules/.bin/cucumber-junit > Win7ChromeTests.xml

test_winXP_chrome_41:
	browserName='chrome' version=41 platform=XP name=XPChromeTests \
		$(RUN_CUCUMBER_TESTS) > XPChromeTests.txt
	cat XPChromeTests.txt | ./node_modules/.bin/cucumber-junit > XPChromeTests.xml

test_win7_ie_10:
	browserName='internet explorer' version=10 platform='Windows 7' name=Win7IE10Tests \
		$(RUN_CUCUMBER_TESTS) > Win7IE10Tests.txt
	cat Win7IE10Tests.txt | ./node_modules/.bin/cucumber-junit > Win7IE10Tests.xml

test_win8_1_ie_11:
	browserName='internet explorer' version=11 platform='Windows 8.1' name=Win81IE11Tests \
		$(RUN_CUCUMBER_TESTS) > Win81IE11Tests.txt
	cat Win81IE11Tests.txt | ./node_modules/.bin/cucumber-junit > Win7IE11Tests.xml


test_win7_firefox_37:
	browserName='firefox' version=37 platform='Windows 7' name=Win7FirefoxTests \
		$(RUN_CUCUMBER_TESTS) > Win7FirefoxTests.txt
	cat Win7FirefoxTests.txt | ./node_modules/.bin/cucumber-junit > Win7FirefoxTests.xml
