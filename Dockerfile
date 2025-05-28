FROM python:3.12.10-alpine

WORKDIR /app

COPY . .

RUN pip install --upgrade pip && \
    pip install "fastapi[standard]"

EXPOSE 8000

CMD ["fastapi", "run", "main.py"]
