#
FROM python:3
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
RUN mkdir /hackernews
WORKDIR /hackernews
COPY requirements.txt /hackernews/
RUN pip install -r requirements.txt
COPY . /hackernews/
RUN python manage.py makemigrations --setting=settings.production
RUN python manage.py migrate --setting=settings.production 
RUN python manage.py runserver --setting=settings.production 1.1.1.1:8080
