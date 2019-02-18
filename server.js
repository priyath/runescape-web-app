const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const path = require('path');

app.use(bodyParser.json());

const db = require('./app/config/db.config.js');

// force: true will drop the table if it already exists
db.sequelize.sync({force: true}).then(() => {
  console.log('Drop and Resync with { force: true }');
});

require('./app/route/runescape.route.js')(app);
app.use(express.static(path.join(__dirname, 'client/build')));

// Create a Server
const port = process.env.PORT || 8081;

const server = app.listen(port, function () {

  const host = '0.0.0.0';

  console.log("App listening at http://%s:%s", host, port)
});