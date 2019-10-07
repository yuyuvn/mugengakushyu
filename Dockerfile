FROM ruby:2.6.5

WORKDIR /app

EXPOSE 3000

RUN gem install rails &&\
    apt-get update -qq &&\
    apt-get install -y nodejs npm &&\
    npm install -g yarn

ENTRYPOINT [ "/app/entrypoint.sh" ]

CMD [ "rails", "s", "-b", "0.0.0.0" ]

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install --path=vendor/bundle --binstubs=vendor/bin

COPY package.json package.json
COPY yarn.lock yarn.lock
RUN yarn

COPY . .
