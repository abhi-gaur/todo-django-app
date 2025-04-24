FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install system dependencies and distutils
RUN apt-get update && \
    apt-get install -y gcc libpq-dev python3-distutils && \
    rm -rf /var/lib/apt/lists/*

# Install Django
RUN pip install --no-cache-dir django==3.2

# Copy app code
COPY . .

# Run migrations
RUN python manage.py migrate

# Expose the port
EXPOSE 8000

# Run the Django server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
