FROM ruby:2.7.1-alpine


RUN apk update && \
    apk add --no-cache build-base bash git postgresql-dev libffi-dev



RUN apk add --no-cache ruby ruby-dev make zlib zlib-dev nodejs


WORKDIR /home/app/


COPY Gemfile /home/app/
COPY puma_entrypoint.sh /home/app/

EXPOSE 3000
CMD chmod +x puma_entrypoint.sh