FROM ruby:3.1.0

# Install system dependencies
RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs



# Set working directory
WORKDIR $APP_HOME

# Install gems
COPY Gemfile* $APP_HOME/
RUN gem install bundler
RUN bundle install

# Copy application files
COPY . $APP_HOME



# Start application
CMD ["ruby", "bot.rb"]
