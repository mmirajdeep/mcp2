# Use official Python runtime
FROM python:3.12-alpine

# Create and use app directory
WORKDIR /app

COPY pyproject.toml uv.lock .

# Install 'uv' CLI
RUN pip install --no-cache-dir uv

# Run uv sync to install dependencies from pyproject.toml
RUN uv sync

# Copy the rest of the application
COPY . .

# Expose the port your app listens on
EXPOSE 8200

# Run your app using the uv CLI exactly as you requested
CMD ["uv", "run", "server.py"]
