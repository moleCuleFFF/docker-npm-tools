# Stops the script from closing the window when its finished executing
param ( $Show )
if ( !$Show ) 
{
    PowerShell -NoExit -File $MyInvocation.MyCommand.Path 1
    return
}

# Give us a simple function that can start the Docker Container with the NPM tools inside
function run-npm-tools {
    docker run --rm -i -t --volume ${pwd}:/app schodemeiss/npm-tools @args
}

# Create some functions to call our tools
function bower {
    run-npm-tools bower @args
}

function gulp {
    run-npm-tools gulp @args
}

function grunt {
    run-npm-tools grunt @args
}

function webpack {
    run-npm-tools webpack @args
}

function browserify {
    run-npm-tools browserify @args
}

function mocha {
    run-npm-tools mocha @args
}

function phpmd {
    run-npm-tools phpmd @args
}