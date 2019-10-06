From ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /app
RUN mkdir -p /etc/nginx/conf.d/ && touch /etc/nginx/conf.d/client
WORKDIR /tmp
COPY ./Gemfile Gemfile
COPY ./Gemfile.lock Gemfile.lock
RUN bundle install
ADD . /app
WORKDIR /app

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD [ "bundle", "exec", "rails", "s", "-b", "0.0.0.0" ]
