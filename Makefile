.PHONY: help install test lint format build up down clean

help:
	@echo "Available commands:"
	@echo "  install  - Install dependencies"
	@echo "  test     - Run tests"
	@echo "  lint     - Lint code"
	@echo "  format   - Format code"
	@echo "  up       - Start local stack (Prometheus + Grafana)"
	@echo "  down     - Stop local stack"
	@echo "  clean    - Remove artifacts"

install:
	pip install -r requirements.txt

test:
	pytest tests/ -v --cov=producer --cov=consumer --cov=analytics --cov-report=html

lint:
	flake8 producer/ consumer/ analytics/ tests/
	black --check producer/ consumer/ analytics/ tests/

format:
	black producer/ consumer/ analytics/ tests/
	isort producer/ consumer/ analytics/ tests/

up:
	docker-compose up -d

down:
	docker-compose down

clean:
	rm -rf .pytest_cache/ htmlcov/ __pycache__/ *.pyc
