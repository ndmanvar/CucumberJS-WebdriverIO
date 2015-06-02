(browserName='internet explorer' version=10 platform='Windows 7' ./node_modules/.bin/parallel-cucumber-js features -f json -w 8 | ./node_modules/.bin/cucumber-junit > output_JUnit_ie10.xml) &
(browserName=chrome version=43 platform='Windows 7' ./node_modules/.bin/parallel-cucumber-js features -f json -w 8 | ./node_modules/.bin/cucumber-junit > output_JUnit_chrome.xml) &
browserName=firefox version=37 platform='Windows 7'
 ./node_modules/.bin/parallel-cucumber-js features -f json -w 8 | ./node_modules/.bin/cucumber-junit > output_JUnit_firefox.xml
