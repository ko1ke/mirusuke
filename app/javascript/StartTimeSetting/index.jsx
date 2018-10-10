import React from 'react'
import RecentType from './RecentType';
import FirstMorningType from './FirstMorningType';
import FirstAfternoonType from './FirstAfternoonType';

let dt = new Date();
let hours = dt.getHours();

class TimeSettingSelector extends React.Component {
  constructor(props) {
    super(props);
    this.onTypeSelected = this.onTypeSelected.bind(this);
    this.state = {
      selectedType: null,
      defaultHour: hours === 23 ? "00" : ("00" + String(hours + 1)).slice(-2),
      defaultMin: "00"
    };
  }

  onTypeSelected(event) {
    this.setState({selectedType: event.target.value});
    if (event.target.value == 'first-morning') {
      this.setState({defaultHour: "09", defaultMin: "00"});
    } else if (event.target.value == 'first-afternoon') {
      this.setState({defaultHour: "13", defaultMin: "00"});
    } else {
      this.setState({
        defaultHour: hours === 23 ? "00" : ("00" + String(hours + 1)).slice(-2),
        defaultMin: "00"
      });
    }
  }

  render() {
    let TypeCustomComponent = RecentType;
    if (this.state.selectedType == 'first-morning') {
      TypeCustomComponent = FirstMorningType;
    } else if (this.state.selectedType == 'first-afternoon') {
      TypeCustomComponent = FirstAfternoonType;
    }
    return (

      <div className="field">
        <label>
          <input name="start_time-group" value="recent" id="start_time-recent" onChange={this.onTypeSelected} type="radio"
                 defaultChecked/>
          <span>直近</span>
        </label>
        <br/>
        <label>
          <input name="start_time-group" value="first-morning" id="start_time-first-morning" onChange={this.onTypeSelected} type="radio"/>
          <span>朝一</span>
        </label>
        <br/>
        <label>
          <input name="start_time-group" value="first-afternoon" id="first-morning-first-afternoon" onChange={this.onTypeSelected} type="radio"/>
          <span>午後一</span>
        </label>
        <br/>
        <TypeCustomComponent defaultHour={this.state.defaultHour} defaultMin={this.state.defaultMin}/>
      </div>
    );
  }
}

export default TimeSettingSelector