FROM python:3.8.9-slim-buster

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED=1

ENV APP_HOME=/usr/src/app
RUN mkdir -p ${APP_HOME} && \
    mkdir ${APP_HOME}/staticfiles && \
    mkdir ${APP_HOME}/mediafiles

RUN groupadd -r app
RUN useradd -r app -g app

WORKDIR ${APP_HOME}

RUN apt-get update
RUN apt-get install -y python3-dev musl-dev libpq-dev libxslt-dev postgresql gcc libmariadb-dev

RUN apt install -y netcat


RUN pip install --upgrade pip

COPY ./requirements.txt .
RUN pip install -r requirements.txt

COPY ./entrypoint.sh ${APP_HOME}
COPY . ${APP_HOME}
RUN chown -R app:app ${APP_HOME}

USER app

ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
