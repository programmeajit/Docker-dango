# Use the official Python image as a base image
FROM python:3.10 
# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

#RUN python manage.py makemigrations 

# Copy the current directory contents into the container at /app/
COPY . /app/

RUN python manage.py makemigrations 

# Run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
