FROM python:3.9-slim
LABEL maintainer="AISSM"
LABEL version='1.0'

ENV PYTHONUNBUFFERED 1
WORKDIR /app

COPY requirements.txt /app/requirements.txt
COPY models/model.joblib /app/models/model.joblib
COPY webpage /app/webpage

EXPOSE 8000

# Creating virtual environment and installing dependencies
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /app/requirements.txt && \
    rm -rf /root/.cache && \
    adduser --disabled-password --no-create-home appuser

ENV PATH="/py/bin:$PATH"
USER appuser
