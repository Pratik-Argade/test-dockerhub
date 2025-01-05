FROM python:3.9-slim
WORKDIR ..
COPY . .
CMD ["sh", "-c", "python ./app.py && tail -f /dev/null"]
