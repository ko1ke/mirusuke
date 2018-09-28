import React from 'react'

let getOptionsWithPaddingZero = (numArr, keyPrefix) => {
  let arr = [];
  numArr.forEach (function(num) {
    let index = ('00' + String(num)).slice(-2);
    arr.push(<option key={keyPrefix + index} value={index}>{index}</option>);
  });
  return arr;
};

class HourMin extends React.Component {
  render() {
    return (
      <span>
          <select id="schedule_start_time_4i" name="schedule[start_time(4i)]"
                  className="browser-default inline-date"
                  defaultValue={this.props.defaultHour}>
          {getOptionsWithPaddingZero(Array.from({length: 24}, (v, k) => k), 'hours')}
        </select>
        &ensp;:&ensp;
        <select id="schedule_start_time_5i" name="schedule[start_time(5i)]"
                className="browser-default inline-date" defaultValue={this.props.defaultMin}>
          {getOptionsWithPaddingZero(Array.from({length: 12}, (v, k) => k * 5), 'minutes')}
        </select>
       </span>
    );
  }
}

export default HourMin;