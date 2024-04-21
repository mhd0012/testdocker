# Use an official Python runtime as a parent image
FROM python:3.10

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define environment variable for Django settings module
ENV DJANGO_SETTINGS_MODULE=testdocker.settings.production

# Run Gunicorn to serve the Django app
CMD ["gunicorn", "testdocker.wsgi:application", "--bind", "0.0.0.0:8000"]
