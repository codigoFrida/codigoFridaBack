const config = __appconfig.swagger;

module.exports = {
    definition: {
        info: {
            title: "Código Frida",
            version: "Dev",
        },
        host: config.host + ":" + config.port,
        basePath: config.basePath,
    },
    apis: [
        "./application/system/HttpResponse.js",
        "./application/resources/**/*.js"
    ]
};
