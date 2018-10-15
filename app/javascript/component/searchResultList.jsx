import React from 'react';
import SearchResult from './searchResult';

export default ({results, loading}) => (
  <div className="results"
       style={{
         visibility: results.length === 0 ? 'hidden' : 'visible'
       }}
  >
    {loading ? (
      <div className="spinner-layer spinner-blue">
        <div className="circle-clipper left">
          <div className="circle"></div>
        </div>
        <div className="gap-patch">
          <div className="circle"></div>
        </div>
        <div className="circle-clipper right">
          <div className="circle"></div>
        </div>
      </div>) : (
      <div className="divide">
        {results.map(result => <SearchResult key={result.id} result={result}/>)}
      </div>
    )}
  </div>
);
