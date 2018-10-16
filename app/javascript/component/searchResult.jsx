import React from 'react';

let formatTime = (timeStr) => {
  return timeStr.replace(/:00\.000\+09:00/g, '')
    .replace(/^\d\d/g, '')
    .replace(/\-/g, '/')
    .replace('T', '-')
};

let outputLabel = (str) => {
  switch(str){
    case 'go_out':
      return <span className={`${str}-label`}>外出</span>
      break;

    case 'meeting':
      return <span className={`${str}-label`}>会議</span>
      break;

    case 'vacation':
      return <span className={`${str}-label`}>休暇</span>
      break;

    case 'early_leaving':
      return <span className={`${str}-label`}>早退</span>
      break;
  }
}


let outputTd = (username, schedules) => {
  let arr = [];
  arr.push(<tr><th colSpan="3"><i className="material-icons icon">tag_faces</i> {username}</th></tr>);
  arr.push(<tr><td><b>行動</b></td><td><b>概要</b></td><td><b>期間</b></td></tr>);

  schedules.forEach(function (schedule) {

    if (new Date(schedule.termination_time) > new Date()){
      arr.push(<tr>
        <td>{outputLabel(schedule.action_type)}</td>
        <td>{schedule.content ? schedule.content: '特になし'}</td>
        <td>{formatTime(schedule.start_time)}～{formatTime(schedule.termination_time)}</td>
      </tr>);
    }

  });
  return arr;
};

export default ({result}) => (
  <table className="responsive-table">
    <tbody>
    {outputTd(result.username, result.schedules)}
    </tbody>
  </table>
);