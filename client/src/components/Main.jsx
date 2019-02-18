import React from 'react';
import { Grid, Row, Col } from 'react-flexbox-grid';
import QuestList from './QuestList';
import SkillList from './SkillList';
import ResultList from "./ResultList";

export default class Main extends React.Component {

  constructor(props) {
    super(props);
    this.updateQuestSelections = this.updateQuestSelections.bind(this);
    this.updateSkillSelections = this.updateSkillSelections.bind(this);
    this.state = {
      questData: [],
      skillData: [],
      resultData: []
    };
  }

  componentDidMount() {
    Promise.all([
      fetch('/api/quests'),
      fetch('/api/skills')
    ])
    .then(([res1, res2]) => Promise.all([res1.json(), res2.json()]))
    .then(([quests, skills]) => this.setState({
      questData: quests,
      skillData: skills
    }));
  }

  updateQuestSelections({questId, isChecked}) {
    console.log('Updating quest checked list..');

    this.setState((prevState) => {
      const questData = prevState.questData.map((quest, index) => {
        if ((quest.quest_id) === parseInt(questId)) {
          quest['isChecked'] = isChecked;
        }
        return quest;
      });
      return {
        questData
      };
    });
  }

  updateSkillSelections({skillId, isChecked}) {

    console.log('Updating skill checked list..');
    this.setState((prevState) => {
      const skillData = prevState.skillData.map((skill, index) => {
        if ((skill.skill_id) === parseInt(skillId)) {
          skill['isChecked'] = isChecked;
        }
        return skill;
      });
      return {
        skillData
      };
    });
  }

  onSubmit = () => {
    let quests = this.state.questData;
    let skills = this.state.skillData;

    let selectedQuests = quests.reduce((filtered, quest)=>{
      if (quest.isChecked)
        filtered.push(quest.quest_id);

      return filtered;
    }, []);

    let skillValues = skills.reduce((filtered, skill)=>{
      if (skill.isChecked)
        filtered.push({
          'key': skill.skill_id,
          'value': skill.skillValue
        });

      return filtered;
    }, []);

    fetch('/api/eligible-quests', {
      method: 'post',
      headers: {'Content-Type':'application/json'},
      body: JSON.stringify({
        'quests': selectedQuests ? selectedQuests : [],
        'skills': skillValues ? skillValues : []
      })
    })
    .then((res1) => res1.json())
    .then((quests) => this.setState((prevState) => {
      let resultData = quests;
      return {
        resultData
      }
    }, ()=>{
      console.log('State updated with result data');
    }));
  };

  onSkillChange = (e) => {
    let skillId = e.target.id;
    let skillValue = e.target.value;

    this.setState((prevState) => {
      const skillData = prevState.skillData.map((skill, index) => {
        if ((skill.skill_id) === parseInt(skillId)) {
          skill['skillValue'] = skillValue;
        }
        return skill;
      });
      return {
        skillData
      };
    }, ()=>{
      console.log('Skill value updated: ', this.state);
    });
  };

  render() {
    return (
        <Grid>
          <Row>
            <Col xs >
              <label><b>Completed Quests</b></label>
              <QuestList questData={this.state.questData} onCheckboxSelection={this.updateQuestSelections}/>
            </Col>
            <Col xs >
              <label><b>Skills</b></label>
              <SkillList skillData={this.state.skillData} onSkillChange={this.onSkillChange} onCheckboxSelection={this.updateSkillSelections}/>
            </Col>
            <Col xs >
              <label><b>Eligible Quests ({this.state.resultData.length})</b></label>
              <ResultList resultData={this.state.resultData}/>
            </Col>
          </Row>
          <Row>
            <Col xs ><button onClick={this.onSubmit}>Get Eligible Quests</button></Col>
          </Row>
        </Grid>
    )
  }
}