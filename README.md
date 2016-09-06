[![](https://images.microbadger.com/badges/image/schodemeiss/npm-tools.svg)](http://microbadger.com/images/schodemeiss/npm-tools "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/schodemeiss/npm-tools.svg)](http://microbadger.com/images/schodemeiss/npm-tools "Get your own version badge on microbadger.com")

# Single Container NPM Tools
A collection of NPM tools to aid in the development and QA of Javascript/Web applications.

## Current Tools

* npm
* bower
* gulp
* grunt
* webpack
* browserify
* mocha

## Usage

You can simply call:

```
docker run --rm -it -v "$PWD":/app schodemeiss/npm-tools
```

By default this will run "npm install && gulp". IE: Install all packages inside the folders "packages.json" and then run the default gulp task if one exists.

You can call the tools by simply using:

```
docker run --rm -it -v "$PWD":/app schodemeiss/npm-tools bower install
```

This will run "bower" with the "install" argument.

Any of the other tools can be called with their respective usages.

## Helper Scripts
### Powershell
Coming Soon!

### Bash
Coming Soon!
