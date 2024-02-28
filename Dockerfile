FROM python:3.11
WORKDIR /code
COPY pyproject.toml /code/pyproject.toml 
COPY ./app /code/app
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 -y
RUN pip3 install poetry && poetry config virtualenvs.create false && poetry install --no-dev
ENV PYTHONPATH "."
CMD [ "poetry", "run", "python", "app/main.py" ]
