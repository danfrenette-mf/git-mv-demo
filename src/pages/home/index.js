// Home Component
import React from 'react';
import { useNavigate } from 'react-router'; // React Router v7

function Home() {
  const navigate = useNavigate();
  
  return (
    <div>
      <h1>Welcome to the New Home</h1>
      <p>This is the updated home page.</p>
      <button onClick={() => navigate('/dashboard')}>Go to Dashboard</button>
    </div>
  );
}

export default Home;
