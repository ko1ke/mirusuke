import React from 'react'
import RecentType from './RecentType';
import AllDayType from './AllDayType';
import AllAmType from './AllAmType';

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
    if (event.target.value == 'all-day') {
      this.setState({defaultHour: "23", defaultMin: "55"});
    } else if (event.target.value == 'all-am') {
      this.setState({defaultHour: "12", defaultMin: "00"});
    } else {
      this.setState({
        defaultHour: hours === 23 ? "00" : ("00" + String(hours + 1)).slice(-2),
        defaultMin: "00"
      });
    }
  }

  render() {
    let TypeCustomComponent = RecentType;
    if (this.state.selectedType == 'all-day') {
      TypeCustomComponent = AllDayType;
    } else if (this.state.selectedType == 'all-am') {
      TypeCustomComponent = AllAmType;
    }
    return (

      <div className="field">
        <label>
          <input name="termination_time-group" value="recent" id="termination_time-recent" onChange={this.onTypeSelected} type="radio"
                 defaultChecked/>
          <span>直近</span>
        </label>
        <br/>
        <label>
          <input name="termination_time-group" value="all-am" id="termination_time-all-am" onChange={this.onTypeSelected} type="radio"/>
          <span>正午</span>
        </label>
        <br/>
        <label>
          <input name="termination_time-group" value="all-day" id="termination_time-all-day" onChange={this.onTypeSelected} type="radio"/>
          <span>終日</span>
        </label>
        <br/>
        <TypeCustomComponent defaultHour={this.state.defaultHour} defaultMin={this.state.defaultMin}/>
      </div>
    );
  }
}

export default TimeSettingSelector