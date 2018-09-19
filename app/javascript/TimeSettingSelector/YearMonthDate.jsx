import React from 'react'

let dt = new Date();
let year = dt.getFullYear();
let month = dt.getMonth() + 1;
let date = dt.getDate();

let getOptions = (startVal, endVal, keyPrefix) => {
  let arr = [];
  for (let i = startVal; i <= endVal; i++) {
    let index = String(i);
    arr.push(<option key={keyPrefix + index} value={index}>{index}</option>);
  }
  return arr;
};

class YearMonthDate extends React.Component {
  render() {
    return (
      <span id="year-month">
        <select id="schedule_termination_time_1i" name="schedule[termination_time(1i)]"
                className="browser-default inline-date" defaultValue={year}>
          <option value={year}>{year}</option>
          <option value={year + 1}>{year + 1}</option>
        </select>
        &ensp;
        <select id="schedule_termination_time_2i" name="schedule[termination_time(2i)]"
                className="browser-default inline-date" defaultValue={month}>
          {getOptions(1, 12, 'month')}
        </select>
        &ensp;
        <select id="schedule_termination_time_3i" name="schedule[termination_time(3i)]"
                className="browser-default inline-date" defaultValue={date}>
          {getOptions(1, 31, 'date')}
        </select>
        &ensp;&mdash;&ensp;
      </span>
    );
  }
}

export default YearMonthDate;