# rails-6-docker

It's pain in the ass to create a rails project in windows

## Development
### Run rails
```bash
docker-compose up
docker-compose stop
docker-compose down
docker-compose exec app /bin/bash
docker-compose exec app rails db:create
docker-compose exec app rails db:migrate
```

### Stop

## How I created this
### Create Dockerfile
```Dockerfile
FROM ruby:2.6.5

WORKDIR /app

EXPOSE 3000

RUN gem install rails && 
    apt-get update -qq &&
    apt-get install -y nodejs npm &&
    npm install -g yarn

ENTRYPOINT [ "/bin/bash" ]

```

### Create docker-compose.yml
```yaml
version: "3.7"

services:
  app:
    build: .
    ports:
      - "3000:3000"
    volumes:
      - ./:/app
```

### Create rails
#### Go inside docker
```bash
docker-compose run --rm --service-ports app
```

#### Create rails
```bash
rails new tmp2 && mv tmp2/* ./ && rm tmp2
bundle update && bundle install --path=vendor/bundle --binstubs=vendor/bin
rails webpacker:install
```

#### Test
```
rails s -p 3000 -b 0.0.0.0
```
