// Home Component
import React from 'react';
import { Link } from 'react-router-dom';
import { useUser } from '../hooks/useUser';

function Home() {
  const user = useUser();
  
  return (
    <div>
      <h1>Welcome Home{user ? `, ${user.name}` : ''}!</h1>
      <p>This is the home page.</p>
      <p>You are logged in as: {user?.name || 'Guest'}</p>
      <Link to="/dashboard">Go to Dashboard</Link>
    </div>
  );
}

export default Home;
