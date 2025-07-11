# Base image
FROM ruby:3.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn

# Create working directory
WORKDIR /docker_app

# Copy Gem files and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy all other files
COPY . .

# Start Rails server and ensure no stale PID file
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails server -b 0.0.0.0 -p 3000"]
