import React from 'react';
import SkillBox from './SkillBox';

class SkillList extends React.Component {
  constructor(props) {
    super(props);
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(e) {
    const skillId = e.target.id;
    const isChecked = e.target.checked;
    this.props.onCheckboxSelection({skillId, isChecked});
  }

  render() {
    let skills = this.props.skillData;
    return (
        <React.Fragment>
          <ul style={ulStyle}>
            {
              skills.map(skill => (
                  <li align='left' key={skill.skill_id}>
                      <SkillBox name={skill.skill_name} id={skill.skill_id} checked={skill.isChecked} onSkillChange={this.props.onSkillChange} onChange={this.handleChange} />
                  </li>
              ))
            }
          </ul>
        </React.Fragment>
    );
  }
}

export default SkillList;

const ulStyle = {
  'listStyleType': 'none',
};