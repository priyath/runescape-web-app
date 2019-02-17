import React from 'react';

const SkillBox = ({ type = 'checkbox', id, name, checked = false, onChange, onSkillChange }) => (
    <span>
      <input id={id} type={type} name={name} checked={checked} onChange={onChange} />
      <label style={Object.assign({}, labelStyle, floatStyle)} key={id} htmlFor={name}>{name}</label>
      <input id={id} type="text" name={name} disabled={!checked} onChange={onSkillChange}/>
    </span>
);

/*
SkillBox.propTypes = {
  type: PropTypes.string,
  name: PropTypes.string.isRequired,
  checked: PropTypes.bool,
  onChange: PropTypes.func.isRequired,
};*/

export default SkillBox;

const labelStyle = {
  width:'100px',
  clear:'left',
  'textAlign':'right',
  'paddingRight':'10px'
};

const floatStyle = {
  float: 'left'
};