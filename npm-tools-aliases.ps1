# Stops the script from closing the window when its finished executing
param ( $Show )
if ( !$Show ) 
{
    PowerShell -NoExit -File $MyInvocation.MyCommand.Path 1
    return
}

# Give us a simple function that can start the Docker Container with the NPM tools inside
function run-npm-tools-root {
    docker run --rm -i -t --volume ${pwd}:/app schodemeiss/npm-tools @args
}

function run-npm-tools {
    docker run --rm -i -t --user app:app --volume ${pwd}:/app schodemeiss/npm-tools @args
}

# Create some functions to call our tools
function npm {
    run-npm-tools-root npm @args
}

function bower {
    run-npm-tools-root bower @args
}

function gulp {
    run-npm-tools-root gulp @args
}

function grunt {
    run-npm-tools-root grunt @args
}

function webpack {
    run-npm-tools-root webpack @args
}

function browserify {
    run-npm-tools-root browserify @args
}

function mocha {
    run-npm-tools-root mocha @args
}

function phpmd {
    run-npm-tools-root phpmd @args
}

function foundation {
    run-npm-tools foundation @args
}

