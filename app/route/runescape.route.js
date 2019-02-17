module.exports = function(app) {

  const runescape = require('../controller/runescape.controller');

  //health check
  app.get('/health', function (req, res){
    res.end('Runescape API is alive');
  });

  // Retrieve all Quests
  app.get('/api/quests', runescape.getQuestsList);

  // Retrieve all Skills
  app.get('/api/skills', runescape.getSkillsList);

  // Retrieve all Quests
  app.post('/api/eligible-quests', runescape.getEligibleQuestsList);

};