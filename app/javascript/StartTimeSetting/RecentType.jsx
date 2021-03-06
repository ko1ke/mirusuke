import React from 'react'
import YearMonthDate from './YearMonthDate'
import HourMin from './HourMin'

class RecentType extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      defaultHour: this.props.defaultHour,
      defaultMin: this.props.defaultMin
    }
  }
  render() {
    console.log(this.state);
    return (
      <div id="start_times">
        <YearMonthDate/>
        <HourMin defaultHour={this.state.defaultHour} defaultMin={this.state.defaultMin}/>
      </div>
    );
  }
}

export default RecentType;