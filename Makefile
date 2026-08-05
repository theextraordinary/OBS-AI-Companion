.PHONY: setup dev dev-api dev-desktop test lint typecheck format contracts build clean

setup:
	npm install
	cd apps/local-api && uv sync

dev:
	pwsh ./scripts/dev.ps1

dev-api:
	cd apps/local-api && uv run python -m vasp_companion

dev-desktop:
	npm --workspace apps/desktop run tauri dev

test:
	npm run test
	cd apps/local-api && uv run pytest

lint:
	npm run lint
	cd apps/local-api && uv run ruff check .

typecheck:
	npm run typecheck
	cd apps/local-api && uv run pyright

format:
	npm run format
	cd apps/local-api && uv run ruff format .

contracts:
	npm run contracts:generate

build:
	npm run build

clean:
	npm run clean
