const db = require('../config/db.config.js');

// FETCH all Quests
exports.getQuestsList = (req, res) => {
    db.sequelize.query("SELECT * FROM QUESTS", { type: db.sequelize.QueryTypes.SELECT })
      .then(quests => {
          res.send(JSON.stringify(quests))
      }).catch((e) => {
          res.send('Something went wrong while retrieving quests')
    })
};

// FETCH all Skills
exports.getSkillsList = (req, res) => {
  console.log('Fetching skills...');
  db.sequelize.query("SELECT * FROM SKILLS", { type: db.sequelize.QueryTypes.SELECT })
  .then(skills => {
    res.send(JSON.stringify(skills))
  }).catch((e) => {
    res.send('Something went wrong while retrieving skills')
  })
};


// FETCH all eligible Quests
exports.getEligibleQuestsList = (req, res) => {

    let completedQuests = req.body.quests;
    let availableSkills = req.body.skills;

    const questsQuery = getEligibleQuestsForQuests(completedQuests);
    const skillsQUery = getEligibleQuestsForSkillQuery(availableSkills);

    const intersectQuery = `SELECT DISTINCT * FROM (${questsQuery}) AS Q1 INNER JOIN (${skillsQUery}) AS Q2 USING (quest_id)`;

    db.sequelize.query(intersectQuery, { type: db.sequelize.QueryTypes.SELECT })
      .then(quests => {
          res.send(JSON.stringify(quests))
      }).catch((e) => {
        res.send('Something went wrong while retrieving quests')
    })
};

const getEligibleQuestsForSkillQuery = (skills) => {

  let sumQueryString = skills.reduce((completeString, currentVal, index, arr) => {
    let skillIndex = currentVal.key;
    let skillValue = currentVal.value;
    if (index === (arr.length - 1))
      return completeString + ` (sp.prerequisite_skill_id = ${skillIndex} and ${skillValue} >= sp.skill_value)`;
    return completeString + ` (sp.prerequisite_skill_id = ${skillIndex} and ${skillValue} >= sp.skill_value) +`;
  }, '');

  if (sumQueryString.trim() === '')
    sumQueryString = '0';

  return `SELECT q.quest_id, q.quest_name
                    FROM QUESTS q LEFT JOIN
                    SKILL_PREREQUISITES sp
                    ON sp.quest_id = q.quest_id
                    GROUP BY q.quest_id
                    HAVING COALESCE(SUM( (${sumQueryString}) )) = COUNT(sp.prerequisite_skill_id)
                    OR COUNT(sp.prerequisite_skill_id) = 0`;
};

const getEligibleQuestsForQuests = (quests) => {
  const questString = quests.join(',');

  return `SELECT q.quest_id, q.quest_name
    FROM QUESTS q
    LEFT JOIN QUEST_PREREQUISITES qp ON qp.quest_id = q.quest_id
    WHERE NOT FIND_IN_SET(q.quest_id, "${questString}")
    GROUP BY q.quest_id
    HAVING SUM(COALESCE(FIND_IN_SET(qp.prerequisite_quest_id, "${questString}"), 0) > 0) = COUNT(qp.prerequisite_quest_id)`
};