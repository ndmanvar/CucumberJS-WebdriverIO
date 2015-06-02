RUN_CUCUMBER_TESTS=./node_modules/.bin/parallel-cucumber-js features -f json -w 8

run_tests:
	make -j test_chrome_ga test_ie10 test_firefox_ga

test_chrome_ga:
	browserName='chrome' version=43 platform='Windows 7' $(RUN_CUCUMBER_TESTS) > output_JUnit_chrome.txt
	cat output_JUnit_chrome.txt | ./node_modules/.bin/cucumber-junit > output_JUnit_chrome.xml

test_ie10:
	browserName='internet explorer' version=10 platform='Windows 7' $(RUN_CUCUMBER_TESTS) > output_JUnit_ie10.txt
	cat output_JUnit_ie10.txt | ./node_modules/.bin/cucumber-junit > output_JUnit_ie10.xml

test_firefox_ga:
	browserName='firefox' version=37 platform='Windows 7' $(RUN_CUCUMBER_TESTS) > output_JUnit_firefox.txt
	cat output_JUnit_firefox.txt | ./node_modules/.bin/cucumber-junit > output_JUnit_firefox.xml
