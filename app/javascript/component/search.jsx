import React from 'react'
import axios from 'axios';
import SearchResultList from './searchResultList';

export default class Search extends React.Component {
  state = {loading: false, results: []};

  onChange = (e) => {
    const {value} = e.target;
    this.setState({loading: true});

    if (value.length > 0) {
      axios.get('/search.json', {params: {query: value}})
        .then(res => this.setState({loading: false, results: res.data}))
        .catch(() => this.setState({loading: false, results: []}));
    } else {
      this.setState({loading: false, results: []});
    }
  }

  render() {
    const {loading, results} = this.state;
    return (
      <div className='row'>
        <form className='col s12 method="GET" action="search"'>
          <div className='input-field'>
            <i className='material-icons prefix'>search</i>
            <textarea name="query" type="text" className='materialize-textarea' id='icon_prefix2'
                      onChange={this.onChange}></textarea>
            <label htmlFor='icon_prefix2'>メンバー名を入力...</label>
          </div>

          {results.length > 0 || loading ? <SearchResultList results={results} loading={loading}/> : null}

        </form>
      </div>
    );
  }
}