import React from 'react';

export default ({result}) => (
  <a href={`/schedules/${result.id}`}>
    <div>
      <p>{result.username}</p>
    </div>
  </a>
);