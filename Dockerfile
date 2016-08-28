FROM debian:jessie
MAINTAINER Andrew Barlow <andrew.barlow@gmail.com>

# Lets try and be as non-interactive as possible
ENV DEBIAN_FRONTEND noninteractive

# Grab the requirements of Node
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    curl && \
    curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && \
    apt-get autoremove && \
    dpkg -l | grep '^rc' | awk '{print $2}' | xargs dpkg --purge && \
    rm -r /var/lib/apt/lists/*

# Install NPM globally, along with some friendly tools
RUN /usr/bin/npm install --global npm && \
    /usr/bin/npm install --global bower gulp-cli grunt-cli webpack browserify mocha

# Set up the working directory
WORKDIR /app

# Default action is to NPM install and then run the default gulp task
CMD /usr/bin/npm -q install && gulp