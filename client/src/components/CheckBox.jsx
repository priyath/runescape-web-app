import React from 'react';
import PropTypes from 'prop-types';

const Checkbox = ({ type = 'checkbox', name, id, checked = false, onChange }) => {
  return (
    <label key={id}>
      <input id={id} type={type} name={name} checked={checked} onChange={onChange} />
      {name}
    </label>
  )
};

Checkbox.propTypes = {
  type: PropTypes.string,
  name: PropTypes.string.isRequired,
  checked: PropTypes.bool,
  onChange: PropTypes.func.isRequired,
};

export default Checkbox;