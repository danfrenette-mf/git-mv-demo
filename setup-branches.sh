#!/bin/bash

echo "=== Setting up Git Move Demo Repository ==="
echo "This script creates all demo branches for exploration"
echo

# Run the demo to create branches (but suppress most output)
echo "Creating demo branches..."
./demo.sh > /tmp/demo-output.log 2>&1

# Abort any ongoing rebase to clean up
git rebase --abort 2>/dev/null

# Show the final state
echo "✅ Demo branches created!"
echo
echo "Available branches:"
git branch -a
echo
echo "Repository structure:"
echo "📁 main - Initial React Router v6 codebase"
echo "📁 staging - Team integration branch with new features"  
echo "📁 feature/rr7-migration - React Router v7 migration (with conflicts)"
echo
echo "Explore the branches:"
echo "  git checkout staging                    # See team features"
echo "  git checkout feature/rr7-migration     # See migration work"
echo "  git log --oneline --graph --all        # See full history"
echo
echo "To see the demo in action:"
echo "  make reset && ./demo.sh"