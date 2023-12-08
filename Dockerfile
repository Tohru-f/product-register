FROM ruby:2.5
RUN echo "deb https://archive.debian.org/debian/ stretch main" > /etc/apt/sources.list \
    && echo "deb https://archive.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list
RUN apt-get update 
RUN apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    postgresql-client \
    yarn
WORKDIR /product-register
COPY Gemfile Gemfile.lock /product-register/
RUN bundle install