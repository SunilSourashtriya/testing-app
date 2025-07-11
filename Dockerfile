# Base image
FROM ruby:3.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn

# Create working directory
WORKDIR /docker_app

# Copy Gem files and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy everything else
COPY . .

# Copy and set permissions for entrypoint
COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/usr/bin/entrypoint.sh"]

# Start Rails
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
