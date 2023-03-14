FROM ruby:3.1.0

# Install system dependencies
RUN apt-get update
RUN apt-get install -y \
    openssl

RUN gem install bundler

WORKDIR /app
COPY . /app/

RUN bundle install

# Start application
CMD ["ruby", "bot.rb"]
