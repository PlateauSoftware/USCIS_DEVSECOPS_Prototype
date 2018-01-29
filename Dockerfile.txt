FROM ruby:2.4-alpine3.6

MAINTAINER Karthik <karthik@plateauinc.com>
RUN gem install sinatra -y

COPY app/

WORKDIR /app

EXPOSE 80

CMD ["ruby", "app.rb"]