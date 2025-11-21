FROM python:3.8-slim

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir requests

EXPOSE 80

ENV NAME World

CMD ["python", "./app.py"]
