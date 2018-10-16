import React from 'react';
import SearchResult from './searchResult';

export default ({results, loading}) => (
  <div className="results">
    {loading ? null : (
      <div className="divide">
        {results.map(result => <SearchResult key={result.id} result={result}/>)}
      </div>
    )}
  </div>
);
