import React from 'react'
import YearMonthDate from './YearMonthDate'
import HourMin from "./HourMin";

class AllDayType extends React.Component {
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
      <div id="termination_times">
        <YearMonthDate/>
        <HourMin defaultHour={this.state.defaultHour} defaultMin={this.state.defaultMin}/>
      </div>
    );
  }
}

export default AllDayType;