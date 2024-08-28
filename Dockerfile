# Use the official Python image with version 3.8
FROM python:3.8-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the required dependencies
RUN pip install -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Set environment variables
ENV FLASK_APP=core/server.py
# Add the following lines at the end of the Dockerfile before the CMD instruction

# Reset DB (optional)
RUN rm core/store.sqlite3 || true
RUN flask db upgrade -d core/migrations/
EXPOSE 7755
# Ensure that the entry point does not run any code by default
CMD ["echo", "Docker container created, not running any code."]
