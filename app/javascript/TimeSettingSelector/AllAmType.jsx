import React from 'react'
import YearMonthDate from './YearMonthDate'

let getOptionsWithPaddingZero = (startVal, endVal, keyPrefix) => {
  let arr = [];
  for (let i = startVal; i <= endVal; i++) {
    let index = ('00' + String(i)).slice(-2);
    arr.push(<option key={keyPrefix + index} value={index}>{index}</option>);
  }
  return arr;
};

class AllAmType extends React.Component {
  render() {
    return (
      <div id="termination_times">
        <YearMonthDate/>
        <span id="hours-minutes">
          <select id="schedule_termination_time_4i" name="schedule[termination_time(4i)]"
                  className="browser-default inline-date"
                  defaultValue="13">
          {getOptionsWithPaddingZero(0, 23, 'hours')}
        </select>
          &ensp;:&ensp;
          <select id="schedule_termination_time_5i" name="schedule[termination_time(5i)]"
                  className="browser-default inline-date" defaultValue="00">
          {getOptionsWithPaddingZero(0, 59, 'minutes')}
        </select>
       </span>
      </div>
    );
  }
}

export default AllAmType;