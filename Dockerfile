FROM python:3.9-alpine3.13
LABEL maintainer="dk1"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./app /app
EXPOSE 8000

ARG DEV=false
RUN whoami && python3 -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt
    

RUN adduser -D django-user
RUN chown -R django-user:django-user -R /app
ENV PATH="/py/bin:$PATH"

USER django-user
