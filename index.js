__appconfig = require("./appConfig");
global.Promise = require("bluebird").Promise;
const app = require("./application/app");

const PORT = process.env.PORT || 3000;

console.log("Iniciando servidor en modo desarrollo");

app.listen(PORT, () => {
    console.log("Server listening on port 3000");
});