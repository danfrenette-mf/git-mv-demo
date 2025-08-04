.PHONY: setup demo clean reset branches help

help:
	@echo "Git Move Demo - React Router v7 Migration"
	@echo ""
	@echo "Available commands:"
	@echo "  make setup     - Initial git commit (run once)"
	@echo "  make demo      - Run the interactive demo"
	@echo "  make branches  - Create all branches for exploration"
	@echo "  make clean     - Remove demo branches"
	@echo "  make reset     - Reset to initial state"
	@echo "  make help      - Show this help"

setup:
	@echo "Setting up git-move-demo repository..."
	@git add .
	@git commit -m "initial: setup demo repository" 2>/dev/null || echo "Already committed"
	@echo "✅ Setup complete! Run 'make demo' to see the demo."

demo:
	@./demo.sh

branches:
	@./setup-branches.sh

clean:
	@git checkout main 2>/dev/null
	@git branch -D feature/rr7-migration 2>/dev/null || true
	@git branch -D feature/user-greeting 2>/dev/null || true
	@git branch -D staging 2>/dev/null || true
	@echo "Cleaned up demo branches."

reset:
	@git checkout main 2>/dev/null
	@git reset --hard HEAD~1 2>/dev/null || git reset --hard HEAD
	@make clean
	@echo "Repository reset to initial state."