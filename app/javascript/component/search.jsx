import React from 'react'

export default class Search extends React.Component {
  render() {
    return (
      <div className='row'>
        <form className='col s12'>
          <div className='input-field'>
            <i className='material-icons prefix'>search</i>
            <textarea className='materialize-textarea' id='icon_prefix2'></textarea>
            <label htmlFor='icon_prefix2'>メンバー名を入力...</label>
          </div>
        </form>
      </div>
    );
  }
}