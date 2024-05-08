# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.9

# Allow statements and log messages to immediately appear in the logs
ENV PYTHONUNBUFFERED True
ENV APP_HOME /app
WORKDIR $APP_HOME

ADD requirements.txt /app

RUN pip install --upgrade pip setuptools
RUN pip install -r requirements.txt

COPY .$APP_HOME /app

# Run flask
EXPOSE 8080

CMD exec gunicorn app:app --preload --bind 0.0.0.0:8080 --worker-class 'uvicorn.workers.UvicornWorker' --workers 1 --timeout 0 --keep-alive 1
