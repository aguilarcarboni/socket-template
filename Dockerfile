# Use an official Python runtime as the base image
FROM python:3.9-slim

# Add labels for metadata
LABEL maintainer="laserfocus"
LABEL name="socket-template"
LABEL version="1.0"
LABEL description=""

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Create directory for persistent database storage
RUN mkdir -p /app/src/db

# Create volume mount point
VOLUME /app/src/db

# Copy the application code
COPY . .

# Make run script executable
RUN chmod +x run.sh

# Set the default environment variable
EXPOSE 3333

ENTRYPOINT ["./run.sh"]