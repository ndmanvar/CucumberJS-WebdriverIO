cucumber-js --format=json features/ | node_modules/cucumber-junit/bin/cucumber-junit > output_junit.xml


browserName=chrome version=31 platform=XP name=something ./node_modules/.bin/parallel-cucumber-js -w 4 features/


browserName=chrome version=31 platform=XP name=something ./node_modules/.bin/parallel-cucumber-js -w 4 features/ -f json | ./node_modules/.bin/cucumber-junit > output_JUnit.xml