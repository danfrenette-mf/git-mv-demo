// Dashboard Component
import React from 'react';
import { Link } from 'react-router-dom';

function Dashboard() {
  return (
    <div>
      <h1>Dashboard</h1>
      <p>Analytics and metrics go here.</p>
      <Link to="/">Back to Home</Link>
    </div>
  );
}

export default Dashboard;