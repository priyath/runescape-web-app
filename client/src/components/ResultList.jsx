import React from 'react';

class ResultList extends React.Component {

  constructor(props) {
    super(props);
  }

  render() {
    let results = this.props.resultData;
    return (
        <React.Fragment>
          <ul style={ulStyle}>
            {
              results.map(row => {

                return(
                    <li style={textStyle} key={row.quest_id}>
                      {row.quest_name}
                    </li>
                )
              })
            }
          </ul>
        </React.Fragment>
    );
  }
}

export default ResultList;

const textStyle = {
  width:'180px',
  clear:'left',
  'textAlign':'left',
  'paddingLeft':'200px'
};

const ulStyle = {
  'listStyleType': 'none',
  'overflow': 'auto',
  'height': '800px'
};