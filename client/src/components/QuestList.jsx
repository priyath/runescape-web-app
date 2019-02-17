import React from 'react';
import Checkbox from './CheckBox';

class QuestList extends React.Component {

  constructor(props) {
    super(props);
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(e) {
    const questId = e.target.id;
    const isChecked = e.target.checked;
    this.props.onCheckboxSelection({questId, isChecked});
  }

  render() {
    let quests = this.props.questData;
    return (
        <React.Fragment>
          <ul id='menu' style={ulStyle}>
            {
              quests.map(quest => {

                return(
                  <li align='left' key={quest.quest_id}>
                    <Checkbox
                        name={quest.quest_name} id={quest.quest_id}
                        checked={quest.isChecked}
                        onChange={this.handleChange}
                    />
                  </li>
                )
              })
            }
          </ul>
        </React.Fragment>
    );
  }
}

export default QuestList;

const ulStyle = {
  'listStyleType': 'none',
  'overflow': 'auto',
  'height': '800px'
};