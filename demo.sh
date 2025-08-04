#!/bin/bash

echo "=== Git File Move Conflict Demo ==="
echo

# Reset to clean state
echo "1. Resetting to initial state..."
git checkout main
git branch -D feature/router-migration 2>/dev/null
git branch -D feature/add-user-greeting 2>/dev/null
echo

# Create migration branch
echo "2. Creating router migration branch..."
git checkout -b feature/router-migration
echo "   - Moving files to new structure..."
mkdir -p src/pages/home src/pages/dashboard src/pages/profile
git mv src/routes/Home.js src/pages/home/index.js
git mv src/routes/Dashboard.js src/pages/dashboard/index.js
git mv src/routes/Profile.js src/pages/profile/index.js
git commit -m "refactor: move route components to pages structure"

echo "   - Updating imports for React Router v7..."
# Update Home component
cat > src/pages/home/index.js << 'EOF'
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
EOF

git add .
git commit -m "refactor: update components for React Router v7"
echo

# Create conflicting branch
echo "3. Creating another developer's branch..."
git checkout main
git checkout -b feature/add-user-greeting
echo "   - Adding user greeting to Home component..."

cat > src/routes/Home.js << 'EOF'
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
EOF

git add .
git commit -m "feature: add user greeting to Home component"
echo

# Simulate merge flow
echo "4. Simulating merge flow..."
echo "   - Merging user greeting feature to main..."
git checkout main
git merge feature/add-user-greeting --no-edit
echo

echo "5. Attempting to merge router migration..."
git checkout feature/router-migration
echo "   - This will create a conflict..."
git merge main 2>&1 | grep -E "(CONFLICT|Automatic merge failed)" || echo "No conflict detected (unexpected!)"
echo

echo "=== Conflict Created! ==="
echo

echo "To see the conflict status:"
echo "  git status"
echo

echo "To see what changed in the old file:"
echo "  git show main:src/routes/Home.js"
echo

echo "To resolve, you would:"
echo "1. Apply changes from old file to new location (src/pages/home/index.js)"
echo "2. Run: git rm src/routes/Home.js"
echo "3. Run: git add src/pages/home/index.js"
echo "4. Run: git commit"