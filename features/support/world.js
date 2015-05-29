module.exports = function(callback) {

    if ( callback ) {

        // Get our test properties

        // Override any testproperty from command line with --[PROPERTY]=[VALUE]
        process.argv.forEach(function (arg) {
            arg = arg.match(/^--([A-Za-z]+)=(.*)/);

            // Only look for --[PROPERTY] style args, everything else can be forgotten
            if (arg == null || !arg[1]) return;

        });

        var browser = require("webdriverio").remote({
            host: 'ondemand.saucelabs.com',
            port: 80,
            user: process.env.SAUCE_USERNAME,
            key: process.env.SAUCE_ACCESS_KEY,
            desiredCapabilities: {
                browserName: process.env.browserName,
                version: process.env.version,
                platform: process.env.platform
            },
            logLevel: 'silent'
        });

        // Inject the browser into the callback, we don't need anything else
        callback(browser);
    }
};
