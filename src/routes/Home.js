// Home Component
import React from 'react';
import { Link } from 'react-router-dom';

function Home() {
  return (
    <div>
      <h1>Welcome Home</h1>
      <p>This is the home page.</p>
      <Link to="/dashboard">Go to Dashboard</Link>
    </div>
  );
}

export default Home;