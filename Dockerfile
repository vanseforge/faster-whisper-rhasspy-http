FROM pytorch/pytorch:latest

ENV PYTHONUNBUFFERED=1

RUN mkdir /app
WORKDIR /app
COPY . /app

RUN pip install -r requirements.txt

ENTRYPOINT ["python", "main.py"]