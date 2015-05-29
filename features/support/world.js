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
      browserName: "chrome",
      platform: "XP",
      name: "someNameplease"
    },
    user: process.env['cuked.user'] || process.env.SAUCE_USERNAME,
    key: process.env['cuked.key'] || process.env.SAUCE_ACCESS_KEY,
    host: 'ondemand.saucelabs.com',
    port: 80,
    logLevel: "silent"
  });

  // setup promises
  chaiAsPromised.transferPromiseness = global.client.transferPromiseness;

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

    // load cuked webdriver configuration
    // var configPath = path.resolve(process.cwd(), process.env['cuked.path'], 'cuked.js');
    // if (fs.existsSync(configPath)) {
    //   global.client = require(configPath)(this);
    // }
  });

  // Cucumber World Object
  this.World = function World(callback) {
    this.client = global.client;

    callback();

    return this;
  };
};