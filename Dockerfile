FROM ruby:3.2

# Install Linux/Rails dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn

# Set working directory
WORKDIR /docker_app

# Install Ruby gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy app files
COPY . .

# Copy and make entrypoint executable
COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/usr/bin/entrypoint.sh"]

# Default command (rails server)
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
