import React from 'react'
import ArbitraryType from './ArbitraryType';
import AllDayType from './AllDayType';
import AllAmType from './AllAmType';

class TimeSettingSelector extends React.Component {
  constructor(props) {
    super(props);
    this.onTypeSelected = this.onTypeSelected.bind(this);
    this.state = {selectedType: null};
  }

  onTypeSelected(event) {
    this.setState({selectedType: event.target.value});
    console.log(event.target.value);
  }

  render() {
    let TypeCustomComponent = ArbitraryType;
    if (this.state.selectedType == 'all-day') {
      TypeCustomComponent = AllDayType;
    } else if (this.state.selectedType == 'all-am'){
      TypeCustomComponent = AllAmType;
    }

      return (
      <div className="field">
        <label>
          <input id="arbitrary" name="time-setting-group" value="arbitrary" onChange={this.onTypeSelected} type="radio" defaultChecked/>
          <span>時間指定</span>
        </label>
        <br/>
        <label>
          <input id="all-am" name="time-setting-group" value="all-am" onChange={this.onTypeSelected} type="radio"/>
          <span>午前いっぱい</span>
        </label>
        <br/>
        <label>
          <input id="all-day" name="time-setting-group" value="all-day" onChange={this.onTypeSelected} type="radio"/>
          <span>終日</span>
        </label>
        <br />
        <TypeCustomComponent />
      </div>
    );
  }
}

export default TimeSettingSelector