const env = require('./env.js');

const Sequelize = require('sequelize');
const sequelize = new Sequelize('heroku_0162d378c620b88', 'bac0b9b188b527', '4665ad1a', {
    host: 'us-cdbr-iron-east-03.cleardb.net',
    dialect: 'mysql',
    operatorsAliases: false,

    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000
    }
});

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

module.exports = db;