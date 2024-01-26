FROM python:3.12.0-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install dependencies required for GDAL
RUN apt-get update \
  && apt-get install -y binutils libproj-dev gdal-bin

# Create and set the working directory
RUN mkdir /code
WORKDIR /code

# Upgrade pip and install Python dependencies
COPY requirements.txt /code/
RUN pip3 install --no-cache-dir --upgrade pip
RUN pip3 install -r requirements.txt

# Copy the Django project into the container
COPY . /code/

# Expose the port the app runs on
COPY entrypoint.sh /code/

RUN chmod +x /code/entrypoint.sh

EXPOSE 8000

CMD ["/code/entrypoint.sh"]