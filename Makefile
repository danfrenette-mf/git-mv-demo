.PHONY: setup demo clean reset

setup:
	@echo "Setting up git-move-conflict-demo..."
	@git add .
	@git commit -m "initial: setup demo repository"
	@echo "Setup complete! Run 'make demo' to see the conflict scenario."

demo:
	@./demo.sh

clean:
	@git checkout main
	@git branch -D feature/router-migration 2>/dev/null || true
	@git branch -D feature/add-user-greeting 2>/dev/null || true
	@echo "Cleaned up demo branches."

reset:
	@git checkout main
	@git reset --hard HEAD
	@make clean
	@echo "Repository reset to initial state."