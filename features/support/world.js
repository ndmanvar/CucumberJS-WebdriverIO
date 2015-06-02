/*!
 * Cuked World
 */

var wd = require('webdriverio'),
    fs = require('fs'),
    chai = require('chai'),
    path = require('path'),
    chaiAsPromised = require('chai-as-promised'),
    SauceLabs = require('saucelabs');

// setup assertions
chai.use(chaiAsPromised);
chai.should();

module.exports = function() {
  global.client = wd.remote({
    desiredCapabilities: {
      browserName: process.env.browserName,
      platform: process.env.platform,
      name: process.env.name
    },
    user: process.env['cuked.user'] || process.env.SAUCE_USERNAME,
    key: process.env['cuked.key'] || process.env.SAUCE_ACCESS_KEY,
    host: 'ondemand.saucelabs.com',
    port: 80,
    logLevel: "silent"
  });

  // setup promises
  chaiAsPromised.transferPromiseness = global.client.transferPromiseness;


  // Cucumber World Object
  this.World = function World(callback) {
      // initiliaze webdriver session
      global.client.init(function() {
        var sessionID = this.requestHandler.sessionID;

        // global timeout
        this.timeoutsAsyncScript(10000);

        // helper method for sending test results to SauceLabs
        global.client.addCommand('sauceJobStatus', function(status, done) {
          var sauceAccount = new SauceLabs({
            username: process.env['cuked.user'] || process.env.SAUCE_USERNAME,
            password: process.env['cuked.key'] || process.env.SAUCE_ACCESS_KEY
          });

          sauceAccount.updateJob(sessionID, status, done);
        });

      });
    this.client = global.client;

    callback();

    return this;
  };
};