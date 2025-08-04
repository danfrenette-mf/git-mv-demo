# Git File Move Conflict Demo

This repository demonstrates how Git handles file moves and conflicts during a React Router migration.

## Branches
- `main` - The base branch
- `feature/router-migration` - Migrates to React Router v7 with new file structure
- `feature/add-user-greeting` - Adds user functionality (creates conflict)

## Demo Steps
1. Clone the repository
2. Run `./demo.sh` to see the conflict scenario
3. Follow the conflict resolution guide

## Conflict Resolution Guide
When merging after file moves, you'll encounter modify/delete conflicts. Here's how to resolve them:

1. Check what changed in the old file location
2. Apply those changes to the new file location
3. Remove the old file and mark as resolved

See demo.sh for the complete walkthrough.