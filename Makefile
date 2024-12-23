# Define your virtual environment and Flask app
VENV = venv
FLASK_APP = app.py

# Install dependencies
install:
	python3 -m venv $(VENV)
	./$(VENV)/bin/pip install --upgrade pip
	./$(VENV)/bin/pip install -r requirements.txt

# Run the Flask application
run:
	FLASK_APP=$(FLASK_APP) FLASK_ENV=development ./$(VENV)/bin/flask run --port 3000

# Run tests
test:
	PYTHONPATH=. ./$(VENV)/bin/pytest --maxfail=5 --disable-warnings -q

# Clean up virtual environment and generated files
clean:
	rm -rf __pycache__ static/plots/*.png

# Reinstall dependencies
reinstall: clean install
