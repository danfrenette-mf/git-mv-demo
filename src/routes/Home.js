// Home Component
import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { useUser } from '../hooks/useUser';

function Home() {
  const user = useUser();
  const [counter, setCounter] = useState(0);

  const incrementNumber = () => {
    setCounter(prevCounter => prevCounter + 1);
  };
  
  return (
    <div>
      <h1>Welcome Home{user ? `, ${user.name}` : ''}!</h1>
      <p>This is the home page.</p>
      <p>You are logged in as: {user?.name || 'Guest'}</p>
      
      <div style={{ margin: '20px 0', padding: '10px', border: '1px solid #ccc', borderRadius: '5px' }}>
        <h3>Counter Demo</h3>
        <p>Current number: <strong>{counter}</strong></p>
        <button onClick={incrementNumber} style={{ padding: '8px 16px', fontSize: '16px' }}>
          Increment Number
        </button>
      </div>
      
      <Link to="/dashboard">Go to Dashboard</Link>
    </div>
  );
}

export default Home;
