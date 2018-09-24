import React from 'react'
let dt = new Date();
let year = dt.getFullYear();
let month = dt.getMonth()+1;
let date = dt.getDate();
let hours = dt.getHours();
let minutes = dt.getMinutes();

let tt = () => {
  let arr = [];
  for (let i = 0; i < 25; i++) {
    arr.push(<p>{i}</p>)
  }
  return arr;
}

// const a = 46545546;
//
// function b () {
//   return (<p><span>f</span>dsafafs</p>)
// }



class TimeSettingSelector extends React.Component {
  render() {
    return (
      <div className="field">
        <label htmlFor="time-setting">
          <label>
            <input id="arbitrary" name="group1" type="radio" checked />
            <span>時間指定</span>
          </label>
          <br/>
          <label>
            <input id="all-day" name="group1" type="radio" />
            <span>終日</span>
          </label>
        </label>
        <p>{year}</p>

        {/*<p>{month}</p>*/}
        {/*<p>{date}</p>*/}
        {/*<p>{hours}</p>*/}
        {/*<p>{minutes}</p>*/}
        {tt()}

        {/*{b()}*/}

        {/*<select id="pay_type" name="order[pay_type]">*/}
          {/*<option value="">Select a payment method</option>*/}
          {/*<option value="Check">Check</option>*/}
          {/*<option value="Credit card">Credit card</option>*/}
          {/*<option value="Purchase order">Purchase order</option>*/}
        {/*</select>*/}
      </div>
    );
  }
}
export default TimeSettingSelector