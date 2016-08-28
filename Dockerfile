FROM debian:jessie
MAINTAINER Andrew Barlow <andrew.barlow@gmail.com>

# Lets try and be as non-interactive as possible
ENV DEBIAN_FRONTEND noninteractive

# Grab the requirements of Node
RUN apt-get update \
    && apt-get install -y \
    build-essential \
    curl \
    && curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean\
    && apt-get autoremove \
    && rm -r /var/lib/apt/lists/*

# Fix bug https://github.com/npm/npm/issues/9863
RUN cd $(npm root -g)/npm \
    && npm install fs-extra \
    && sed -i -e s/graceful-fs/fs-extra/ -e s/fs\.rename/fs.move/ ./lib/utils/rename.js

# Install NPM globally
RUN /usr/bin/npm install --global npm

# Now install some tools, globally of course
RUN /usr/bin/npm install --global bower gulp-cli grunt-cli webpack browserify mocha

# Set up the working directory
WORKDIR /app

# Default action is to NPM install and then run the default gulp task
CMD /usr/bin/npm -q install || true && gulp || true